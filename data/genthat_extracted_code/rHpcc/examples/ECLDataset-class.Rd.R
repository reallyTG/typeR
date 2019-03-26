library(rHpcc)


### Name: ECLDataset-class
### Title: Class '"ECLDataset"'
### Aliases: ECLDataset-class
### Keywords: classes

### ** Examples

  ## Not run: 
##D     ecl1 <- ECL$new(hostName="127.0.0.1")
##D     recPerson <- ECLRecord$new(name="Person")
##D     recPerson$addField("STRING", "code")
##D     recPerson$addField("STRING", "firstName")
##D     recPerson$addField("STRING", "lastName")
##D     recPerson$addField("STRING", "address")
##D     recPerson$addField("STRING", "stateCode")
##D     recPerson$addField("STRING", "city")
##D     recPerson$addField("STRING", "zip")
##D     ecl1$add(recPerson)
##D     dsPerson <- ECLDataset$new(name="ds_person", datasetType = recPerson, 
##D         logicalFileName ="~ds::person", fileType="CSV")
##D     ecl1$add(dsPerson)
##D   
## End(Not run)



