library(spsurvey)


### Name: cont.analysis
### Title: Continuous Data Analysis for Probability Survey Data
### Aliases: cont.analysis
### Keywords: survey distribution univar

### ** Examples

# Continuous variable example:
mysiteID <- paste("Site", 1:100, sep="")
mysites <- data.frame(siteID=mysiteID, Active=rep(TRUE, 100))
mysubpop <- data.frame(siteID=mysiteID, All.Sites=rep("All Sites",100),
   Resource.Class=rep(c("Good","Poor"), c(55,45)))
mydesign <- data.frame(siteID=mysiteID, wgt=runif(100, 10, 100),
   xcoord=runif(100), ycoord=runif(100), stratum=rep(c("Stratum1",
   "Stratum2"), 50))
ContVar <- rnorm(100, 10, 1)
mydata.cont <- data.frame(siteID=mysiteID, ContVar=ContVar)
mypopsize <- list(All.Sites=c(Stratum1=3500, Stratum2=2000),
   Resource.Class=list(Good=c(Stratum1=2500, Stratum2=1500),
   Poor=c(Stratum1=1000, Stratum2=500)))
cont.analysis(sites=mysites, subpop=mysubpop, design=mydesign,
   data.cont=mydata.cont, popsize=mypopsize)

# Include deconvolution estimates:
mydata.cont <- data.frame(siteID=mysiteID, ContVar=ContVar,
   ContVar.1=ContVar + rnorm(100, 0, sqrt(0.25)),
   ContVar.2=ContVar + rnorm(100, 0, sqrt(0.50)))
mysigma <- c(NA, 0.25, 0.50)
names(mysigma) <- c("ContVar", "ContVar.1", "ContVar.2")
cont.analysis(sites=mysites, subpop=mysubpop[,1:2], design=mydesign,
   data.cont=mydata.cont, sigma=mysigma, popsize=mypopsize[1])



