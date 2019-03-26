library(sppmix)


### Name: rMIPPP_cond_mark
### Title: Generate a Marked Poisson point process (conditional on mark)
### Aliases: rMIPPP_cond_mark

### ** Examples

## No test: 
# Create a marked point pattern; use randomization and 2 discrete uniform
# marks (default values)
newMPP=rMIPPP_cond_mark(bigwin = spatstat::owin(c(-10,10),c(-10,10)))
newMPP$params
plot(newMPP$genMPP, showmarks=TRUE)+add_title("Marked Poisson point pattern",
 n=newMPP$genMPP$n, nmarks=2)
plotmix_2d(newMPP$groundsurfs[[1]], newMPP$groundPPs[[1]])+ add_title(
 "Poisson point pattern for mark 1", n=newMPP$genMPP$n, m=newMPP$groundsurfs[[1]]$m)
plotmix_2d(newMPP$groundsurfs[[2]], newMPP$groundPPs[[2]])+ add_title(
 "Poisson point pattern for mark 2", n=newMPP$genMPP$n, m=newMPP$groundsurfs[[2]]$m)
## End(No test)




