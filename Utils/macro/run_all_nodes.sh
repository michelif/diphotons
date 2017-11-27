#!/bin/bash
#which=""
## _mjj_nodr

infile="/mnt/t3nfs01/data01/shome/micheli/HHbbgg_ETH_devel/outfiles/20170828_optimizedCuts_noDR_minDRGJet/Total_preselection_diffNaming_transformedMVA.root"

now=$(date '+%Y%m%d_%H%M%S')
echo $now

#for node in inputs/node_*.root; do name=$(basename $node | sed 's%.root%%'); 
for node in jsons_hh/node_*.json; do name=$(basename $node | sed 's%.json%%'); 
echo "------------------------------------------STARTING NODE -----------------------------------------------------"
echo $name
echo "-------------------------------------------------------------------------------------------------------------"
##hh version
## MVA boundaries optimization with fixed cut in MX and Mjj
#    ./categoryOptimizationMultiDim.py --load jsons_hh/optimize_hh_MVA.json --load $node --infile ${infile} --sigfile ${infile}  --label test_SM -o outPlots/out_${now}_${name}_transformed_MVA/

## MX boundaries optimization with optimized MVA boundaries and fixed cut in Mjj
#    ./categoryOptimizationMultiDim.py --load jsons_hh/optimize_hh_MX.json --load $node --infile ${infile} --sigfile ${infile}  --label test_SM -o outPlots/out_${now}_${name}_transformed_MX/

## MVA boundaries optimization with optimized MX boundaries and fixed cut in Mjj
#    ./categoryOptimizationMultiDim.py --load jsons_hh/optimize_hh_MVA_MXboundaries.json --load $node --infile ${infile} --sigfile ${infile}  --label test_SM -o outPlots/out_${now}_${name}_transformed_MVA_step2/

#for cat in cat0; do
    for cat in cat0 cat1 cat2 cat3 cat4 cat5 cat6 cat7 cat8; do
    	./categoryOptimizationMultiDim.py --load jsons_hh/optimize_mjj.json --infile ${infile} --sigfile ${infile}  --label $name -o outPlots/out_${now}_${name}_${cat}_transformed_mjj/ --load $cat.json --load $node
    done
#    wait



done

scp -r outPlots/out_${now}* lxplus.cern.ch:/afs/cern.ch/user/m/micheli/www/plots/HHBBGGOptimization/outPlots/

wait
