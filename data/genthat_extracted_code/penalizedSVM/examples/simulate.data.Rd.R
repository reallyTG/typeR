library(penalizedSVM)


### Name: sim.data
### Title: Simulation of microarray data
### Aliases: sim.data
### Keywords: distribution multivariate

### ** Examples


my.seed<-123

# 1. simulate 20 samples, with 100 genes in each. Only the first two genes
# have an impact on the class labels.
# All genes are assumed to be i.i.d. 
train<-sim.data(n = 20, ng = 100, nsg = 3, corr=FALSE, seed=my.seed )
print(str(train)) 

# 2. change the proportion between positive and negative significant genes 
#(from 0.5 to 0.8)
train<-sim.data(n = 20, ng = 100, nsg = 10, p.n.ratio = 0.8,  seed=my.seed )
rownames(train$x)[1:15]
# [1] "pos1" "pos2" "pos3" "pos4" "pos5" "pos6" "pos7" "pos8" 
# [2] "neg1" "neg2" "bal1" "bal2" "bal3" "bal4" "bal5"

# 3. assume to have correlation for positive significant genes, 
# negative significant genes and 'balanced' genes separatly. 
train<-sim.data(n = 20, ng = 100, nsg = 10, corr=TRUE, seed=my.seed )
#cor(t(train$x[1:15,]))

# 4. add 6 blocks of 5 genes each and only one significant gene per block.
# all genes in the block are correlated with constant correlation factor
#  corr.factor=0.8 		
train<-sim.data(n = 20, ng = 100, nsg = 6, corr=TRUE, corr.factor=0.8,
			 blocks=TRUE, n.blocks=6, nsg.block=1, ng.block=5, seed=my.seed )
print(str(train)) 
# first block
#cor(t(train$x[1:5,]))
# second block
#cor(t(train$x[6:10,]))




