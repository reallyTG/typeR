library(spsurvey)


### Name: spsurvey.analysis
### Title: Create an Object of Class spsurvey.analysis
### Aliases: spsurvey.analysis
### Keywords: survey

### ** Examples

# Categorical variable example:
mysiteID <- paste("Site", 1:100, sep="")
mysites <- data.frame(siteID=mysiteID, Active=rep(TRUE, 100))
mysubpop <- data.frame(siteID=mysiteID, All.Sites=rep("All Sites", 100),
   Resource.Class=rep(c("Good","Poor"), c(55,45)))
mydesign <- data.frame(siteID=mysiteID, wgt=runif(100, 10,
   100), xcoord=runif(100), ycoord=runif(100), stratum= rep(c("Stratum1",
   "Stratum2"), 50))
mydata.cat <- data.frame(siteID=mysiteID, CatVar= rep(c("north", "south",
   "east", "west"), 25))
mypopsize <- list(All.Sites=c(Stratum1=3500, Stratum2=2000),
   Resource.Class=list(Good=c(Stratum1=2500, Stratum2=1500),
   Poor=c(Stratum1=1000, Stratum2=500)))
spsurvey.analysis(sites=mysites, subpop=mysubpop, design=mydesign,
   data.cat=mydata.cat, popsize=mypopsize)

# Continuous variable example - including deconvolution estimates:
mydesign <- data.frame(ID=mysiteID, wgt=runif(100, 10, 100),
   xcoord=runif(100), ycoord=runif(100), stratum=rep(c("Stratum1",
   "Stratum2"), 50))
ContVar <- rnorm(100, 10, 1)
mydata.cont <- data.frame(siteID=mysiteID, ContVar=ContVar,
   ContVar.1=ContVar + rnorm(100, 0, sqrt(0.25)),
   ContVar.2=ContVar + rnorm(100, 0, sqrt(0.50)))
mysigma <- c(ContVar=NA, ContVar.1=0.25, ContVar.2=0.50)
spsurvey.analysis(sites=mysites, subpop=mysubpop, design=mydesign,
   data.cont=mydata.cont, siteID=~ID, sigma=mysigma,
   popsize=mypopsize)



