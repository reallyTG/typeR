library(xpose4)


### Name: xlabel
### Title: Extract and set labels for Xpose data items.
### Aliases: xlabel xlabel<-
### Keywords: methods

### ** Examples


xpdb <- simpraz.xpdb

## Display label for dependent variable in the Xpose data object
xlabel("DV", xpdb)

## Set label for dependent variable
xlabel(xpdb) <- c("DV", "Concentration (mg/L)")
xlabel("DV", xpdb) # how has this chnaged?



