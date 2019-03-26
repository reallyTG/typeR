library(repfdr)


### Name: repfdr
### Title: Bayes and local Bayes false discovery rate estimation for
###   replicability analysis
### Aliases: repfdr manhattan
### Keywords: Replicability GWAS

### ** Examples


#### Example 1: a simulation; each feature in each study has two association states,
####            null and positive, prior is known
#This example generates the Z scores for two studies, with 0.05 probability to have
# non - null signal in each study.
# The prior matrix is being pregenerated to show the optimal values.
# if this matrix was not supplied, the repfdr method would estimate it
# using an EM algorithm. See the next examples for estimating the prior as well using repfdr.

set.seed(1)
n = 2 #two studies
m=10000 # ten thounsand, SNPs
H_Study_1 = rbinom(m,1,prob = 0.05) #signal of 1, for SNPS with association in the first study
H_Study_2 = rbinom(m,1,prob = 0.05) #signal of 1, for SNPS with association in the second study
Zmat = matrix(rnorm(n*m),nrow = m) #generate matrix

#insert signal (mean shift of 3) for the first study
Zmat[which(H_Study_1==1),1] = Zmat[which(H_Study_1==1),1]  + 4 

#insert signal to the second study
Zmat[which(H_Study_2==1),2] = Zmat[which(H_Study_2==1),2]  + 4 

#estimate densities via ztobins:
ztobins_res = ztobins(Zmat,n.association.status = 2,plot.diagnostics = FALSE,n.bin= 100) 

#writing out the prior explicitly. If this was not supplied, 
#the repfdr would try to estimate this prior from the data.
Precomputed_Pi = matrix(NA,ncol = 3,nrow = 4)
Precomputed_Pi[,1] = c(0,1,0,1)
Precomputed_Pi[,2] = c(0,0,1,1)
Precomputed_Pi[,3] = c(0.95^2,0.95*0.05,0.95*0.05,0.05^2)
colnames(Precomputed_Pi) = c('Study 1','Study 2','Pi')

#run repfdr
repfdr_res = repfdr(ztobins_res$pdf.binned.z,
                    ztobins_res$binned.z.mat,
                    non.null = 'replication',
                    Pi.previous.result = Precomputed_Pi)

#The precomputed prior matrix. if this would not 
repfdr_res$Pi

#local fdr0 and Fdr for each SNP
head(repfdr_res$mat)

Non_Null = which(H_Study_1 ==1 & H_Study_2 == 1)
Reported = which(repfdr_res$mat[,2] <= 0.05)
TP = length(intersect(Reported,  Non_Null))
TP
FP = length(Reported) - TP
FP
FN = length(Non_Null - TP)
FN


#### Example 2: a simulation; each feature in each study has two association states,
####            null and positive, prior is estimated
## Not run: 
##D # a) Replicablity analysis:
##D data(binned_zmat_sim) # this loads the binned z-scores as well as the (estimated) probabilities
##D # in each bin for each state 
##D output.rep <- repfdr(pbz_sim, bz_sim, "replication")
##D BayesFdr.rep <- output.rep$mat[,"Fdr"]
##D Rej <- (BayesFdr.rep <= 0.05)
##D sum(Rej)
##D 
##D # which of the tests are true replicability findings? (we know this since the data was simulated)
##D data(hmat_sim)
##D true.rep   <- apply(hmat_sim,1,function(y){ sum(y==1)>1 })
##D 
##D 
##D # Compute the false discovery proportion (FDP) for replicability:
##D sum(Rej * !true.rep) / sum(true.rep)
##D 
##D # we can use the previously calculated Pi for further computations (e.g meta-analysis):
##D Pi_sim <- output.rep$Pi
##D 
##D # b) meta-analysis:
##D output.meta <- repfdr(pbz_sim, bz_sim, "meta-analysis", Pi.previous.result = Pi_sim)
##D 
##D BayesFdr.meta <- output.meta$mat[,"Fdr"]
##D Rej <- (BayesFdr.meta <= 0.05)
##D sum(Rej)
##D 
##D # which of the tests are true association findings? (we know this since the data was simulated)
##D true.assoc <- rowSums(hmat_sim) >= 1
##D 
##D # Compute the false discovery proportion (FDP) for association:
##D sum(Rej * !true.assoc) / sum(true.assoc) 
##D 
## End(Not run)

## Not run: 
##D #### Example 3: SNPs data; each SNP in each study has three association states,
##D ####            negative, null, or positive: 
##D 
##D # load the bins of the z-scores and their probabilities.
##D download.file('http://www.math.tau.ac.il/~ruheller/repfdr_RData/binned_zmat.RData',
##D   destfile = "binned_zmat.RData")
##D load(file = "binned_zmat.RData")
##D # can also be generated from SNPlocation - see ztobins documentation.
##D 
##D # load the prior probabilities for each association status vector.
##D data(Pi)
##D Pi # the proportions vector was computed using piem()
##D    # with the following command: Pi <- piem(pbz, bz)$last.iteration
##D 
##D # a) replicablity analysis:
##D output.rep <- repfdr(pbz, bz, "replication",Pi.previous.result=Pi)
##D BayesFdr.rep <- output.rep$mat[,"Fdr"]
##D Rej <- sum(BayesFdr.rep <= 0.05)
##D sum(Rej)
##D 
##D # The posterior probabilities for the first five features with Bayes FDR at most 0.05:
##D post <- ldr(pbz,bz[order(BayesFdr.rep)[1:5],],Pi)
##D round(post,4)
##D 
##D # posteriors for a subset of the association status vectors can also be reported:
##D H <- hconfigs( dim(bz)[2], 3)
##D h.replicability = apply(H, 1, function(y) {sum(y == 1)> 1 | sum(y == -1) >1})
##D post <- ldr(pbz,bz[order(BayesFdr.rep)[1:5],],Pi,h.vecs= which(h.replicability==1))
##D round(post,4)
##D 
##D # b) meta-analysis:
##D output.meta <- repfdr(pbz, bz, "meta-analysis", Pi.previous.result = Pi) 
##D BayesFdr.meta <- output.meta$mat[,"Fdr"]
##D Rej <- sum(BayesFdr.meta <= 0.05)
##D sum(Rej)
## End(Not run)

## manhattan plot (ploting can take a while):
# code for manhattan plot by Stephen Turner (see copyrights at the source code manhattan.r)

## Not run: 
##D  
##D   data(SNPlocations)
##D   par(mfrow=c(2,1))
##D   # Replication 
##D   manhattan(dataframe=cbind(SNPlocations,P=BayesFdr.rep),ymax=10.5,pch=20,
##D             limitchromosomes=1:4,suggestiveline=-log(0.05,10),genomewideline=F,cex=0.25,
##D             annotate=SNPlocations$SNP[BayesFdr.rep<=0.05],main="Replication")
##D   # Association
##D   manhattan(dataframe=cbind(SNPlocations,P=BayesFdr.meta),ymax=10.5,cex=0.25,
##D             limitchromosomes=1:4,suggestiveline=-log(0.05,10),genomewideline=F,pch=20,
##D             annotate=SNPlocations$SNP[BayesFdr.rep<=0.05],main="Meta-analysis")
##D   par(mfrow=c(1,1))
## End(Not run)



