library(bayesPop)


### Name: write.pop.projection.summary
### Title: Writing Projection Summary Files
### Aliases: write.pop.projection.summary
### Keywords: IO

### ** Examples

outdir <- tempfile()
dir.create(outdir)
sim.dir <- file.path(find.package("bayesPop"), "ex-data", "Pop")
pred <- get.pop.prediction(sim.dir=sim.dir, write.to.cache=FALSE)

# proportion of 65+ years old to the whole population
write.pop.projection.summary(pred, expression="PXXX[14:27] / PXXX", file.suffix="age65plus", 
    output.dir=outdir, include.observed=TRUE, digits=2)
    
# various measures
write.pop.projection.summary(pred, what=c("pop", "popsexage", "popsex"),
    output.dir=outdir)

unlink(outdir, recursive=TRUE)



