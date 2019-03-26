library(extfunnel)


### Name: extfunnel
### Title: Additional Funnel Plot Augmentations
### Aliases: extfunnel
### Keywords: Meta-analysis Funnel plot graph

### ** Examples


#load package once installed
library(extfunnel)

####Example 1: statistical significance contours

#common effect estimate of each study (difference in the epworth score)
SS<-c(0, 4, -0.4, 0.9)

#corresponding standard errors of each study effect estimate (SS)
seSS<-c(0.566, 1.158, 0.939, 1.332)

#plots a funnel plot including statistical significance contours (contour=TRUE) 
#and summary diamond (summ=TRUE)
extfunnel(SS, seSS, method="fixed", plot.summ=TRUE, plot.zero=TRUE, zero=0, 
   xlab="Difference in Epworth Score", contour.points=50, contour=TRUE, 
   summ=TRUE, legend=FALSE, ylim=c(1.7,0), xlim=c(-2,5), legendpos=c(5.2,0))

####Example 2: heterogeneity contours

#common effect estimate of each study (log risk ratios)
#Note: risk ratios should be log-transofrmed before input in the extfunnel() function
SS<-c(-1.95, -1.42, -2.03, -0.93, 0.024)

#corresponding standard errors of each study effect estimate (SS)
seSS<-c(1.021, 1.088, 0.718, 0.536, 0.673)

#plots a funnel plot including heterogeneity contours with the following 
#I-Squared values:  6.5%, 15%, 40% and the current I-Squared value of 24.8%
extfunnel(SS, seSS, method="fixed", plot.summ=TRUE, plot.zero=TRUE, zero=0, 
   xlab="Risk Ratio", contour.points=200, contour=FALSE, summ=FALSE, 
   legend=TRUE, xlim=c(-3,1), expxticks=c(0.05,0.1,0.25,0.5,1,2,4), 
   isquared=c(6.5,15,40,-1), ylim=c(1.4,0))




