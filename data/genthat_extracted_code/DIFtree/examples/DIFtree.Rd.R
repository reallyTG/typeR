library(DIFtree)


### Name: DIFtree
### Title: Item focussed Trees for the Identification of Items in
###   Differential Item Functioning
### Aliases: DIFtree print.DIFtree

### ** Examples

data(data_sim_Rasch)
data(data_sim_PCM)
 
Y1 <- data_sim_Rasch[,1]
X1 <- data_sim_Rasch[,-1]

Y2 <- data_sim_PCM[,1]
X2 <- data_sim_PCM[,-1]
 
## Not run: 
##D  
##D mod1 <- DIFtree(Y=Y1,X=X1,model="Logistic",type="udif",alpha=0.05,nperm=1000,trace=TRUE)
##D print(mod1)
##D 
##D mod2 <- DIFtree(Y=Y2,X=X2,model="PCM",alpha=0.05,nperm=100,trace=TRUE)
##D print(mod2)
## End(Not run)




