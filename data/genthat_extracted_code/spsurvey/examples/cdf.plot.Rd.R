library(spsurvey)


### Name: cdf.plot
### Title: Plot the CDF and Associated Confidence Limits
### Aliases: cdf.plot
### Keywords: survey distribution

### ** Examples

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
myanalysis <- cont.analysis(sites=mysites, subpop=mysubpop, design=mydesign,
   data.cont=mydata.cont, popsize=mypopsize)
par(mfrow=c(2,1))       
keep <- myanalysis$CDF$Type == "Resource.Class" & 
        myanalysis$CDF$Subpopulation == "Good"       
cdf.plot(myanalysis$CDF[keep,], xlbl="ContVar", ylbl="Percent of Stream Length",
   ylbl.r="Stream Length (km)", figlab="Estimates for Resource Class: Good")
keep <- myanalysis$CDF$Type == "Resource.Class" & 
        myanalysis$CDF$Subpopulation == "Poor"       
cdf.plot(myanalysis$CDF[keep,], xlbl="ContVar", ylbl="Percent of Stream Length",
   ylbl.r="Same", figlab="Estimates for Resource Class: Poor")



