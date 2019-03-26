library(CausalImpact)


### Name: CausalImpactMethods
### Title: Printing and plotting a 'CausalImpact' object
### Aliases: summary.CausalImpact print.CausalImpact plot.CausalImpact

### ** Examples

## Not run: 
##D impact <- CausalImpact(...)
##D 
##D # Print a summary table
##D print(impact)
##D summary(impact)
##D 
##D # Print a verbal analysis description
##D print(impact, "report")
##D summary(impact, "report")
##D 
##D # Create a plot
##D plot(impact)
##D plot(impact, "original")
##D plot(impact, "pointwise")
##D plot(impact, "cumulative")
##D plot(impact, c("original", "pointwise"))
##D 
##D # Customize a plot
##D impact.plot <- plot(impact)
##D impact.plot <- impact.plot + theme_bw(base_size = 20)
## End(Not run)



