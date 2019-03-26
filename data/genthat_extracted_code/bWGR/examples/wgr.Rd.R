library(bWGR)


### Name: WGR1 (MCMC)
### Title: Whole-genome Regression
### Aliases: wgr KMUP KMUP2 GSEN BayesA BayesA2 BayesB BayesB2 BayesC
###   BayesCpi BayesDpi BayesL BayesRR BayesRR2 mcmcCV

### ** Examples

# Load data
data(tpod)

# BLUP
BRR = wgr(y,gen,iv=FALSE,pi=0,it=200,bi=50)
cor(y,BRR$hat)

# BayesA
BayesA = wgr(y,gen,iv=TRUE,pi=0,it=200,bi=50)
cor(y,BayesA$hat)

# BayesB
BayesB = wgr(y,gen,iv=TRUE,pi=.95,it=200,bi=50)
cor(y,BayesB$hat)

# BayesC
BayesC = wgr(y,gen,iv=FALSE,pi=.95,it=200,bi=50)
cor(y,BayesC$hat)

# BayesL
BayesL = wgr(y,gen,de=TRUE,it=200,bi=50)
cor(y,BayesL$hat)

# Bagging BLUP
Bag = wgr(y,gen,bag=0.5,it=200,bi=50)
cor(y,Bag$hat)



