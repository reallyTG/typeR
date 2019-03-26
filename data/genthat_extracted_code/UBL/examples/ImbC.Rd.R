library(UBL)


### Name: ImbC
### Title: Synthetic Imbalanced Data Set for a Multi-class Task
### Aliases: ImbC
### Keywords: datasets

### ** Examples

require(ggplot2)
data(ImbC)
summary(ImbC)
ggplot(data=ImbC, aes(x=X2, y=X1, color=Class))+geom_jitter()



