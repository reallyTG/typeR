library(spsurvey)


### Name: cat.analysis
### Title: Categorical Data Analysis for Probability Survey Data
### Aliases: cat.analysis
### Keywords: survey univar

### ** Examples

# Categorical variable example for two resource classes:
mysiteID <- paste("Site", 1:100, sep="")
mysites <- data.frame(siteID=mysiteID, Active=rep(TRUE, 100))
mysubpop <- data.frame(siteID=mysiteID, All.Sites=rep("All Sites", 100),
   Resource.Class=rep(c("Good","Poor"), c(55,45)))
mydesign <- data.frame(siteID=mysiteID, wgt=runif(100, 10, 100),
   xcoord=runif(100), ycoord=runif(100), stratum=rep(c("Stratum1",
   "Stratum2"), 50))
mydata.cat <- data.frame(siteID=mysiteID, CatVar=rep(c("north", "south",
   "east", "west"), 25))
mypopsize <- list(All.Sites=c(Stratum1=3500, Stratum2=2000),
   Resource.Class=list(Good=c(Stratum1=2500, Stratum2=1500),
   Poor=c(Stratum1=1000, Stratum2=500)))
cat.analysis(sites=mysites, subpop=mysubpop, design=mydesign,
   data.cat=mydata.cat, popsize=mypopsize)

# Exclude category "south" from the analysis:
mysites <- data.frame(siteID=mysiteID, Active=rep(c(TRUE, FALSE, TRUE,
   TRUE), 25))
cat.analysis(sites=mysites, subpop=mysubpop, design=mydesign,
   data.cat=mydata.cat, popsize=mypopsize)



