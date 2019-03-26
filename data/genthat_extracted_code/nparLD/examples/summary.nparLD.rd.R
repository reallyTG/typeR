library(nparLD)


### Name: summary.nparLD
### Title: Object Summary for nparLD
### Aliases: summary summary.nparLD
### Keywords: htest

### ** Examples


## Example with the "Panic disorder study I" data (LD-F1 design) ##
data(panic)
ex.f1.np<-nparLD(resp~time, data=panic, subject="subject", description=FALSE, 
order.warning=FALSE)
summary.nparLD(ex.f1.np)

#Model: 
#LD F1 Model 
 
#Call: 
#resp ~ time

#Relative Treatment Effect (RTE):
#      RankMeans Nobs       RTE
#time0  66.09375   16 0.8199219
#time2  50.50000   16 0.6250000
#time4  41.28125   16 0.5097656
#time6  25.62500   16 0.3140625
#time8  19.00000   16 0.2312500

#Wald-Type Statistc (WTS):
#     Statistic df    p-value
#time  126.6946  4 1.9822e-26

#ANOVA-Type Statistc (ATS):
#     Statistic       df      p-value
#time  36.93664 2.234135 1.975781e-18



