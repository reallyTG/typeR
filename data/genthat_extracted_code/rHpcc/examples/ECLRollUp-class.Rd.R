library(rHpcc)


### Name: ECLRollUp-class
### Title: Class '"ECLRollUp"'
### Aliases: ECLRollUp-class

### ** Examples

  ## Not run: 
##D     ecl1 <- ECL$new(hostName="127.0.0.1", port="8008")
##D     recPerson <- ECLRecord$new(name="rec_person")
##D     recPerson$addField("STRING", "code")
##D     recPerson$addField("STRING", "firstName")
##D     recPerson$addField("STRING", "lastName")
##D     recPerson$addField("STRING", "address")
##D     recPerson$addField("STRING", "stateCode")
##D     recPerson$addField("STRING", "city")
##D     recPerson$addField("STRING", "zip")
##D     ecl1$add(recPerson)
##D     
##D     dsPerson <- ECLDataset$new(name="ds_person", datasetType = recPerson, 
##D                   logicalFileName ="~ds::person", fileType="CSV")
##D     ecl1$add(dsPerson)
##D     
##D     recPersonContact <- ECLRecord$new(name="rec_myRec")
##D     recPersonContact$addField(dsPerson$getName(), "firstName", seperator=".")
##D     recPersonContact$addField(dsPerson$getName(), "lastName", seperator=".")
##D     
##D     ecl1$add(recPersonContact)
##D     
##D     tblPerson <- ECLTable$new(name="LnameTable ", inDataset = dsPerson, 
##D                       format= recPersonContact)
##D     ecl1$add(tblPerson)
##D     
##D     sort <- ECLSort$new(name="sortedTable", inDataset = tblPerson)
##D     sort$addField("firstName")
##D     ecl1$add(sort)
##D     
##D     condition <- "LEFT.firstName = RIGHT.firstName"
##D     rollUp <- ECLRollUp$new(name="TransformPersons ", inDataset=sort, 
##D                   outECLRecord=recPersonContact, condition = condition);
##D     rollUp$addField("SELF", "LEFT");
##D     ecl1$add(rollUp)
##D     ecl1$print()
##D   
## End(Not run)



