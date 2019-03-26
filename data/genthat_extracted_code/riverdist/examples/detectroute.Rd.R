library(riverdist)


### Name: detectroute
### Title: Detect Route
### Aliases: detectroute

### ** Examples

data(Gulk)
plot(x=Gulk, cex=1)

detectroute(start=6, end=14, rivers=Gulk)

tstart <- Sys.time()
detectroute(start=120, end=111, rivers=abstreams, algorithm="sequential")
tend <- Sys.time()
tend - tstart

data(abstreams)
tstart <- Sys.time()
detectroute(start=120, end=111, rivers=abstreams, algorithm="Dijkstra")
tend <- Sys.time()
tend - tstart

tstart <- Sys.time()
detectroute(start=120, end=111, rivers=abstreams, algorithm="segroutes")
tend <- Sys.time()
tend - tstart



