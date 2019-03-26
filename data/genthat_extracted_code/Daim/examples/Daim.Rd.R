library(Daim)


### Name: Daim
### Title: Diagnostic accuracy of classification models.
### Aliases: Daim
### Keywords: classif models programming

### ** Examples


#############################
##      Evaluation of      ##
##           LDA           ##
#############################

library(TH.data)
library(MASS)
data(GlaucomaM)
head(GlaucomaM)

mylda <- function(formula, train, test){
  	model <- lda(formula, train)
  	predict(model, test)$posterior[,"pos"]
}
  
set.seed(1102013)
ACC <- Daim(Class~., model=mylda, data=GlaucomaM, labpos="glaucoma", 
            control=Daim.control(method="boot", number=50))
ACC
summary(ACC)

  
## Not run: 
##D   
##D ## just because of checking time on CRAN
##D   
##D   
##D   ####
##D   #### optimal cut point determination
##D   ####
##D   
##D   
##D   set.seed(1102013)
##D   ACC <- Daim(Class~., model=mylda, data=GlaucomaM, labpos="glaucoma", 
##D               control=Daim.control(method="boot", number=50), cutoff="0.632+")
##D   ACC
##D   summary(ACC)
##D   
##D   
##D   
##D   ####
##D   #### for parallel execution on multicore CPUs and computer clusters
##D   ####
##D   
##D   library(parallel)
##D   ### 
##D   ### create cluster with two slave nodes
##D 
##D   cl <- makeCluster(2)
##D 
##D   ###
##D   ### Load used package on all slaves and execute Daim in parallel
##D   ###
##D 
##D   clusterEvalQ(cl, library(ipred))
##D   ACC <- Daim(Class~., model=mylda, data=GlaucomaM, labpos="glaucoma", cluster=cl)
##D   ACC
##D 
##D 
##D   ####
##D   #### for parallel computing on multicore CPUs
##D   ####
##D 
##D   ACC <- Daim(Class~., model=mylda, data=GlaucomaM, labpos="glaucoma", multicore=TRUE)
##D   ACC
##D   
##D   
##D   
##D   
##D   
##D   #############################
##D   ##      Evaluation of      ##
##D   ##      randomForrest      ##
##D   #############################
##D   
##D   
##D   library(randomForest)
##D 
##D   myRF <- function(formula, train, test){
##D       model <- randomForest(formula, train)
##D   	  predict(model,test,type="prob")[,"pos"]
##D   }
##D 
##D   ACC2 <- Daim(Class~., model=myRF, data=GlaucomaM, labpos="glaucoma",
##D                control=Daim.control(number=50))
##D   ACC2
##D   summary(ACC2)
##D   
##D   
##D   ####
##D   #### optimal cut point determination
##D   ####
##D   
##D   
##D   set.seed(1102013)
##D   ACC2 <- Daim(Class~., model=myRF, data=GlaucomaM, labpos="glaucoma", 
##D               control=Daim.control(method="boot", number=50), cutoff="0.632+")
##D   summary(ACC2)
##D   
##D   
##D   
##D   ####
##D   #### for parallel execution on multicore CPUs and computer clusters
##D   ####
##D   
##D   
##D   library(parallel)
##D   ### 
##D   ### create cluster with two slave nodes
##D 
##D   cl <- makeCluster(2)
##D 
##D   ###
##D   ### Load used package on all slaves and execute Daim in parallel
##D   ###
##D 
##D   clusterEvalQ(cl, library(randomForest))
##D   ACC2 <- Daim(Class~., model=myRF, data=GlaucomaM, labpos="glaucoma", cluster=cl)
##D   ACC2
##D 
##D   ####
##D   #### for parallel computing on multicore CPUs
##D   ####
##D 
##D   ACC2 <- Daim(Class~., model=myRF, data=GlaucomaM, labpos="glaucoma", multicore=TRUE)
##D   ACC2
##D   
## End(Not run)



