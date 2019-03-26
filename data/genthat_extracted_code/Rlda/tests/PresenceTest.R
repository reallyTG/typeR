#Clean ethe Working Directory
#rm(list=ls())

#Generate fake data
#res<- generateBernoulliLDA.rlda(seed0=9292, community=3,
#                                variables=100, observations=1000,
#                                alpha0=0.01, alpha1=0.01, gamma=0.01)

#DATA<-res$Data

#Estimate the parameters by Gibbs Sampling (Time difference of 18.73626 secs)
#start.time <- Sys.time()

#res<-rlda.bernoulli(DATA, 4, alpha0, alpha1, gamma, 100, TRUE, TRUE)

#end.time <- Sys.time()
#time.taken <- end.time - start.time
#time.taken

#Get the logLikelihood with Priors
#logLikeli<-res$logLikelihood

