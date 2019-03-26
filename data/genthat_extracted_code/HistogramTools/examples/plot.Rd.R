library(HistogramTools)


### Name: PlotLog2ByteEcdf
### Title: Plot Binned Histogram and ECDF Data.
### Aliases: PlotLog2ByteEcdf PlotLogTimeDurationEcdf

### ** Examples

filename <- system.file("unitTests/data/buildkernel-readsize-dtrace.txt",
                         package="HistogramTools")
dtrace.hists <- ReadHistogramsFromDtraceOutputFile(filename)
x <- SubsetHistogram(dtrace.hists[["TOTAL"]], minbreak=1)
PlotLog2ByteEcdf(x, cex.lab=1.4)

x <- rexp(100000)
x <- x*(86400*300)/diff(range(x))

n <- as.integer(1+log2(max(x)))

h <- hist(x, breaks=c(0, unique(as.integer(2^seq(from=0, to=n, by=.25)))))
PlotLogTimeDurationEcdf(h)



