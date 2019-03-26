library(randomizationInference)


### Name: withinBlockEffects
### Title: Pairwise Differences of Mean Outcomes Within Blocks
### Aliases: withinBlockEffects
### Keywords: methods

### ** Examples

## Reading comprehension pre- and post-test example
data(reading)
withinBlockEffects(y = reading$Diff1, w = reading$Group,
    calcOptions = list(block = reading$Block,
        pairs=rbind(rbind(c("Basal","DRTA"),c("Basal","Strat"),
            c("DRTA","Strat")), rbind(c("Basal","DRTA"),
            c("Basal","Strat"),c("DRTA","Strat"))),
        blockindex=c(rep(1,3),rep(2,3))))



