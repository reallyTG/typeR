library(rHpcc)


### Name: ECL
### Title: The base class that generates the ECL(Enterprise Control
###   Language) code.
### Aliases: ECL

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
##D   
## End(Not run)



