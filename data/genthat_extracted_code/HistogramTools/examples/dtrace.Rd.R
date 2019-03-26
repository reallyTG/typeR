library(HistogramTools)


### Name: dtracehistograms
### Title: Read Histograms from text DTrace output file.
### Aliases: dtrace ReadHistogramsFromDtraceOutputFile
### Keywords: manip utilities datagen

### ** Examples

## Not run: 
##D system("dtrace -n 'syscall::read:return { @[execname] = quantize(arg0);}> /tmp/dtraceoutput'",
##D   intern=TRUE)
##D system.readsize.hists <- ReadHistogramsFromDtraceOutputFile("/tmp/dtraceoutput")
##D plot(system.readsize.hists[[1]])
## End(Not run)



