library(sprm)


### Name: sprmdaCV
### Title: Cross validation method for sparse PRM classification models.
### Aliases: sprmdaCV

### ** Examples

data(iris)
data <- droplevels(subset(iris,iris$Species!="setosa"))
## for demonstration with only two values in etas
smod <- sprmdaCV(Species~.,data, as=2:3, etas=c(0.1,0.9), nfold=5, 
                 class="lda", numit=10, prec=0.1)
biplot(smod$opt.mod)
## Not run: 
##D ## in practis a finer grid of as and etas should be searched 
##D ## at the expence of computation time
##D smod <- sprmdaCV(Species~.,data, as=1:4, etas=seq(0.1,0.9,0.1), nfold=5, 
##D                  class="lda", numit=10, prec=0.1)
## End(Not run)



