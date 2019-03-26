library(sra)


### Name: 3. Mechanistic models
### Title: Descriptive models of artificial-selection responses:
###   quantitative genetics models
### Aliases: sraCstvar sraDrift sraMutation sraCanalization
###   sraCanalizationOpt sraSelection sraDirepistasis
### Keywords: models nonlinear ts

### ** Examples

########### Generating a dummy dataset ################

m <- c(12,11,12,14,18,17,19,22,20,19)
v <- c(53,47,97,155,150,102,65,144,179,126)
s <- c(15,14,14,17,21,20,22,25,24,NA)
n <- c(100,80,120,60,100,90,110,80,60,100)

########## Making a sra data set #######################
data <- sraData(phen.mean=m, phen.var=v, phen.sel=s, N=n)

#################### Data Analysis ####################

cstvar <- sraCstvar(data)
drift <- sraDrift(data)
direpi <- sraDirepistasis(data)

# In case of convergence problems, better starting values can be provided:
direpi <- sraDirepistasis(data, start=list(mu0=10, logvarA0=log(20), logvarE0=NA), 
fixed=list(logNe=log(50)))

plot(cstvar)

AIC(direpi)



