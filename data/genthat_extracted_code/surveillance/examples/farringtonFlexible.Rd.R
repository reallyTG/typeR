library(surveillance)


### Name: farringtonFlexible
### Title: Surveillance for an univariate count data time series using the
###   improved Farrington method described in Noufaily et al. (2012).
### Aliases: farringtonFlexible
### Keywords: classif classif

### ** Examples


### DATA I/O ###
#Read Salmonella Agona data
data("salmonella.agona")

# Create the corresponding sts object from the old disProg object
salm <- disProg2sts(salmonella.agona)

### RUN THE ALGORITHMS WITH TWO DIFFERENT SETS OF OPTIONS ###           
# Farrington with old options
control1 <-  list(range=(260:312),
                  noPeriods=1,populationOffset=FALSE,
                  fitFun="algo.farrington.fitGLM.flexible",
                  b=4,w=3,weightsThreshold=1,
                  pastWeeksNotIncluded=3,
                  pThresholdTrend=0.05,trend=TRUE,
                  thresholdMethod="delta",alpha=0.1)
control2 <- list(range=(260:312),
                 noPeriods=10,populationOffset=FALSE,
                 fitFun="algo.farrington.fitGLM.flexible",
                 b=4,w=3,weightsThreshold=2.58,
                 pastWeeksNotIncluded=26,
                 pThresholdTrend=1,trend=TRUE,
                 thresholdMethod="delta",alpha=0.1)
salm1 <- farringtonFlexible(salm,control=control1)
salm2 <- farringtonFlexible(salm,control=control2)

### PLOT THE RESULTS ###
y.max <- max(upperbound(salm1),observed(salm1),upperbound(salm2),na.rm=TRUE)
 
plot(salm1, ylim=c(0,y.max), main='S. Newport in Germany', legend.opts=NULL)
lines(1:(nrow(salm1)+1)-0.5, 
      c(upperbound(salm1),upperbound(salm1)[nrow(salm1)]),
      type="s",col='tomato4',lwd=2)
lines(1:(nrow(salm2)+1)-0.5, 
      c(upperbound(salm2),upperbound(salm2)[nrow(salm2)]),
      type="s",col="blueviolet",lwd=2)

legend(0, 10, legend=c('Alarm','Upperbound with old options',
                       'Upperbound with new options'),
       pch=c(24,NA,NA),lty=c(NA,1,1),
       bg="white",lwd=c(2,2,2),col=c('red','tomato4',"blueviolet"))



