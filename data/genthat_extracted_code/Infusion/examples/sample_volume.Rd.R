library(Infusion)


### Name: rparam
### Title: Sample the parameter space
### Aliases: rparam sample_volume

### ** Examples

if (Infusion.getOption("example_maxtime")>10) {
 data(densv)
 summliksurf <- infer_surface(densv) ## infer a log-likelihood surface
 sample_volume(summliksurf)
}



