library(brainwaver)


### Name: compute.FDR
### Title: False Discovery Rate computation
### Aliases: compute.FDR
### Keywords: multivariate htest

### ** Examples


data(young)
brain<-as.matrix(brain)

# WARNING : To process only the first five regions
brain<-brain[,1:5]


# Construction of the correlation matrices for each level of the wavelet decomposition
wave.cor.list<-const.cor.list(brain, method = "modwt" ,wf = "la8", n.levels = 4, 
                               boundary = "periodic", p.corr = 0.975)

# For scale 4
pvalue.cor<-p.value.compute(wave.cor.list[[4]],proc.length=dim(brain)[1], 
                             sup=0.44, num.levels=4)

# Computation of the p-value threshold using FDR procedure
pvalue.thresh<-compute.FDR(pvalue.cor,0.05)



