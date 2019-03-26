library(DIFtree)


### Name: plot.DIFtree
### Title: Plotting of Item focussed Trees
### Aliases: plot.DIFtree

### ** Examples

data(data_sim_Rasch)
 
Y <- data_sim_Rasch[,1]
X <- data_sim_Rasch[,-1]
 
## Not run: 
##D  
##D mod <- DIFtree(Y=Y,X=X,model="Logistic",type="udif",alpha=0.05,nperm=1000,trace=TRUE)
##D  
##D plot(mod,item=1)
## End(Not run)



