library(qpcR)


### Name: update.pcrfit
### Title: Updating and refitting a qPCR model
### Aliases: update.pcrfit
### Keywords: models nonlinear

### ** Examples

m1 <- pcrfit(reps, 1, 2, l4)

## Update model.
update(m1, model = l5)

## Update qPCR run.
update(m1, fluo = 20)

## Update data.
update(m1, data = guescini1)    



