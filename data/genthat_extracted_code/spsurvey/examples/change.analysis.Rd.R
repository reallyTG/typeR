library(spsurvey)


### Name: change.analysis
### Title: Change Analysis for Probability Survey Data
### Aliases: change.analysis
### Keywords: survey univar

### ** Examples

# Categorical variable example for three resource classes:
mysiteID <- paste("Site", 1:200, sep="")
mysites <- data.frame(siteID=mysiteID,
                      Survey1=rep(c(TRUE, FALSE), c(100,100)),
                      Survey2=rep(c(FALSE, TRUE), c(100,100)))
myrepeats <- data.frame(siteID_1=paste("Site", 1:40, sep=""),
                        siteID_2=paste("Site", 101:140, sep=""))
mysubpop <- data.frame(siteID=mysiteID,
                       All_Sites=rep("All Sites", 200),
                       Region=rep(c("North","South"), 100))
mydesign <- data.frame(siteID=mysiteID,
                       wgt=runif(200, 10, 100),
                       xcoord=runif(200),
                       ycoord=runif(200),
                       stratum=rep(rep(c("Stratum1", "Stratum2"), c(2,2)), 50))
mydata.cat <- data.frame(siteID=mysiteID,
                         Resource_Class=sample(c("Good","Fair","Poor"),
                            200, replace=TRUE))
change.analysis(sites=mysites, repeats=myrepeats, subpop=mysubpop,
   design=mydesign, data.cat=mydata.cat, data.cont=NULL)



