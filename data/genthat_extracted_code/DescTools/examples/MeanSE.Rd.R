library(DescTools)


### Name: MeanSE
### Title: Standard Error of Mean
### Aliases: MeanSE
### Keywords: univar

### ** Examples

data(d.pizza)

MeanSE(d.pizza$price, na.rm=TRUE)

# evaluate data.frame
sapply(d.pizza[,1:4], MeanSE, na.rm=TRUE)



