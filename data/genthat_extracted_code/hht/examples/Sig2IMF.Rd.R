library(hht)


### Name: Sig2IMF
### Title: Empirical Mode Decomposition wrapper
### Aliases: Sig2IMF
### Keywords: ts

### ** Examples

data(PortFosterEvent)

#Run EMD
emd.result=Sig2IMF(sig, tt)

#Display IMFs

time.span <- c(5, 10)
imf.list <- 1:3
original.signal <- TRUE
residue <- TRUE

PlotIMFs(emd.result, time.span, imf.list, original.signal, residue)

#Plot spectrogram
sdt <- tt[2] - tt[1]
dfreq <- 0.25
freq.span <- c(0, 25)
hgram <- HHRender(emd.result, sdt, dfreq, freq.span = freq.span, verbose = FALSE)

time.span <- c(4, 10)
freq.span <- c(0, 25)
amp.span <- c(0.000001, 0.00001)
HHGramImage(hgram, time.span = time.span, 
freq.span = freq.span, amp.span = amp.span,
pretty = TRUE)



