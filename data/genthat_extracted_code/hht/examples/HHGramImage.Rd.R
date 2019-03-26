library(hht)


### Name: HHGramImage
### Title: Display Hilbert spectrogram
### Aliases: HHGramImage
### Keywords: ts hplot

### ** Examples

data(PortFosterEvent)

trials <- 10
nimf <- 10
noise.amp <- 6.4e-07
trials.dir <- "test"

set.seed(628)
#Run EEMD (this may take some time)
## Not run: EEMD(sig, tt, noise.amp, trials, nimf, trials.dir = trials.dir)

#Compile the results
## Not run: EEMD.result <- EEMDCompile(trials.dir, trials, nimf)

#Calculate spectrogram
dt  <-  0.1
dfreq  <-  0.1
## Not run: hgram <- HHRender(EEMD.result, dt, dfreq)


#Plot spectrogram 
time.span <- c(4, 10)
freq.span <- c(0, 25)
## Not run: 
##D HHGramImage(hgram, time.span, freq.span,  
##D pretty = TRUE, img.x.format = "%.1f", img.y.format = "%.0f", 
##D main = "Port Foster event - ensemble Hilbert spectrogram")
## End(Not run)

#Plot intersections

## Not run: 
##D HHGramImage(hgram, time.span, freq.span, amp.span = c(1, 5),  
##D clustergram = TRUE, pretty = TRUE, img.x.format = "%.1f", colorbar.format = "%.0f",
##D img.y.format = "%.0f", main = "Port Foster event - signal stability")
## End(Not run)

#Decluster
#show only areas with stable signal 
#i.e. each pixel has data from at least 3 EEMD trials
## Not run: 
##D HHGramImage(hgram, time.span = time.span, freq.span = freq.span,
##D cluster.span = c(, 10), pretty = TRUE, img.x.format = "%.1f", 
##D img.y.format = "%.0f",
##D main = "Port Foster event - ensemble Hilbert spectrogram")
## End(Not run)

#Log amplitude plot

## Not run: 
##D HHGramImage(hgram, time.span = time.span, freq.span = freq.span,
##D scaling = "log", pretty = TRUE, img.x.format = "%.1f", img.y.format = "%.0f",
##D main = "Port Foster event - ensemble Hilbert spectrogram with log amplitude")
## End(Not run)

#Log frequency plot
dfreq <- 0.001
## Not run: hgram=HHRender(EEMD.result, dt, dfreq, scaling = "log")
## Not run: 
##D HHGramImage(hgram, time.span, freq.span = c(0, 2),          
##D pretty = TRUE, img.x.format = "%.1f", img.y.format = "%.2f",
##D img.y.lab = "log frequency",
##D main = "Port Foster event - ensemble Hilbert spectrogram with log frequency")
## End(Not run)

#Only show IMF 1
dfreq <- 0.1
## Not run: hgram=HHRender(EEMD.result, dt, dfreq, combine.imfs = FALSE)
## Not run: 
##D HHGramImage(hgram, time.span, freq.span, imf.list = 1,
##D pretty = TRUE, img.x.format = "%.1f", img.y.format = "%.0f",
##D main = "Port Foster event - ensemble Hilbert spectrogram of IMF 1")
## End(Not run)



