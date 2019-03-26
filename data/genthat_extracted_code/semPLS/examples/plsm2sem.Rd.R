library(semPLS)


### Name: plsm2sem
### Title: Convert Model for Use in 'sem'
### Aliases: plsm2sem plsm2sem.plsm

### ** Examples

data(ECSImobi)
if(require(sem)){
   ECSIsem <- plsm2sem(ECSImobi)
   detach(package:sem)
   ECSIsem
}



