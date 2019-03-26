library(rCAT)


### Name: ConBatch
### Title: Batch process, preliminary conservation assessments
### Aliases: ConBatch

### ** Examples

mydata <- read.csv(system.file("extdata","multiple_species.csv",package="rCAT"))
resultdf <- ConBatch(mydata$scientificname,mydata$latitude,mydata$longitude,2000,FALSE)




