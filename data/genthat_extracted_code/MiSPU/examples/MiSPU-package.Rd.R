library(MiSPU)


### Name: MiSPU-package
### Title: Microbiome Based Sum of Powered Score (MiSPU) Tests
### Aliases: MiSPU-package
### Keywords: MiSPU-package

### ** Examples

data(throat.otu.tab)
data(throat.tree)
data(throat.meta)

Y.tmp =throat.meta[,3]
Y = rep(0,dim(throat.meta)[1])
Y[Y.tmp=="Smoker"] = 1

cov.tmp = throat.meta[,c(10,12)]
cov = matrix(1,dim(throat.meta)[1],2)
cov[cov.tmp[,1]== "None",1] = 0
cov[cov.tmp[,2]== "Male",2] = 0

start.time = proc.time()
X = as.matrix(throat.otu.tab)

out = MiSPU(Y,X, throat.tree,cov,model =  "binomial", pow = c(2:8, Inf), n.perm = 1000)
out



