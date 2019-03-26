library(riverdist)


### Name: buildsegroutes
### Title: Build Segment Routes
### Aliases: buildsegroutes

### ** Examples

data(abstreams)
plot(x=abstreams)
abstreams1 <- abstreams
abstreams1$segroutes <- NULL #taking out the $segroutes component

# before
tstart <- Sys.time()
detectroute(start=120, end=111, rivers=abstreams1)
Sys.time() - tstart

# after
tstart <- Sys.time()
detectroute(start=120, end=111, rivers=abstreams)
Sys.time() - tstart



