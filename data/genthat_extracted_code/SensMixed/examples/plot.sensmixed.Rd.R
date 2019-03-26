library(SensMixed)


### Name: plot
### Title: function creates plots for the sensmixed object
### Aliases: plot.sensmixed

### ** Examples

res <- sensmixed(c("Coloursaturation", "Colourbalance", "Noise"),
                  prod_effects=c("TVset", "Picture"), 
                  assessor="Assessor", data=TVbo, MAM=TRUE, 
                  control=list(reduce.random=FALSE))
plot(res, isRand = TRUE)
plot(res, isRand = FALSE)
plot(res, stacked = FALSE, mult = TRUE)
plot(res, isRand = FALSE, stacked = FALSE, interact.symbol = " x ")



