library(MCMC4Extremes)


### Name: summary.ggevp
### Title: Summarizing Posterior Distribution with Parameters of GGEV
### Aliases: summary.ggevp

### ** Examples

# Obtaining posterior distribution of a vector of simulated points
w=rggev(300,0.4,10,5,0.5)
# Obtaning 600 points of posterior distribution with delta=0.5
fit=ggevp(w,1,200,0.5)
a=summary(fit)

# Choice the best delta from a Grid of possible values as Nascimento et al. (2015)
## Not run: fitmeasures=summary(fit)$fitm
## Not run: delta=seq(0.1,2,0.2)
## Not run: results=array(0,c(length(delta),4))
## Not run: for (i in 1:length(delta))
## Not run:     {ajust=ggevp(w,1,200,delta[i])
## Not run:      results[i,]=summary(ajust)$fitm}

# As commented in Nascimento 2015 paper, a criteria to choice the best delta would be 
# create a grid of values of theta and choose the best according the lowest fit measures
## Not run: resultsb=cbind(delta,results)
## Not run: colnames(resultsb)=c("delta","AIC","BIC","pD","DIC")




