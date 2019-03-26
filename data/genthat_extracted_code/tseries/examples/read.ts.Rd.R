library(tseries)


### Name: read.ts
### Title: Read Time Series Data
### Aliases: read.ts
### Keywords: file ts

### ** Examples

data(sunspots)
st <- start(sunspots)
fr <- frequency(sunspots)
write(sunspots, "sunspots", ncolumns=1)
x <- read.ts("sunspots", start=st, frequency=fr)
plot(x)
unlink("sunspots")



