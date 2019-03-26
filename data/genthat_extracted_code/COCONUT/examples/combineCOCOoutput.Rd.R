library(COCONUT)


### Name: combineCOCOoutput
### Title: Combine COCONUT output from multiple objects into a single
###   object
### Aliases: combineCOCOoutput

### ** Examples

data(GSEs.test)

## apply COCONUT to a very small test case
## (3 datasets with 10 patients and 2000 genes)
GSEs.COCONUT <- COCONUT(GSEs=GSEs.test,
                        control.0.col="Healthy0.Sepsis1",
                        byPlatform=FALSE)

## combine output
GSEs.COCO.combined <- combineCOCOoutput(GSEs.COCONUT)
str(GSEs.COCO.combined)




