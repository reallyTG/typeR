library(STAR)


### Name: rateEvolution
### Title: Evaluates and Plots a Spike Train Firing Rate's Evolution
### Aliases: rateEvolution plot.rateEvolution
### Keywords: ts

### ** Examples

## load Purkinje cell data recorded in cell-attached mode
data(sPK)
## coerce sPK to a spikeTrain object
sPK <- lapply(sPK, as.spikeTrain)
## get the rate evolution in ctl condition
sPKreCTL <- rateEvolution(sPK[["ctl"]])
## plot the result
plot(sPKreCTL)
## check the bin width which was actually used
sPKreCTL$bw
## look at the effect of a 10 times larger bw
plot(rateEvolution(sPK[["ctl"]],bw=10*sPKreCTL$bw))
## look at the effect of a 10 times smaller one
plot(rateEvolution(sPK[["ctl"]],bw=sPKreCTL$bw/10))
## get the rate evolution in bicuculline conditions
sPKreBICU <- rateEvolution(sPK[["bicu"]])
## plot results
plot(sPKreBICU,col=2)
## add the ctl rate evolution
lines(sPKreCTL)



