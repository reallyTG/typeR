library(betapart)


### Name: functional.betapart.core
### Title: Core calculations of functional dissimilarities metrics
### Aliases: functional.betapart.core

### ** Examples

##### 4 communities in a 2D functional space (convex hulls are rectangles)
traits.test<-cbind( c(1,1,1,2,2,3,3,4,4,5,5) , c(1,2,4,1,2,3,5,1,4,3,5) )
	dimnames(traits.test)<-list(paste("sp",1:11,sep="") , c("Trait 1","Trait 2") ) 

comm.test<-matrix(0,4,11,dimnames=list( c("A","B","C","D") , paste("sp",1:11,sep="") ) )
comm.test["A",c(1,2,4,5)]<-1
comm.test["B",c(1,3,8,9)]<-1
comm.test["C",c(6,7,10,11)]<-1
comm.test["D",c(2,4,7,9)]<-1

plot(5,5,xlim=c(0,6), ylim=c(0,6), type="n", xlab="Trait 1",ylab="Trait 2")
points(traits.test[,1],traits.test[,2], pch=21,cex=1.5,bg="black")
rect(1,1,4,4, col="#458B0050", border="#458B00") ; text(2.5,2.5,"B",col="#458B00",cex=1.5)	
polygon(c(2,1,3,4), c(1,2,5,4), col="#DA70D650", border="#DA70D6") 
text(2.5,3,"D",col="#DA70D6",cex=1.5)	
rect(1,1,2,2, col="#FF000050" , border="#FF0000") ; text(1.5,1.5,"A",col="#FF0000",cex=1.5)	
rect(3,3,5,5, col="#1E90FF50", border="#1E90FF") ; text(4,4.2,"C",col="#1E90FF",cex=1.5)	


test.core<-functional.betapart.core(x=comm.test, traits=traits.test, multi=TRUE, 
return.details=FALSE)
test.core

# using functional.betapart.core to get details on intersections
# when only pairwise dissimilarity is computed
test.core.pair<-functional.betapart.core(x=comm.test, traits=traits.test, multi=FALSE, 
return.details=TRUE)
test.core.pair

# for multiple dissimilarity
test.core.multi<-functional.betapart.core(x=comm.test, traits=traits.test, multi=TRUE, 
return.details=TRUE)
test.core.multi

# using core outputs to compute pairwise and multiple functional dissimilarities
functional.beta.pair(x=test.core.pair, index.family = "jaccard" )
functional.beta.multi(x=test.core.multi, index.family = "jaccard" )


# Null model using parallel computing 

# Example 1: pairwise functional beta diversity (functional.beta.pair)
# Note that this is an example with a small number of samples and null model 
# permutations for illustration.
# Real null model analyses should have a much greater number of samples and permutations.

##### 4 communities in a 3D functional space

comm.test<-matrix(0,4,11,dimnames=list( c("A","B","C","D") , paste("sp", 1:11, sep = "")))
comm.test["A",c(1,2,4,5)]<-1
comm.test["B",c(1,3,8,9)]<-1
comm.test["C",c(6,7,10,11)]<-1
comm.test["D",c(2,4,7,9)]<-1

set.seed(1)
traits.test<-matrix(rnorm(11*3, mean=0, sd=1), 11, 3) 
dimnames(traits.test)<-list(paste("sp", 1:11, sep="") , c("Trait 1","Trait 2", "Trait 3"))
     
# Required packages
require(doParallel)
require(picante)
require(fastmatch)
require(foreach)

    
# define number of cores
# Use parallel::detectCores() to determine number of cores available in your machine
nc <- 2 

# create cluster
cl <- parallel::makeCluster(nc)

# register parallel backend
registerDoParallel(cl)
    
# define number of permutations for the null model (the usual is 1000)
# make sure that nperm/nc is a whole number so that all cores have the same number 
# of permutations to work on
nperm <- 10
    
