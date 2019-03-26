library(adehabitatHR)


### Name: kerneloverlap
### Title: Spatial Interaction between Animals Monitored Using
###   Radio-Tracking
### Aliases: kerneloverlap kerneloverlaphr
### Keywords: spatial

### ** Examples


## Not run: 
##D data(puechabonsp)
##D 
##D kerneloverlap(puechabonsp$relocs[,1],
##D               grid=200, meth="VI", conditional=TRUE)
##D 
##D ## Identical to
##D kud <- kernelUD(puechabonsp$relocs[,1],
##D                 grid=200, same4all=TRUE)
##D kerneloverlaphr(kud, meth="VI", conditional=TRUE)
##D 
##D ## other indices
##D kerneloverlap(puechabonsp$relocs[,1],
##D               grid=200, meth="HR")
##D 
##D kerneloverlap(puechabonsp$relocs[,1],
##D               grid=200, meth="PHR")
##D 
##D kerneloverlap(puechabonsp$relocs[,1],
##D               grid=200, meth="BA")
##D 
##D kerneloverlap(puechabonsp$relocs[,1],
##D               grid=200, meth="UDOI")
##D 
##D kerneloverlap(puechabonsp$relocs[,1],
##D               grid=200, meth="HD")
## End(Not run)



