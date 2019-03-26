#Clean ethe Working Directory
#rm(list=ls())

#res<- generateBinomialLDA.rlda(seed0=5587, community=3,
#                               variables=10, observations=1000,
#                               totalElements=40, alpha0=0.1, alpha1=0.1)

#POP<-res$Pop
#DATA<-res$Data

###########################################################################################
#############################   GIBBS SAMPLING PROCEDURE    ###############################
###########################################################################################
alpha0<-0.01
alpha1<-0.01
gamma<-0.01
set.seed(9292)

#Estimate the parameters by Gibbs Sampling (Time difference of 23.31748 secs)
#start.time <- Sys.time()

#res<-rlda.binomial(as.data.frame(DATA), as.data.frame(POP), 4, alpha0, alpha1, gamma, 100, TRUE, TRUE)

#end.time <- Sys.time()
#time.taken <- end.time - start.time
#time.taken

#Get the logLikelihood with Priors
#logLikeli<-res$logLikelihood


