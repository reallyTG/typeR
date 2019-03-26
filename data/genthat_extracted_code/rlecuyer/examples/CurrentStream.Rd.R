library(rlecuyer)


### Name: CurrentStream
### Title: Set/unset the current stream
### Aliases: .lec.CurrentStream .lec.CurrentStreamEnd
### Keywords: distribution

### ** Examples

nstreams <- 10       # number of streams
names <- paste("mystream",1:nstreams,sep="")
.lec.CreateStream(names)
for (i in 1:nstreams) {  # generate 10 RNs from each stream
   .lec.CurrentStream(names[i])
   print(paste("stream no.",i))
   print(runif(10))
   .lec.CurrentStreamEnd()
}



