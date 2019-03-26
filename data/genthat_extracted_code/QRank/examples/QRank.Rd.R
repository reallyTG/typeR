library(QRank)


### Name: QRank
### Title: A new Quantile Rank-score (QRank) based test for the eQTL
###   identification.
### Aliases: QRank

### ** Examples

set.seed(123)                                                                        #
n=300                                                                                #
x=rbinom(n, 2, 0.2)                                                                  #
y=rnorm(n, mean=0, sd=1)                                                             #
z=cbind(rbinom(n, 1, 0.3), rnorm(n, mean=2, sd=2))                                   # 
taus=c( 0.25, 0.5, 0.75)                                                             # 

# - run the proposed QRank approach                                                  #
QRank(gene=y, snp=x, cov=z, tau=taus)                                                #

# - output                                                                           #
#Composite.pvalue:                                                                   #
#[1] 0.2241873                                                                       #

#Quantile.specific.pvalue:                                                           #
#    0.25       0.5      0.75                                                        #
#0.5452044 0.1821452 0.5938421                                                       #



