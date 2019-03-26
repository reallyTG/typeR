library(Rlabkey)


### Name: labkey.domain.createAndLoad
### Title: Create a new LabKey domain and load data
### Aliases: labkey.domain.createAndLoad
### Keywords: IO

### ** Examples

## No test: 

library(Rlabkey)

## Prepare a data.frame
participants = c("0001","0001","0002","0002","0007","0008")
Visit = c("V1", "V2", "V2", "V1", "V2", "V1")
IntValue = c(256:261)
dataset = data.frame("ParticipantID" = participants, Visit,
    "IntegerValue" = IntValue, check.names = FALSE)

## Create the dataset and import
labkey.domain.createAndLoad(baseUrl="http://labkey", folderPath="home",
    name="demo dataset", df=dataset, domainKind="StudyDatasetVisit")
## End(No test)



