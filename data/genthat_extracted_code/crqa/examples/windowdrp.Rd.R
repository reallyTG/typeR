library(crqa)


### Name: windowdrp
### Title: Window Cross-Recurrence Profile
### Aliases: windowdrp

### ** Examples


data(crqa)

ts1 = as.numeric(as.matrix(RDts1))
ts2 = as.numeric(as.matrix(RDts2))

par = list(type = 1, step =  20, windowsize =  50, lagwidth = 40,
           method = "window", datatype = "categorical", thrshd = 8,
           radius = 0.001, delay = 1, embed = 1, rescale = 0, normalize = 0,
           mindiagline = 2, minvertline = 2)

ans = runcrqa(ts1, ts2, par)

print(ans)

profile = ans$profile; maxrec = ans$maxrec; maxlag = ans$maxlag




