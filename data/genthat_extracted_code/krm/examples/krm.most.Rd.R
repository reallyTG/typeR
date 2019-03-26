library(krm)


### Name: krm.most
### Title: Kernel-based Regression Model Maximum of adjusted Score Test
### Aliases: krm.most

### ** Examples


# in addition to the examples listed here, there are more examples 
# under folder R/library/krm/unitTests

## Not run: 
##D # the examples are not run during package build because it takes a little too long to run
##D 
##D # an Euclidean kernel example from Liu et al. (2008)
##D data=sim.liu.2008 (n=100, a=.1, seed=1) 
##D test = krm.most(y~x, data, formula.kern=~z.1+z.2+z.3+z.4+z.5, kern.type="rbf")
##D 
##D 
##D # a protein sequence kernel example
##D dat.file.name=paste(system.file(package="krm")[1],'/misc/y1.txt', sep="") 
##D seq.file.name=paste(system.file(package="krm")[1],'/misc/sim1.fasta', sep="")
##D dat=read.table(dat.file.name); names(dat)="y"
##D test = krm.most (y~1, dat, seq.file.name=seq.file.name, kern.type="mi")
##D 
##D 
## End(Not run) 





