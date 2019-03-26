library(sra)


### Name: 1. sra package
### Title: Selection Response Analysis: a R package
### Aliases: sra-package sra
### Keywords: package

### ** Examples

########### Generating a dummy dataset ################

m <- c(12,11,12,14,18,17,19,22,20,19)
v <- c(53,47,97,155,150,102,65,144,179,126)
s <- c(15,14,14,17,21,20,22,25,24,NA)
n <- c(100,80,120,60,100,90,110,80,60,100)

########## Making a sra data set #######################
data <- sraData(phen.mean=m, phen.var=v, phen.sel=s, N=n)

#################### Data Analysis ####################

# Autoregressive models
autor <- sraAutoreg(data)

# AIC of the model:
AIC(autor)

# Maximum-likelihood estimates
coef(autor)

autor.herit <- sraAutoregHerit(data)
autor.evolv <- sraAutoregEvolv(data)

# Mechanistic models

# Constant variance
cstvar <- sraCstvar(data)
# Inbreeding
drift <- sraDrift(data)

# Plotting
plot(drift)
plot(drift, var=TRUE)




