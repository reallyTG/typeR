library(hotspots)


### Name: summary.hotspots
### Title: Summarizing hot spot and outlier cutoffs
### Aliases: summary.hotspots print.summary.hotspots

### ** Examples

rln100.sum <- summary(hotspots(rlnorm(101), tail = "both"))
rln100.sum 
print(rln100.sum, top = 10, p_round = 0)



