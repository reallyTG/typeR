library(fmri)


### Name: fmri.designG
### Title: Design matrix for fMRI group analysis
### Aliases: fmri.designG
### Keywords: regression design

### ** Examples

subj <- 6
runs <- 1
scans <- 121
times <- c(12, 48, 84, 120, 156, 192, 228, 264) 
duration <- 24          
tr <- 2.5

hrf <- fmri.stimulus(scans, times, duration, tr, times = TRUE)
x.group <- fmri.designG(hrf, subj = subj, runs = runs)
# View(x.group)



