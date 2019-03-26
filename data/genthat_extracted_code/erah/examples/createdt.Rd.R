library(erah)


### Name: createdt
### Title: Creating Experiment Tables
### Aliases: createdt

### ** Examples

## No test: 
# Store all the raw data files in one different folder per class,
# and all the class-folders in one folder, which is the experiment
# folder. Then execute

createdt(path)

# where path is the experiment folder path.
# The experiment can be now startd by:

ex <- newExp(instrumental="path/DEMO_inst.csv", 
phenotype="path/DEMO_pheno.csv", info="DEMO Experiment")

## End(No test)



