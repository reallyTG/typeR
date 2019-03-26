library(STPGA)


### Name: GenAlgForSubsetSelection
### Title: Genetic algorithm for subset selection
### Aliases: GenAlgForSubsetSelection

### ** Examples

	## Not run: 
##D ####################################
##D library(EMMREML)
##D library(STPGA)
##D data(WheatData)
##D 
##D svdWheat<-svd(Wheat.K, nu=5, nv=5)
##D PC50WHeat<-Wheat.K%*%svdWheat$v
##D plot(PC50WHeat[,1],PC50WHeat[,2])
##D rownames(PC50WHeat)<-rownames(Wheat.K)
##D DistWheat<-dist(PC50WHeat)
##D TreeWheat<-hclust(DistWheat)
##D TreeWheat<-cutree(TreeWheat, k=4)
##D 
##D Test<-rownames(PC50WHeat)[TreeWheat==4]
##D length(Test)
##D Candidates<-setdiff(rownames(PC50WHeat), Test)
##D 
##D 
##D ###instead of using the algorithm directly using a wrapper to 
##D ###implement an for multiple starting points for genetic algorithm.
##D repeatgenalg<-function(numrepsouter,numrepsinner){
##D   StartingPopulation2=NULL 
##D   for (i in 1:numrepsouter){
##D     print("Rep:")
##D     print(i)
##D     StartingPopulation<-lapply(1:numrepsinner, function(x){
##D     	GenAlgForSubsetSelection(P=PC50WHeat,Candidates=Candidates, 
##D     	Test=Test, ntoselect=50, InitPop=StartingPopulation2,
##D  npop=50, nelite=5, mutprob=.5, mutintensity = rpois(1,4),
##D  niterations=10,minitbefstop=5, tabumemsize = 2,plotiters=TRUE, 
##D  lambda=1e-9,errorstat="CDMEAN", mc.cores=1)})
##D     StartingPopulation2<-vector(mode="list", length = numrepsouter*1)
##D     ij=1
##D     for (i in 1:numrepsinner){
##D       for (j in 1:1){
##D         StartingPopulation2[[ij]]<-StartingPopulation[[i]][[j]]
##D         ij=ij+1
##D       }
##D     }
##D   }
##D   ListTrain<-GenAlgForSubsetSelection(P=PC50WHeat,Candidates=Candidates, 
##D     	Test=Test,ntoselect=50, InitPop=StartingPopulation2,npop=100, 
##D     	nelite=10, mutprob=.5, mutintensity = 1,niterations=300,
##D     	minitbefstop=100, tabumemsize = 1,plotiters=T,
##D     	lambda=1e-9,errorstat="CDMEAN", mc.cores=1)
##D   return(ListTrain)
##D }
##D 
##D 
##D ListTrain<-repeatgenalg(20, 3)
##D 
##D ###test sample
##D deptestopt<-Wheat.Y[Wheat.Y$id%in%Test,]
##D 
##D ##predictions by optimized sample
##D deptrainopt<-Wheat.Y[(Wheat.Y$id%in%ListTrain[[1]]),]
##D 
##D Ztrain<-model.matrix(~-1+deptrainopt$id)
##D Ztest<-model.matrix(~-1+deptestopt$id)
##D 
##D modelopt<-emmreml(y=deptrainopt$plant.height,X=matrix(1, nrow=nrow(deptrainopt), ncol=1), 
##D Z=Ztrain, K=Wheat.K)
##D predictopt<-Ztest%*%modelopt$uhat
##D 
##D corvecrs<-c()
##D for (rep in 1:300){
##D ###predictions by a random sample of the same size
##D   rs<-sample(Candidates, 50)
##D   
##D   deptestrs<-Wheat.Y[Wheat.Y$id%in%Test,]
##D   
##D   deptrainrs<-Wheat.Y[(Wheat.Y$id%in%rs),]
##D   
##D   Ztrain<-model.matrix(~-1+deptrainrs$id)
##D   Ztest<-model.matrix(~-1+deptestrs$id)
##D   
##D   library(EMMREML)
##D   modelrs<-emmreml(y=deptrainrs$plant.height,X=matrix(1, nrow=nrow(deptrainrs), ncol=1), 
##D   Z=Ztrain, K=Wheat.K)
##D   predictrs<-Ztest%*%modelrs$uhat
##D corvecrs<-c(corvecrs,cor(predictrs, deptestrs$plant.height))
##D 
##D }
##D mean(corvecrs)
##D cor(predictopt, deptestopt$plant.height)
##D 
##D 
##D plot(PC50WHeat[,1],PC50WHeat[,2], col=rownames(PC50WHeat)%in%ListTrain[[1]]+1,
##D pch=2*rownames(PC50WHeat)%in%Test+1, xlab="pc1", ylab="pc2")
## End(Not run)





