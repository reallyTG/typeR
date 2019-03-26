library(rgr)


### Name: cutter
### Title: Function to Identify in Which Interval a Value Falls
### Aliases: cutter
### Keywords: misc

### ** Examples

## Make test data available
data(kola.c)
attach(kola.c)

## Cut the data into quartiles
xi <- cutter(Cu, quantile(Cu, probs = c(0.25, 0.5, 0.75)))

## Detach test data
detach(kola.c)



