library(spsurvey)


### Name: cont.cdftest
### Title: Cumulative Distribution Function Inference for Probability
###   Survey Data
### Aliases: cont.cdftest
### Keywords: survey distribution

### ** Examples

n <- 200
mysiteID <- paste("Site", 1:n, sep="")
mysites <- data.frame(siteID=mysiteID, Active=rep(TRUE, n))
mysubpop <- data.frame(siteID=mysiteID,  Resource_Class=sample(c("Agr",
  "Forest", "Urban"), n, replace=TRUE))
mydesign <- data.frame(siteID=mysiteID, wgt=runif(n, 10, 100),
  xcoord=runif(n), ycoord=runif(n), stratum=rep(c("Stratum1",
  "Stratum2"), n/2))
mypopsize <- list(Resource_Class=list(Agr=c(Stratum1=2500, Stratum2=1500),
  Forest=c(Stratum1=1000, Stratum2=500), Urban=c(Stratum1=600, Stratum2=450)))
ContVar <- numeric(n)
tst <- mysubpop$Resource_Class == "Agr"
ContVar[tst] <- rnorm(sum(tst), 10, 1)
tst <- mysubpop$Resource_Class == "Forest"
ContVar[tst] <- rnorm(sum(tst), 10.1, 1)
tst <- mysubpop$Resource_Class == "Urban"
ContVar[tst] <- rnorm(sum(tst), 10.5, 1)
mydata.cont <- data.frame(siteID=mysiteID, ContVar=ContVar)
cont.cdftest(sites=mysites, subpop=mysubpop, design=mydesign,
  data.cont=mydata.cont, popsize=mypopsize, testname="Mean_Eigenvalue")