# compute observed values for multiple functional dissimilarities
test.score <- functional.betapart.core(x = comm.test, traits = traits.test, 
multi = FALSE, warning.time = FALSE, return.details = FALSE, 
fbc.step = FALSE, core.ident = NULL)
                                           
obs.pair.func.dis <- functional.beta.pair(x = test.score, index.family = "sorensen")

# number of possible pairs of sites
pairs <- combn(nrow(comm.test), 2)

# create strings for each pair of site
pair_names <- NULL
for (i in 1:ncol(pairs)){
  pair_id <- paste(attr(obs.pair.func.dis$funct.beta.sim, "Labels")[pairs[1,i]],
  attr(obs.pair.func.dis$funct.beta.sim, "Labels")[pairs[2,i]], sep="-")
  pair_names<-c(pair_names, pair_id) 
}

# transform functional.beta.pair results into a matrix
obs.pair.func.dis <- do.call(rbind, lapply(obs.pair.func.dis, function(x) c(x)))

# set names for each pair of site using the set of strings created previsouly
colnames(obs.pair.func.dis) <- pair_names

# export necessary variables and functions to the cluster of cores
parallel::clusterExport(cl = cl, c("nperm", "nc", "comm.test", "traits.test"), 
envir = environment())
                                     
null.pair.func.dis <- foreach::foreach(n = 1:nc, .combine = c, 
.packages=c("picante","betapart","fastmatch")) %dopar% {
    
# number of tasks per core (i.e., permutations per core)
nt <- nperm/nc
     
#create a list of lists where the results from "nt" permutations will be stored
  null.pair.temp <- replicate(nt,list())
  
  # for each core "n" perform "nt" permutations
  for (j in 1:nt){ 
    
    # randomize community with chosen null model
    # for this particular example we used the "independent swap algorithm" 
    # but the user can choose other types of permutation, or create it's own null model 
    null.comm.test <- randomizeMatrix(comm.test, null.model="independentswap", 
	iterations=1000)
    
    # execute functional.betapart.core function identifying each "n" core with the 
	  # core.ident argument 
    null.test.score <- try(functional.betapart.core(null.comm.test, 
	  traits = traits.test, multi = FALSE, warning.time = FALSE, return.details = FALSE, 
	  fbc.step = FALSE, core.ident = n), silent=TRUE)
    
    # in this artificial example there are a few combinations of species that the convex hull 
	  # cannot be calculated due to 
    # some odd geometric combination so we need to re-permute the community matrix 
    while(inherits(null.test.score, "try-error")){
      
    null.comm.test <- randomizeMatrix(comm.test, null.model="independentswap", 
	iterations=1000)
    null.test.score <- try(functional.betapart.core(x = null.comm.test, 
	traits = traits.test, multi = FALSE, 
    warning.time = FALSE, return.details = FALSE, fbc.step = FALSE, 
	core.ident = n), silent=TRUE)
    }
    
    # compute the pairwise beta-diversity null values and input them in the temporary 
	# result matrix
    null.pair.temp[[j]] <- functional.beta.pair(x = null.test.score, 
	index.family = "sorensen" )
    
  }
  #retrieve the results from each core
  null.pair.temp
}

# stop cluster
parallel::stopCluster(cl)

# transform the results from each permutation into a matrix
null.pair.func.dis <- lapply(null.pair.func.dis, function(x) do.call(rbind,
lapply(x, function(x) c(x))))

# compute the mean, standard deviation and p-values of dissimilary metrics
# for each pair of site

mean.null.pair.func <-matrix(numeric(),ncol = ncol(obs.pair.func.dis), 
nrow = nrow(obs.pair.func.dis))
sd.null.pair.func <-matrix(numeric(),ncol = ncol(obs.pair.func.dis), 
nrow = nrow(obs.pair.func.dis))
p.pair.func.dis<-matrix(numeric(),ncol = ncol(obs.pair.func.dis), 
nrow = nrow(obs.pair.func.dis))

