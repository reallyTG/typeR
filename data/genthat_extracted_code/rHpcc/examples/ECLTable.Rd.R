library(rHpcc)


### Name: ECLTable
### Title: Creates an ECL "TABLE" definition.
### Aliases: ECLTable

### ** Examples

  ## Not run: 
##D       ecl1 <- ECL$new(hostName="127.0.0.1")
##D       recPerson <- ECLRecord$new(name="rec_person")
##D       recPerson$addField("STRING", "code")
##D       recPerson$addField("STRING", "firstName")
##D       recPerson$addField("STRING", "lastName")
##D       recPerson$addField("STRING", "address")
##D       recPerson$addField("STRING", "stateCode")
##D       recPerson$addField("STRING", "city")
##D       recPerson$addField("STRING", "zip")
##D       ecl1$add(recPerson)
##D       
##D       dsPerson <- ECLDataset$new(name="ds_person", datasetType = recPerson, 
##D                   logicalFileName ="~ds::person", fileType="CSV")
##D       ecl1$add(dsPerson)
##D       
##D       recPersonTable <- ECLRecord$new(name="personNewTableFormat")
##D       recPersonTable$addField(dsPerson$getName(), "code", seperator=".")
##D       recPersonTable$addField(dsPerson$getName(), "firstName", seperator=".")
##D       recPersonTable$addField(dsPerson$getName(), "lastName", seperator=".")
##D       
##D       ecl1$add(recPersonTable)
##D       
##D       tblPerson <- ECLTable$new(name="PersonNewTable", inDataset = dsPerson, 
##D                       format= recPersonTable)
##D       ecl1$add(tblPerson)
##D    
## End(Not run)



