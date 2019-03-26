library(AMAP.Seq)


### Name: test.AMAP
### Title: Calculate the test statistics of the AMAP tests
### Aliases: test.AMAP

### ** Examples


######## Please read the help instribution above and the manuscript to 
######## CHOOSE PROPER PARAMETERS LIKE nK, iter.max, nK0, FC and nMC for best use of the function 
set.seed(100)
data("SimuHapMap")  # a matrix 'counts' storing simulated data with 10000 genes, two treatments, of which each has 5 replicates
head(cbind(counts,del.true))
counts=counts[1:200,] ### use data for only 200 genes to save time for testing example
                      ### the computation usually requires tens of minutes for 10000 genes
group=rep(1:2,each=5)

### standardize the RNA-seq data

size=Norm.GMedian(counts)   ## normalizing factor using Geometric Median
mydata=RNASeq.Data(counts=counts,size=size,group=group,model="nbinom")

### test DE genes

decom.est=MGN.EM(mydata,nK=3,iter.max=3,nK0=3,nMC=100)
s1=test.AMAP(mydata,MGN=decom.est$MGN,FC=1.0,nMC=100)
head(s1)

### test for FC>1.1

decom.est=MGN.EM(mydata,nK=3,iter.max=3,nK0=0,nMC=100)
s2=test.AMAP(mydata,MGN=decom.est$MGN,FC=1.1,nMC=100)
head(s2)




