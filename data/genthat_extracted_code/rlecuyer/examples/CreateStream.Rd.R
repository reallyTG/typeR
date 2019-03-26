library(rlecuyer)


### Name: CreateStream
### Title: Spawn new streams
### Aliases: .lec.CreateStream
### Keywords: distribution

### ** Examples

nstreams <- 10       # number of streams
names <- paste("mystream",1:nstreams,sep="")
.lec.CreateStream(names)
.lec.WriteStateFull(names)



