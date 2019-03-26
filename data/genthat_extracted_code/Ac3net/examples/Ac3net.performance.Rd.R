library(Ac3net)


### Name: Ac3net.performance
### Title: Find the performance of the first network based on the second.
### Aliases: Ac3net.performance
### Keywords: misc

### ** Examples

 # data(expdata)
 # data(truenet)
 # data(zeroindx) # zero indices for the example dataset, not in general.
 ## step by step to get Ac3net network
 # mim <- cor(t(expdata), method = "pearson")
 # mim[zeroindx, zeroindx] <- 0 #for the example dataset, not in general.
 # mim <- Ac3net.filtersames(mim=mim) #in case if there are same variables.
 #diag(mim) <-0
 #cutoff <- Ac3net.cutoff(mim, ratio_ = 0.002, PCmincutoff=0.6, PCmaxcutoff=0.96)
 #mim[abs(mim) < cutoff] <- 0
 #Ac3net.net <- Ac3net.maxmim(mim=mim, net_=TRUE, cutoff_= cutoff)
 ### one command could do the same as below if zeroindx was not available. ###
 ## ac3net.net <- Ac3net(DataOrMim=expdata, processed=FALSE, ratio_ = 0.002, PCmincutoff=0.6,
 #          PCmaxcutoff=0.96, cutoff=0, estmethod='pearson', pval=1, 
 #          iterations=10, MTC=FALSE, MTCmethod="BH" )
 
# performance <- Ac3net.performance(predictNet=ac3net.net, 
#                referenceNet = truenet, data_, directed=TRUE)
# performance



