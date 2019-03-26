library(spider)


### Name: dataStat
### Title: Taxa statistics
### Aliases: dataStat
### Keywords: Barcoding Utilities

### ** Examples


data(anoteropsis)
#Species vector
anoSpp <- sapply(strsplit(dimnames(anoteropsis)[[1]], split="_"), 
    function(x) paste(x[1], x[2], sep="_"))
#Genus vector
anoGen <-  sapply(strsplit(anoSpp, split="_"), function(x) x[1])
dataStat(anoSpp, anoGen)




