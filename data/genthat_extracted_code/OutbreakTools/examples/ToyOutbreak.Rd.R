library(OutbreakTools)


### Name: ToyOutbreak
### Title: Simulated outbreak dataset
### Aliases: ToyOutbreak
### Keywords: dataset

### ** Examples


## Load data ##
data(ToyOutbreak)

## Overview of the dataset ##
summary(ToyOutbreak)

## Plotting the dynamic contact network ##
par(mfrow=c(2,2))
plot(get.contacts(ToyOutbreak),main="Contact network - days 0-3",
     displaylabels=TRUE)
plot(get.contacts(ToyOutbreak, from=0, to=1.1),
     main="Contact network - days 0-1", displaylabels=TRUE)
plot(get.contacts(ToyOutbreak, from=2, to=2.1),
     main="Contact network - day 2", displaylabels=TRUE)
plot(get.contacts(ToyOutbreak, from=3, to=3.1),
     main="Contact network - day 3", displaylabels=TRUE)

## Not run: 
##D ## Mapping the outbreak (by sex) ##
##D plot(ToyOutbreak,'geo',location=c('lon','lat'), zoom=13,
##D      colorBy='Sex')
## End(Not run)



