library(mixedsde)


### Name: neuronal.data
### Title: Trajectories Interspike Of A Single Neuron Of A Ginea Pig
### Aliases: neuronal.data
### Keywords: datasets

### ** Examples

model <- "OU"
random <- c(1,2)
M <- 240     # number of trajectories, number of rows of the matrix of the data
T <- 0.3     # width of the interval of observation 
delta <- 0.00015   # step time
N <- T/delta  # number of points in the time interval 2000

data(neuronal.data)
# reduction of data for example to save running times
ind <- seq(1, 2000, by = 20)
X <- neuronal.data[[1]][1:100, ind]
times <- neuronal.data[[2]][ind]

# plot(times, X[10, ], type = 'l', xlab = 'time', ylab = '', col = 'blue', ylim = c(0,0.016))

random <- c(1,2)

#- nonparametric estimation
estim.method <- 'nonparam'
estim <- mixedsde.fit(times=times, X=X, model=model, random=random,  estim.method='nonparam') 

#- parametric estimation   
estim.method<-'paramML'
estim_param <- mixedsde.fit(times=times, X=X, model=model, random= random, estim.method= 'paramML')

#- implemented methods
# plot(estim); 
print(estim); #valid(estim)
print(estim_param); #plot(estim_param);  valid(estim_param)

#test1 <- pred(estim)
#test2 <- pred(estim_param) 

#- Other possible plots
par(mfrow=c(1,2))

outputsNP <-  out(estim)
outputsP <- out(estim_param)
fhat <- outputsNP$estimf
fhat_param <- outputsP$estimf 

gridf <- outputsNP$gridf
gridf1 <- gridf[1,]; gridf2 <- gridf[2,]
marg1 <- ((max(gridf2)-min(gridf2))/length(gridf2))*apply(fhat,1,sum) #with cutoff
marg2 <- ((max(gridf1)-min(gridf1))/length(gridf1))*apply(fhat,2,sum)
marg1_param <- ((max(gridf2)-min(gridf2))/length(gridf2))*apply(fhat_param,1,sum) 
marg2_param <- ((max(gridf1)-min(gridf1))/length(gridf1))*apply(fhat_param,2,sum)

plot(gridf1,marg1,type='l', col='red')
lines(gridf1,marg1_param, lwd=2, col='red')
plot(gridf2, marg2,type='l', col='red')
lines(gridf2,marg2_param, lwd=2, col='red')


# Bayesian
# reduction of data to save running time
estim_Bayes <- mixedsde.fit(times, X[1:20,], model = "OU", random = 1, 
              estim.method = "paramBayes", nMCMC = 100) 
plot(estim_Bayes)
pred_Bayes1 <- pred(estim_Bayes)
pred_Bayes2 <- pred(estim_Bayes, trajectories = TRUE)