# for each one of the 3 null dissimilarity metrics (SIN, SNE and SOR) 
for (j in 1:nrow(obs.pair.func.dis)){
  
  #for each pair of sites
  for (i in 1:ncol(obs.pair.func.dis)){
    
# group the null values from each metric of each pair of site into into
#	it's own matrix
null.pair.temp <- do.call(rbind, lapply(null.pair.func.dis, `[`,j,i)) 
    
# compute mean of all null values
mean.null.pair.func[j,i] <- mean(null.pair.temp)
    
# compute standard deviation of all null values
sd.null.pair.func[j,i] <- sd(null.pair.temp)
    
# compute the p-values
p.pair.func.dis[j,i] <-(length(which(obs.pair.func.dis[j,i]<null.pair.temp))+1)/nperm
# the +1 is to take into account that the observed value is one of the possibilities
  }
}

# compute standardized effect sizes
ses.pair.func.dis <- (obs.pair.func.dis - mean.null.pair.func)/sd.null.pair.func

# result matrix
result <- as.data.frame(matrix(numeric(), ncol = 9,nrow = ncol(obs.pair.func.dis),
     dimnames = list(pair_names, c("obs.SIM","ses.SIM","p.SIM","obs.SNE",
     "ses.SNE","p.SNE","obs.SOR","ses.SOR","p.SOR"))))

result$obs.SIM <- obs.pair.func.dis[1,]
result$obs.SNE <- obs.pair.func.dis[2,]
result$obs.SOR <- obs.pair.func.dis[3,]

result$ses.SIM <- ses.pair.func.dis[1,]
result$ses.SNE <- ses.pair.func.dis[2,]
result$ses.SOR <- ses.pair.func.dis[3,]

result$p.SIM <- p.pair.func.dis[1,]
result$p.SNE <- p.pair.func.dis[2,]
result$p.SOR <- p.pair.func.dis[3,]

result

