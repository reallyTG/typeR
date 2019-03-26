library(DIFtree)


### Name: summary.DIFtree
### Title: Summary for fitted Item focussed Trees
### Aliases: summary.DIFtree print.summary.DIFtree

### ** Examples

data(data_sim_Rasch)
 
Y <- data_sim_Rasch[,1]
X <- data_sim_Rasch[,-1]
 
## Not run: 
##D  
##D mod <- DIFtree(Y=Y,X=X,model="Logistic",type="udif",alpha=0.05,nperm=1000,trace=TRUE)
##D  
##D summary(mod)
## End(Not run)




