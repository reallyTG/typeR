library(rlecuyer)


### Name: uniform
### Title: Generate random numbers
### Aliases: .lec.uniform .lec.uniform.int
### Keywords: distribution

### ** Examples

nstreams <- 10       # number of streams
seed<-rep(1,6)
.lec.SetPackageSeed(seed)
names <- paste("mystream",1:nstreams,sep="")
.lec.CreateStream(names)
for (i in 1:nstreams)   # generate 10 RNs from each stream
      print(.lec.uniform(names[i],10))
.lec.DeleteStream(names)