## Not run: 
##D # Example 2: multiple functional beta diversity (functional.beta.multi)
##D # Note that this is an example with a small number of samples and null model
##D # permutations for illustration.
##D # Real null model analyses should have a much greater number of samples 
##D # and permutations.
##D 
##D ##### 4 communities in a 3D functional space
##D 
##D comm.test<-matrix(0,4,11,dimnames=list( c("A","B","C","D"), 
##D paste("sp", 1:11, sep = "")))
##D comm.test["A",c(1,2,4,5)]<-1
##D comm.test["B",c(1,3,8,9)]<-1
##D comm.test["C",c(6,7,10,11)]<-1
##D comm.test["D",c(2,4,7,9)]<-1
##D 
##D set.seed(1)
##D traits.test<-matrix(rnorm(11*3, mean=0, sd=1), 11, 3) 
##D dimnames(traits.test)<-list(paste("sp", 1:11, sep=""), 
##D c("Trait 1","Trait 2", "Trait 3"))
##D 
##D # Required packages
##D require(doParallel)
##D require(picante)
##D require(fastmatch)
##D require(foreach)
##D 
##D 
##D # define number of cores
##D # Use parallel::detectCores() to determine number of cores available in your machine
##D nc <- 2 
##D     
##D # create cluster
##D cl <- parallel::makeCluster(nc)
##D     
##D # register parallel backend 
##D registerDoParallel(cl)
##D     
##D # define number of permutations for the null model (the usual is 1000)
##D # make sure that nperm/nc is a whole number so that all cores have the same number 
##D # of permutations to work on
##D nperm <- 10
##D     
##D # compute observed values for multiple functional dissimilarities
##D test.score <- functional.betapart.core(x = comm.test, traits = traits.test, 
##D multi = TRUE, warning.time = FALSE, return.details = FALSE, fbc.step = FALSE, 
##D core.ident = NULL)
##D obs.multi.func.dis <- t(as.matrix(unlist(functional.beta.multi(x=test.score, 
##D index.family = "sorensen"))))
##D     
##D # export necessary variables and functions to the cluster of cores
##D parallel::clusterExport(cl = cl, c("nperm", "nc", "comm.test", "traits.test"), 
##D envir=environment())
##D     
##D null.multi.func.dis <- foreach::foreach(n = 1:nc, .combine = rbind, 
##D .packages = c("picante","betapart","fastmatch")) %dopar% {
##D   
##D  # for each core, create temporary matrix to store 3 null multiple functional 
##D  # dissimilarity indices (SIN, SNE,SOR)
##D  null.multi.temp <- matrix(numeric(), ncol = 3, nrow = nperm/nc, 
##D  dimnames = list(NULL, c("funct.beta.SIM", "funct.beta.SNE", "funct.beta.SOR")))
##D 
##D  # number of tasks per core (i.e., permutations per core)
##D  nt <- nperm/nc
##D 
##D       # for each core "n" perform "nt" permutations
##D       for (j in 1:nt) { 
##D   
##D       # randomize community matrix with chosen null model (for this example 
##D 	  # we chose the "independent swap" algorithm) 
##D       null.comm.test <- picante::randomizeMatrix(comm.test, 
##D 	  null.model="independentswap", iterations=1000)
##D     
##D       # execute functional.betapart.core function identifying each "n" core 
##D       # with the core.ident argument for external parallelization, 
##D       null.test.score <- try(functional.betapart.core.modif(x = null.comm.test, 
##D 	  traits = traits.test, 
##D       multi = TRUE,  warning.time = FALSE, return.details = FALSE, fbc.step = FALSE, 
##D 	  core.ident = n), silent = TRUE)
##D 
##D       # in this artificial example there are a few combinations of species
##D 	  # that the convex hull 
##D       # cannot be calculated due to some odd geometric combination so we 
##D 	  # need to re-permute the community matrix 
##D                         
##D       while(inherits(null.test.score, "try-error")){
##D       null.comm.test <- randomizeMatrix(comm.test, null.model="independentswap", 
##D 	  iterations=1000)
##D       null.test.score <- try(functional.betapart.core(x = null.comm.test, 
##D 	  traits = traits.test, 
##D 	  multi = TRUE,  warning.time = FALSE, return.details = FALSE, fbc.step = FALSE, 
##D 	  core.ident = n), silent = TRUE)
##D                         }    
##D       # input null values in the temporary result matrix
##D       null.multi.temp[j,] <- unlist(functional.beta.multi(x = null.test.score, 
##D 	  index.family = "sorensen"))
##D       }
##D # recover results from each core
##D null.multi.temp
##D }
##D 
##D # close cluster
##D parallel::stopCluster(cl)
##D 
##D # result matrix
##D result <- matrix(numeric(), ncol = 3, nrow = 3, dimnames = list(c("obs","ses","p"), 
##D colnames(obs.multi.func.dis)))
##D 
##D # input observed values for the multiple functional dissimilarity indices (SIN, SNE,SOR)
##D result[1,] = obs.multi.func.dis
##D 
##D # compute standardized effect sizes (ses) for the multiple functional
##D # dissimilarity indices (SIN, SNE,SOR)
##D result[2,] <- (obs.multi.func.dis-colMeans(null.multi.func.dis, na.rm=TRUE))/
##D apply(null.multi.func.dis,2,sd, na.rm=TRUE)
##D 
##D # compute p-values for the multiple functional dissimilarity indices (SIN, SNE,SOR)
##D # SIM
##D result[3,1] <- (length(which(obs.multi.func.dis[1]<null.multi.func.dis[,1])) + 1)/nperm
##D # SNE
##D result[3,2] <- (length(which(obs.multi.func.dis[2]<null.multi.func.dis[,2])) + 1)/nperm
##D # SOR 
##D result[3,3] <- (length(which(obs.multi.func.dis[3]<null.multi.func.dis[,3])) + 1)/nperm
##D # the +1 is to take into account that the observed value is one of the possibilities
##D      
##D result
##D ###     
## End(Not run)



