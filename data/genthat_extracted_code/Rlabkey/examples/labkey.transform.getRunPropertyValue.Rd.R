library(Rlabkey)


### Name: labkey.transform.getRunPropertyValue
### Title: Assay transform script helper function to get a run property
###   value from a data.frame
### Aliases: labkey.transform.getRunPropertyValue

### ** Examples

## No test: 

# library(Rlabkey)

run.props = labkey.transform.readRunPropertiesFile("${runInfo}");
run.data.file = labkey.transform.getRunPropertyValue(run.props, "runDataFile");

## End(No test)



