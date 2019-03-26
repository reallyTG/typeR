library(STPGA)


### Name: GenAlgForSubsetSelectionMONoTest
### Title: Genetic algorithm for subset selection no given test with
###   multiple criteria for Multi Objective Optimized Experimental Design.
### Aliases: GenAlgForSubsetSelectionMONoTest

### ** Examples

## Not run: 
##D library(STPGA)
##D library(GenomicMating)
##D 
##D data(WheatData)
##D 
##D 
##D Msvd<-svd(scale(Wheat.M, scale=F, center=T), nu=50, nv=50)
##D Dgeno<-as.matrix(dist(scale(Wheat.M, scale=F, center=T)))^2
##D P<-Wheat.M%*%Msvd$v
##D dim(P)
##D rownames(Dgeno)<-colnames(Dgeno)<-rownames(P)<-rownames(Wheat.M)
##D test<-sample(rownames(P), 25)
##D candidates<-setdiff(rownames(P), test)
##D outnewprog<-GenAlgForSubsetSelectionMONoTest(Pcs=P,Dist=Dgeno,
##D Candidates=candidates,ntoselect=75, 
##D selectionstats=list("DOPT", "neg_dist_in_train2", "dist_to_test2"),
##D selectionstatstypes=c("Pcs", "Dist", "Dist"),
##D plotdirections=c(1,1,1),npopGA=300,
##D mutprob=1, mutintensity=2, nitGA=100,
##D plotiters=TRUE, mc.cores=1, InitPop=NULL)
##D 
##D #####Best solution according to ideal solution concept
##D outnewprog[[1]][[which.min(disttoideal(outnewprog[[2]]))]]
##D 
## End(Not run)



