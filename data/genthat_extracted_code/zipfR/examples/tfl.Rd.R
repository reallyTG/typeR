library(zipfR)


### Name: tfl
### Title: Type Frequency Lists (zipfR)
### Aliases: tfl tfl.object
### Keywords: classes

### ** Examples


## typically, you will read a tfl from a file
## (see examples in the read.tfl manpage)

## or you can load a ready-made tfl
data(Brown.tfl)
summary(Brown.tfl)
print(Brown.tfl)

## or create it from a spectrum (with different ids and
## no type labels)
data(Brown.spc)

Brown.tfl2 <- spc2tfl(Brown.spc)

## same frequency information as Brown.tfl
## but with different ids and no type labels
summary(Brown.tfl2)
print(Brown.tfl2)

## how to display draw a Zipf's rank/frequency plot
## by extracting frequencies from a tfl
plot(sort(Brown.tfl$f,decreasing=TRUE),log="y",xlab="rank",ylab="frequency")

## simulating a tfl
Zipfian.tfl <- tfl(1000/(1:1000))
plot(Zipfian.tfl$f,log="y")




