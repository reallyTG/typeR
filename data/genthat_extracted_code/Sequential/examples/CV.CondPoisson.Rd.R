library(Sequential)


### Name: CV.CondPoisson
### Title: Critical values for continuous sequential CMaxSPRT for Poisson
###   data with limited information from historical cohort.
### Aliases: CV.CondPoisson
### Keywords: Continuous CmaxSPRT CV

### ** Examples


# Calculates the exact critical value with upper limit of
# K=20 and a delayed start of a minimum of 2 cases, historical
# data has 20 events, and for a statistical significance level
# of 0.05. 
# res<- CV.CondPoisson(Inference="exact", StopType="Cases",K=20,cc=20,
# M=2,alpha=0.05)

# which gives the results:
# res
# $Type_I_Error
# [1] 0.05
# $cv
# [1] 3.149115

# Calculates the liberal critical value with a uppe limit of
# T=0.5 and a delayed start of D=0.1, i.e., the cumulative
# person-time in the surveillance population is at least
# one-tenth of the total cumulative person-time in historical
# data, historical data has 20 events, and for a statistical
# significance level of 0.05. 
# res2<- CV.CondPoisson(Inference="liberal",StopType="Tal",T=0.5,cc=20,
# D=0.1,alpha=0.05)

# which gives the results:
# res2
# $Type_I_Error
# [1] 0.05
# $cv
# [1] 2.874993





