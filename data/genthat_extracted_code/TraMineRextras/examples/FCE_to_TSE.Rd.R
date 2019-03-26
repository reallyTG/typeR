library(TraMineRextras)


### Name: FCE_to_TSE
### Title: Data conversion from Fixed Column Event format to TSE.
### Aliases: FCE_to_TSE
### Keywords: data format

### ** Examples

## Generate a ramdom data set
fce <- data.frame(id=1:100, event1=runif(100), event2=runif(100))

## Add missing values (ie non-occurrences)
fce[runif(100)<0.1, "event1"] <- NA
fce[runif(100)<0.1, "event2"] <- NA

tse <- FCE_to_TSE(fce, id="id", cols=c("event1", "event2"),
       eventlist=c("Marriage", "Child birth"), firstEvent="Birth")

seq <- seqecreate(tse)
print(seq[1:10])




