library(AdapEnetClass)


### Name: plotObsEst
### Title: Pairwise scatter plots of the survival times
### Aliases: plotObsEst

### ** Examples

#For a hypothetical data
y<-c(12,33,22,34,11,23)
delta<-c(1,0,0,1,0,1)
yEst<-c(11,30,24,30,6,13)

#plotObsEst: scatter plotting of the pairwise survival times 
## No test: 
plot<-plotObsEst(y, yEst, delta, xlab = NULL, ylab = NULL, title = "Predicted 
versus Observed Survival times", legendplot = TRUE, legendpos = "topleft", 
maxvalue = NULL, minvalue = NULL)
## End(No test)



