library(rHpcc)


### Name: ECLDistribute
### Title: Creates an ECL "DISTRIBUTE" definition.
### Aliases: ECLDistribute

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
##D     condition <- "SKEW(0.1)"
##D     distribute <- ECLDistribute$new(inECLRecord=recPerson, condition=condition)
##D     ecl1$add(distribute)
##D     ecl1$print()
##D    
## End(Not run)



