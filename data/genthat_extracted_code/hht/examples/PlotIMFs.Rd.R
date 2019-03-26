library(hht)


### Name: PlotIMFs
### Title: Display IMFs
### Aliases: PlotIMFs
### Keywords: ts hplot

### ** Examples

data(PortFosterEvent)

#Run EMD
emd.result <- Sig2IMF(sig, tt, sm = "polynomial")

#Plot the first 4 IMFs of the EEMD of a signal.
time.span <- c(5, 10)
imf.list <- 1:4
original.signal <- TRUE
residue <- TRUE

PlotIMFs(emd.result, time.span, imf.list, original.signal, residue)

#Check how much contribution IMFs 2 and 3 make to the complete signal
imf.list <- c(2, 3)
fit.line <- TRUE
PlotIMFs(emd.result, time.span, imf.list, original.signal, residue, fit.line)



