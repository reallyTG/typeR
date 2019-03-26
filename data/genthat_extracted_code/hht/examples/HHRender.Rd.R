library(hht)


### Name: HHRender
### Title: Render Hilbert spectrogram
### Aliases: HHRender
### Keywords: ts hplot

### ** Examples

data(PortFosterEvent)

trials <- 10
nimf <- 10
noise.amp <- 6.4e-07
trials.dir <- "test"

set.seed(628)
#Run EEMD (this may take some time)
## Not run: EEMD(sig, tt, noise.amp, trials, nimf, noise.amp, trials.dir <- trials.dir)

#Compile the results
## Not run: EEMD.result <- EEMDCompile(trials.dir, trials, nimf)

#Calculate spectrogram
dt <- 0.1
dfreq <- 0.1

## Not run: hgram <- HHRender(EEMD.result, dt, dfreq)

#Plot spectrogram 
time.span <- c(5, 10)
freq.span <- c(0, 25)
amp.span <- c(1e-6, 2.5e-5)
## Not run: 
##D HHGramImage(hgram, time.span = time.span, 
##D     freq.span = freq.span, amp.span = amp.span)
## End(Not run)



