library(WRS2)


### Name: trimse
### Title: Robust location measures and their standard errors (se).
### Aliases: trimse winmean winse msmedse mest mestse winvar onestep mom
### Keywords: models

### ** Examples

## Self-awareness data (Dana, 1990): Time persons could keep a portion of an 
## apparatus in contact with a specified range.
self <- c(77, 87, 88, 114, 151, 210, 219, 246, 253, 262, 296, 299, 306, 376, 
          428, 515, 666, 1310, 2611)
mean(self, 0.1)     ## .10 trimmed mean 
trimse(self, 0.1)   ## se trimmed mean
winmean(self, 0.1)  ## Winsorized mean (.10 Winsorizing amount)
winse(self, 0.1)    ## se Winsorized mean
winvar(self, 0.1)   ## Winsorized variance
median(self)        ## median
msmedse(self)       ## se median
mest(self)          ## Huber M-estimator
mestse(self)        
onestep(self)       ## one-step M-estimator
mom(self)           ## modified one-step M-estimator



