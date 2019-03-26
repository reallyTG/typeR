library(tframe)


### Name: earliestEnd
### Title: Start and End for Objects with Multiple Time Series
### Aliases: earliestEnd earliestEndIndex earliestEndIndex.default
###   earliestEndIndex.tframe earliestStart earliestStartIndex
###   earliestStartIndex.default earliestStartIndex.tframe latestEnd
###   latestEndIndex latestEndIndex.default latestEndIndex.tframe
###   latestStart latestStartIndex latestStartIndex.default
###   latestStartIndex.tframe
### Keywords: programming utilities ts chron

### ** Examples

    t1<-ts(c(1,2,3,4,5), start=c(1991,1))
    t2<-ts(c(2,3,4,5,6,7,8), start=c(1992,1))
    t3<-ts(c(NA,2,3,4,5), start=c(1991,1))

    latestStart(t1,t2,t3)  # 1992 1 corresponding to the starting date of 
                            # the object which starts latest (t2)
    latestStart(t1,t3)     # both start in 1991 1 (NAs count as data)
    latestStart(tbind(t1,t2,t3)) # tbind gives a single object starting in 1991 1
    latestStart(t2, tbind(t1,t2,t3))

    latestStartIndex(t1,t2,t3)  # position of t2 in the argument list



