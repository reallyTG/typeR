library(netCoin)


### Name: surCoin
### Title: Networked coincidences from a data frame.
### Aliases: surCoin

### ** Examples

# A data frame with two variables Gender and Opinion
frame<-data.frame(Gender=c(rep("Man",3),rep("Woman",3)),
                  Opinion=c("Yes","Yes","No","No","No","Yes"))
surCoin(frame,commonlabel="") # network object



