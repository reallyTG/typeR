library(supcluster)


### Name: concordmap
### Title: Calculate the Frequency with which each Pair of Features are in
###   the Same Cluster
### Aliases: concordmap
### Keywords: cluster

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
#NOTE: only a small number of MCMC iterations are done due to time constraints
dat=generate.cluster.data(.2,npats=40,clusts=c(12,8,5),
                sig=1,gamma=1,beta=c(-5,0,6))
us=supcluster(dat,outcome="outcome",features=1:25,maxclusters=4,nstart=20,n=40,nchains=2)
ts1=concordmap(us,chains=1)
#plot of the concord map
image(1:25,1:25,ts1$map)




