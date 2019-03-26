library(TSMining)


### Name: Func.dist
### Title: A function to calculate the distance between two SAX
###   representations
### Aliases: Func.dist

### ** Examples

#Assuming the original time series has a length of 20, n=20
#Assuming the time series is transformed into SAX representations using w=4 and a=4
#Assuming one is a,b,c,d and the other is d,b,c,d
Func.dist(x=c("a","b","c","d"), y=c("d","b","c","d"), mat=Func.matrix(a=4), n=20)



