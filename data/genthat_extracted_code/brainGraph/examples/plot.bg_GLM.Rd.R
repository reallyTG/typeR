library(brainGraph)


### Name: plot.bg_GLM
### Title: Plot GLM diagnostics for a brain network
### Aliases: plot.bg_GLM

### ** Examples

## Not run: 
##D ## Save objects and then to multipage PDF
##D lmPlots <- plot(x)
##D ggsave('lmPlots.pdf', lmPlots)
##D 
##D ## Save all the GLM sub-objects from MTPC analysis
##D res.mtpc <- mtpc(...)
##D glmPlots <- lapply(res.mtpc$res.glm, plot, which=1:6)
##D ml <- marrangeGrob(glmPlots, nrow=1, ncol=1)
##D ggsave('glmPlots.pdf', ml, width=8.5, height=11)
## End(Not run)



