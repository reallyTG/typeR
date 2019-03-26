library(FRegSigCom)


### Name: cv.ff.interaction
### Title: Cross-validation for function-on-function regression models with
###   specified main effects and two-way interaction terms
### Aliases: cv.ff.interaction

### ** Examples

 
################################################################################# 
# Example: interaction function-on-function model with 
#          specified effects 
############################################################################### 


ptm <- proc.time()
library(FRegSigCom)
data(ocean)
Y=ocean[[1]]
Y.train=Y[1:50,]
Y.test=Y[-(1:50),]
t.y=seq(0,1, length.out = ncol(Y))
X.list=list()
X.train.list=list()
X.test.list=list()
t.x.list=list()
for(i in 1:4)
{
  X.list[[i]]=ocean[[i+1]]
  X.train.list[[i]]=X.list[[i]][1:50,]
  X.test.list[[i]]=X.list[[i]][-(1:50),]
  t.x.list[[i]]=seq(0,1, length.out = ncol(X.list[[i]]))
}
main.effect=1:2
inter.effect=rbind(c(1,1), c(1,2), c(2,2))
fit.fix.adaptive=cv.ff.interaction(X.train.list, Y.train, t.x.list, t.y,
           adaptive=TRUE, main.effect, inter.effect)
Y.pred=pred.ff.interaction(fit.fix.adaptive,  X.test.list)

error<- mean((Y.pred-Y.test)^2) 
print(c(" prediction error=", error))
print(proc.time()-ptm)




