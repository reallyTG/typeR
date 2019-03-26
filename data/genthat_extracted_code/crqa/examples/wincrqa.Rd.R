library(crqa)


### Name: wincrqa
### Title: Window Cross-Recurrence Measures
### Aliases: wincrqa

### ** Examples


## simulate two dichotomous series
tS = simts(0.25, 0.05, 0.2, 0.2, 0.25, 100)
ts1 = tS[1,]; ts2 = tS[2,]

## check data(crqa) for alternative data
## (e.g., RDts1, RDts2)

windowstep =  10; windowsize =  50; 
delay = 1; embed =  1 ; rescale =  1;
radius = 0.00001; normalize = 0;
minvertline = 2; mindiagline = 2;
tw = 0; whiteline = FALSE; trend = TRUE;

## it returns a list with:
## [[1]] the measures for the different windows where  values are found
## [[2]] the trend over time. 

res = wincrqa(ts1, ts2, windowstep, windowsize,
delay, embed, rescale, radius, normalize, mindiagline,
minvertline, tw, whiteline, trend)

str(res)




