library(crqa)


### Name: plotRP
### Title: Plot a recurrence matrix
### Aliases: plotRP
### Keywords: misc

### ** Examples

## run a simple crqa 
ts1 = c(0, 0, 1, 1, 0, 0, 2, 2, 1, 1)
ts2 = c(1,1, 2, 2, 0, 0, 1, 2)
delay = 1; embed = 1; rescale = 1; radius = 0.001;
normalize = 0; mindiagline = 2; minvertline = 2;
tw = 0; 

res = crqa(ts2, ts1, delay, embed, rescale, radius, normalize, mindiagline, minvertline, tw)

par = list(unit = 2, labelx = "Time", labely = "Time", cols = "blue", pcex = 1)

RP = res$RP
plotRP(RP, par)



