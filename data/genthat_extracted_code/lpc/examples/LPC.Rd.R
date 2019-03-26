library(lpc)


### Name: LPC
### Title: Compute LPC score for each gene
### Aliases: LPC

### ** Examples

set.seed(2)
n <- 40 # 40 samples
p <- 1000 # 1000 genes
x <- matrix(rnorm(n*p), nrow=p) # make 40x1000 gene expression matrix
y <-  rnorm(n) # quantitative outcome
# make first 50 genes differentially-expressed
x[1:25,y<(-.5)] <- x[1:25,y<(-.5)]+ 1.5
x[26:50,y<0] <- x[26:50,y<0] - 1.5
# compute LPC and T scores for each gene
lpc.obj <- LPC(x,y, type="regression")
# Look at plot of Predictive Advantage
pred.adv <- PredictiveAdvantage(x,y,type="regression",soft.thresh=lpc.obj$soft.thresh)
# Estimate FDRs for LPC and T scores
fdr.lpc.out <-
EstimateLPCFDR(x,y,type="regression",soft.thresh=lpc.obj$soft.thresh,nreps=5)
# should run more reps in practice! Running just 5 in this example
# so that it runs fast.
# Estimate FDRs for T scores only. This is quicker than computing FDRs
#    for LPC scores, and should be used when only T FDRs are needed. If we
#    started with the same random seed, then EstimateTFDR and EstimateLPCFDR
#    would give same T FDRs.
fdr.t.out <- EstimateTFDR(x,y, type="regression")
# print out results of main function
lpc.obj
# print out info about T FDRs
fdr.t.out
# print out info about LPC FDRs
fdr.lpc.out
# Compare FDRs for T and LPC on 6% of genes. In this example, LPC has
#    lower FDR.
PlotFDRs(fdr.lpc.out,frac=.06)
# Print out names of 20 genes with highest LPC scores, along with their
#    LPC and T scores.
PrintGeneList(lpc.obj,numGenes=20)
# Print out names of 20 genes with highest LPC scores, along with their
#    LPC and T scores and their FDRs for LPC and T.
PrintGeneList(lpc.obj,numGenes=20,lpcfdr.out=fdr.lpc.out)




# Now, repeating everything that we did before, but using a
#   **survival** outcome
### COMMENTED TO REDUCE RUN TIME -- UNCOMMENT TO RUN

#set.seed(2)
#n <- 40 # 40 samples
#p <- 1000 # 1000 genes
#x <- matrix(rnorm(n*p), nrow=p) # make 40x1000 gene expression matrix
#y <-  rnorm(n) + 10 # survival times; must be positive
## censoring outcome: 0 or 1
#cens <- rep(1,40) # Assume all observations are complete
## make first 50 genes differentially-expressed
#x[1:25,y<9.5] <- x[1:25,y<9.5]+ 1.5
#x[26:50,y<10] <- x[26:50,y<10] - 1.5
#lpc.obj <- LPC(x,y, type="survival", censoring.status=cens)
## Look at plot of Predictive Advantage
#pred.adv <-
#PredictiveAdvantage(x,y,type="survival",soft.thresh=lpc.obj$soft.thresh,
#censoring.status=cens)
## Estimate FDRs for LPC scores and T scores
#fdr.lpc.out <-
#EstimateLPCFDR(x,y, type="survival",soft.thresh=lpc.obj$soft.thresh,
#nreps=5,censoring.status=cens)
# Running just 5 reps so that things run quickly -- please run more in practice
## Estimate FDRs for T scores only. This is quicker than computing FDRs
###    for LPC scores, and should be used when only T FDRs are needed. If we
##    started with the same random seed, then EstimateTFDR and EstimateLPCFDR
##    would give same T FDRs.
#fdr.t.out <- EstimateTFDR(x,y, type="survival", censoring.status=cens)
## print out results of main function
#lpc.obj
## print out info about T FDRs
#fdr.t.out
## print out info about LPC FDRs
#fdr.lpc.out
## Compare FDRs for T and LPC scores on 10% of genes. 
#PlotFDRs(fdr.lpc.out,frac=.1)
## Print out names of 20 genes with highest LPC scores, along with their
##    LPC and T scores.
#PrintGeneList(lpc.obj,numGenes=20)
## Print out names of 20 genes with highest LPC scores, along with their
##    LPC and T scores and their FDRs for LPC and T.
#PrintGeneList(lpc.obj,numGenes=20,lpcfdr.out=fdr.lpc.out)


## Now, repeating everything that we did before, but using a
##   **multiclass** outcome

#set.seed(2)
#n <- 40 # 40 samples
#p <- 1000 # 1000 genes
#x <- matrix(rnorm(n*p), nrow=p) # make 40x1000 gene expression matrix
#y <-  sample(1:4, n, rep=TRUE)
## make first 50 genes differentially-expressed
#x[1:50,y==1] <- x[1:50,y==1] + 1.5
#x[1:25,y==2] <- x[1:25,y==2] + 1
#x[1:50,y==3] <- x[1:50,y==3] - 1
#lpc.obj <- LPC(x,y, type="multiclass")
## Look at plot of Predictive Advantage
#pred.adv <-
#PredictiveAdvantage(x,y,type="multiclass",soft.thresh=lpc.obj$soft.thresh)
## Estimate FDRs for LPC scores and T scores
#fdr.lpc.out <-
#EstimateLPCFDR(x,y, type="multiclass",soft.thresh=lpc.obj$soft.thresh,
#nreps=20)
## Estimate FDRs for T scores only. This is quicker than computing FDRs
##    for LPC scores, and should be used when only T FDRs are needed. If we
##    started with the same random seed, then EstimateTFDR and EstimateLPCFDR
##    would give same T FDRs.
#fdr.t.out <- EstimateTFDR(x,y, type="multiclass")
## print out results of main function
#lpc.obj
## print out info about T FDRs
#fdr.t.out
## print out info about LPC FDRs
#fdr.lpc.out
## Compare FDRs for T and LPC scores on 10% of genes. 
#PlotFDRs(fdr.lpc.out,frac=.1)
## Print out names of 20 genes with highest LPC scores, along with their
##    LPC and T scores.
#PrintGeneList(lpc.obj,numGenes=20)
## Print out names of 20 genes with highest LPC scores, along with their
##    LPC and T scores and their FDRs for LPC and T.
#PrintGeneList(lpc.obj,numGenes=20,lpcfdr.out=fdr.lpc.out)






