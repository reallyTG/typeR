library(rHpcc)


### Name: ECLProject
### Title: Creates an ECL "PROJECT" definition.
### Aliases: ECLProject

### ** Examples

  ## Not run: 
##D     ecl <- ECL$new(hostName="127.0.0.1")
##D     ecl$addImport("IMPORT STD;")
##D     person <- ECLRecord$new(name="Person")
##D     person$addField("STRING", "code")
##D     person$addField("STRING", "firstName")
##D     person$addField("STRING", "lastName")
##D     ecl$add(person)
##D     
##D     personOut <- ECLRecord$new(name="PersonOut")
##D     personOut$addField("STRING", "code")
##D     personOut$addField("STRING", "firstName")
##D     personOut$addField("STRING", "lastName")
##D     ecl$add(personOut)
##D     
##D     personDS <- ECLDataset$new(name="personDS", datasetType = person, 
##D                     logicalFileName ="~ds::person", fileType="CSV")
##D     ecl$add(personDS)
##D     
##D     personProject <- ECLProject$new(name="PersonProject", inDataset=personDS, 
##D                           outECLRecord=personOut);
##D     personProject$addField("SELF.firstName", "Std.Str.ToUpperCase(LEFT.firstName)");
##D     personProject$addField("SELF", "LEFT");
##D     ecl$add(personProject)
##D     outputProject <- ECLOutput$new(name="outputProject", def = personProject$getName())
##D     ecl$add(outputProject)
##D     ecl$print()
##D     xmlContent <- ecl$execute()
##D     data <- parseResults(xmlContent)
##D   
## End(Not run)



