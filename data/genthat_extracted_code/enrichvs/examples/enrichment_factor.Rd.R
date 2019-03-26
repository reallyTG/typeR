library(enrichvs)


### Name: enrichment_factor
### Title: Function to calculate the enrichment factor (EF)
### Aliases: enrichment_factor

### ** Examples

x <- rnorm(1000)  # random scores for 1000 compounds
y <- c(rep(1,50), rep(0,950))     # activity labels for "x"
enrichment_factor(x, y, top=0.1)

data(dud_egfr)
enrichment_factor(dud_egfr$energy, dud_egfr$label, decreasing=FALSE)




