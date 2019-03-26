## ---- eval=F-------------------------------------------------------------
#   setwd('local folder')

## ---- eval=F-------------------------------------------------------------
#  install.packages('aGE.version.tar.gz',repos=NULL,type='source')

## ------------------------------------------------------------------------
     library(aGE)
     set.seed(12345)
     phenotype <- c(rep(1,50),rep(0,50))
    genotype <- data.frame(g1=sample(c(rep(1,10),rep(0,90))),g2=sample(c(rep(1,5), rep(0,95))))
    covariates <- data.frame(Envir=rnorm(100), Age=rnorm(100,60,5))
    exD <- list(Y=phenotype, G=genotype, X=covariates)
     aGE(Y=exD$Y, G=exD$G, cov=exD$X, model='binomial', nonparaE=F, stepwise=F)  
     aGE.joint(Y=exD$Y, G=exD$G, cov=exD$X, model='binomial', nonparaE=T, DF=5, method='Simulation') 

