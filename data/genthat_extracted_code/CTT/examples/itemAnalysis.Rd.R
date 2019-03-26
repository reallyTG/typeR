library(CTT)


### Name: itemAnalysis
### Title: Function for item reliability analysis
### Aliases: itemAnalysis
### Keywords: misc

### ** Examples


# Scored input (data frame is preferred)
 x<-data.frame(matrix(c(0,0,0,0,0,
                        0,0,0,0,0,
                        0,0,0,0,1,
                        0,0,0,1,1,
                        0,0,1,1,1,
                        0,1,1,1,1,
                        1,1,1,1,1,
                        1,0,1,1,1,
                        0,0,0,1,1,
                        0,1,1,1,1),nrow=10,ncol=5,byrow=TRUE,
                        dimnames=list(c(paste("P",c(1:10),sep="")),c(paste("I",c(1:5),sep="")))))
itemAnalysis(x)

# To see an item report with flags.
iA <- itemAnalysis(x, hardFlag=.25, pBisFlag=.15)
iA$itemReport

# To see more item statisitics
str(itemAnalysis(x))




