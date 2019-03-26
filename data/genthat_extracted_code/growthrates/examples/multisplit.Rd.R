library(growthrates)


### Name: multisplit
### Title: Split Data Frame into Multiple Groups
### Aliases: multisplit multisplit,data.frame,formula-method
###   multisplit,data.frame,character-method
###   multisplit,data.frame,factor-method multisplit,data.frame,list-method
###   multisplit,ANY,ANY-method
### Keywords: internal

### ** Examples



data(bactgrowth)

## simple method
spl <- multisplit(bactgrowth, c("strain", "conc", "replicate"))

## preferred method
spl <- multisplit(bactgrowth, value ~ time | strain + conc + replicate)

## show what is in one data set
spl[[1]]
summary(spl[[1]])

## use factor combination
spl[["D:0:1"]]
summary(spl[["D:0:1"]])


lapply(spl, FUN=function(x)
 plot(x$time, x$value,
      main=paste(x[1, "strain"], x[1, "conc"], x[1, "replicate"], sep=":")))





