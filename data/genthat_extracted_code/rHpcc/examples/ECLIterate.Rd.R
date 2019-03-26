library(rHpcc)


### Name: ECLIterate
### Title: Creates an ECL "ITERATE" definition.
### Aliases: ECLIterate

### ** Examples

  ## Not run: 
##D     ecl1 <- ECL$new(hostName="192.168.217.128", port="8008")
##D     resType <- ECLRecord$new(name="rec_resType")
##D     resType$addField("INTEGER1", "Val")
##D     resType$addField("INTEGER1", "Rtot")
##D     ecl1$add(resType)
##D     
##D     dsRecords <- ECLDataset$new(name="ds_records", datasetType = resType, 
##D                     logicalFileName ="~ds::iterate", fileType="CSV")
##D     ecl1$add(dsRecords)
##D     
##D     iterate <- ECLIterate$new(name="ECLIterate", inDataset=dsRecords, 
##D                   outECLRecord=resType);
##D     iterate$addField("SELF.Rtot", "LEFT.Rtot+RIGHT.Val");
##D     iterate$addField("SELF", "RIGHT");
##D     ecl1$add(iterate)
##D     
##D     outputIterate <- ECLOutput$new(name="outputIterate", def = iterate$getName())
##D     ecl1$add(outputIterate)
##D     ecl1$print()
##D     
##D     xmlContent <- ecl1$execute()
##D     parseResults(xmlContent)
##D   
## End(Not run)



