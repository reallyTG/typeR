library(Rlabkey)


### Name: labkey.experiment.createData
### Title: Create an experiment data object
### Aliases: labkey.experiment.createData
### Keywords: IO

### ** Examples

## No test: 

library(Rlabkey)

## create a non-assay backed run with data classes as data inputs and outputs

d1 <- labkey.experiment.createData(
        list(name = "dc-01"), dataClassId = 400)
d2 <- labkey.experiment.createData(
        list(name = "dc-02"), dataClassId = 402)
run <- labkey.experiment.createRun(
        list(name="new run"), dataInputs = d1, dataOutputs = d2)
labkey.experiment.saveBatch(baseUrl="http://labkey/", folderPath="home",
        protocolName=labkey.experiment.SAMPLE_DERIVATION_PROTOCOL, runList=run)
## End(No test)



