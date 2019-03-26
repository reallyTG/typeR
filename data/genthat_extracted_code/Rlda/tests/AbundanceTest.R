#Clean ethe Working Directory
#rm(list=ls())
#library(Rlda)
#res<- generateMultinomialLDA.rlda(seed0=5587, community=4,
#                            variables=100, observations=1000, totalElements=40,
#                            beta=rep(1,100), gamma=0.01)


#FIA<-as.data.frame(res$Data)

###########################################################################################
#############################   GIBBS SAMPLING PROCEDURE    ###############################
###########################################################################################
#beta<-rep(1,100)
#gamma<-0.01
#set.seed(9292)


#Estimate the parameters by Gibbs Sampling (Time difference of 20.28974 secs)
#start.time <- Sys.time()

#res<-rlda.multinomial(as.data.frame(FIA), 4, beta, NA, 100,  FALSE, TRUE)
#res<-lda_multinomial_burn(FIA, 4, beta, NA, 1000, 50,  FALSE, TRUE)

#end.time <- Sys.time()
#time.taken <- end.time - start.time
#time.taken

#plot.rlda(res)



#Get the logLikelihood with Priors
#logLikeli<-res$logLikelihood


#Get the matrices in a list of coda objects
#listParms <- rlda2mcmc(res)
#thetaMCMC<-listParms[[1]]
#plot(thetaMCMC[,1])

#Example using coda package
#library(coda)

