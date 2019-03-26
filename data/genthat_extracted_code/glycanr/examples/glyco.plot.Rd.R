library(glycanr)


### Name: glyco.plot
### Title: Plot data representing Glycans in boxplot or violin mode using
###   ggplot2
### Aliases: glyco.plot

### ** Examples

devAskNewPage(TRUE)
exampleData <- data.frame(ID=1:100, GP1=runif(100),
  GP2=rexp(100,0.2), GP3=rgamma(100, 3),
  Plate=factor(sample(1:2,100,replace=TRUE)))
glyco.plot(exampleData)
glyco.plot(exampleData, group='Plate', collapse=FALSE, log=TRUE)



