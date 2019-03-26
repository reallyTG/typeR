library(scorecard)


### Name: woebin_plot
### Title: WOE Binning Visualization
### Aliases: woebin_plot

### ** Examples

# Load German credit data
data(germancredit)

# Example I
bins1 = woebin(germancredit, y="creditability", x="credit.amount")

p1 = woebin_plot(bins1)
print(p1)

## Not run: 
##D # Example II
##D bins = woebin(germancredit, y="creditability")
##D plotlist = woebin_plot(bins)
##D print(plotlist$credit.amount)
##D 
##D # # save binning plot
##D # for (i in 1:length(plotlist)) {
##D #   ggplot2::ggsave(
##D #      paste0(names(plotlist[i]), ".png"), plotlist[[i]],
##D #      width = 15, height = 9, units="cm" )
##D #   }
## End(Not run)




