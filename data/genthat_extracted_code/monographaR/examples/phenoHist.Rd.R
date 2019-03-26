library(monographaR)


### Name: phenoHist
### Title: Circular histograms of phenology
### Aliases: phenoHist

### ** Examples


## loading the example data

data(monographaR_examples)
monographaR_examples$phenoHist -> data
head(data)

## running the function

phenoHist(data, mfrow=c(2,2), shrink=1.2, axis.cex=1.5, title.cex=1.5, 
pdf=FALSE)

## changing the color

phenoHist(data, mfrow=c(2,2), shrink=1.2, axis.cex=1.5, title.cex=1.5, 
pdf=FALSE, flower.col=rgb(0.2,1,0.2, 0.5), flower.border=rgb(0.2,1,0.2, 
0.5), fruit.col="darkgreen", fruit.border="black")

## plotting only flower (if "fruit" and/or "both" information are 
## missing for instance)

phenoHist(data, mfrow=c(2,2), shrink=1.2, axis.cex=1.5, title.cex=1.5, 
pdf=FALSE, fruit="missing", both="missing", flower.col="red", 
flower.border="darkgray")




