library(brainGraph)


### Name: plot.brainGraph_resids
### Title: Plot model residuals for each brain region
### Aliases: plot.brainGraph_resids

### ** Examples

## Not run: 
##D myresids <- get.resids(lhrh, covars)
##D residPlots <- plot(myresids, cols=TRUE)
##D 
##D ## Save as a multi-page PDF
##D ml <- marrangeGrob(residPlots, nrow=3, ncol=3)
##D ggsave('residuals.pdf', ml)
## End(Not run)



