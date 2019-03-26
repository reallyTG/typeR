library(preseqR)


### Name: preseqR.rSAC.sequencing.rmdup
### Title: Predicting r-SAC in WES/WGS
### Aliases: preseqR.rSAC.sequencing.rmdup
### Keywords: r-SAC, duplicates, WES, WGS, high-throughput

### ** Examples

## load library
#library(preseqR)

## import data
# data(SRR1301329_1M_base)
# data(SRR1301329_1M_read)
# construct the estimator
# estimator1 <- preseqR.rSAC.sequencing.rmdup(
#                 n_base=SRR1301329_1M_base, n_read=SRR5365359_5M_read, 
#                 r=4, mt=20, times=100, conf=0.95)
## The number of nucleotides in the genome covered at least 4 times, when the
## amount of sequencing is 10 or 20 times of the intial experiment
## 10 or 20 times of the initial sample
# estimator1$f(c(10, 20))
## The standard error of the estiamtes
# estimator1$se(c(10, 20))
## The confidence interval of the estimates
# lb <- estimator1$lb(c(10, 20))
# ub <- estimator1$ub(c(10, 20))
# matrix(c(lb, ub), byrow=FALSE, ncol=2)

# construct the estimator
# estimator2 <- preseqR.rSAC.sequencing.rmdup(
#                 n_base=SRR1301329_1M_base, n_read=SRR5365359_5M_read, 
#                 r=10, mt=20, times=100, conf=0.95)
## The number of nucleotides in the genome covered at least 10 times, when the
## amount of sequencing is 10 or 20 times of the intial experiment
## 10 or 20 times of the initial sample
# estimator2$f(c(10, 20))
## The standard error of the estiamtes
# estimator2$se(c(10, 20))
## The confidence interval of the estimates
# lb <- estimator2$lb(c(10, 20))
# ub <- estimator2$ub(c(10, 20))
# matrix(c(lb, ub), byrow=FALSE, ncol=2)




