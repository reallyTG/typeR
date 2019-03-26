library(crqa)


### Name: runcrqa
### Title: Wrapper to compute different types of cross-recurrence
###   quantification analyses between two time-series.
### Aliases: runcrqa

### ** Examples


data(crqa)

####################################################
###Cross-recurrence diagonal profile 

par = list(type = 1, ws = 100, method = "profile",
    datatype = "categorical", thrshd = 8, radius = 2,
     pad = FALSE)

ans = runcrqa(RDts1, RDts2, par)

profile = ans$profile; maxrec = ans$maxrec; maxlag = ans$maxlag

####################################################
###Windowed cross-recurrence profile 

par = list(type = 1, windowstep =  20, windowsize =  100, 
  method = "window", datatype = "categorical", thrshd = 8,
     pad = FALSE)

ans = runcrqa(RDts1, RDts2, par)

print(ans)

####################################################
### Cross-recurrence measures 

par = list(type = 2, delay = 1, embed =  1, rescale =  1,
  radius = 0.00001, normalize = 0, mindiagline = 2,
   minvertline = 2, whiteline = FALSE, recpt = FALSE)

res = runcrqa(RDts1, RDts2, par)

res[1:9]




