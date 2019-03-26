library(ctsem)


### Name: ctMultigroupFit
### Title: Fits a multiple group continuous time model.
### Aliases: ctMultigroupFit

### ** Examples

## Not run: 
##D 
##D #Two group model, all parameters except LAMBDA[3,1] constrained across groups.
##D data(ctExample4)
##D basemodel<-ctModel(n.latent=1, n.manifest=3, Tpoints=20,
##D                    LAMBDA=matrix(c(1, 'lambda2', 'lambda3'), nrow=3, ncol=1),
##D                    MANIFESTMEANS=matrix(c(0, 'manifestmean2', 'manifestmean3'), 
##D                    nrow=3, ncol=1), TRAITVAR = 'auto')
##D 
##D freemodel<-basemodel
##D freemodel$LAMBDA[3,1]<-'groupfree'
##D groups<-paste0('g',rep(1:2, each=10),'_')
##D 
##D multif<-ctMultigroupFit(dat=ctExample4, groupings=groups,
##D                        ctmodelobj=basemodel, freemodel=freemodel)
##D summary(multif,group=1)
##D 
##D 
##D 
##D #fixed model approach
##D fixedmodel<-basemodel
##D fixedmodel$LAMBDA[2,1]<-'groupfixed'
##D groups<-paste0('g',rep(1:2, each=10),'_')
##D 
##D multif<-ctMultigroupFit(dat=ctExample4, groupings=groups,
##D                        ctmodelobj=basemodel, fixedmodel=fixedmodel)
##D summary(multif) 
## End(Not run)





