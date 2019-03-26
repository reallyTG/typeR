library(sae)


### Name: ssd
### Title: Sample size dependent estimator.
### Aliases: ssd
### Keywords: method

### ** Examples

# We compute sample size dependent estimators of mean income by  
# composition of the Horvitz-Thompson direct estimator and the  
# post-stratified synthetic estimator with age groups as post-strata.

# Load data set
data(incomedata)

# Load population sizes of provinces (domains)
data(sizeprov)  

# First we compute Horvitz-Thompson direct estimators
dir <- direct(y=income, dom=provlab, sweight=weight,
              domsize=sizeprov[,c(1,3)], data=incomedata)

# Now we compute post-stratified synthetic estimators with education 
# levels as post-strata
# Load province sizes by education levels
data(sizeprovedu)

# Compute post-stratified synthetic estimators
colnames(sizeprovedu) <- c("provlab", "prov", "0", "1", "2", "3")
synth <- pssynt(y=income, sweight=weight, ps=educ,
                domsizebyps=sizeprovedu[,-2], data=incomedata)
                
# Compute sample size dependent estimators of province mean income
# by composition of Horvitz-Thompson direct estimators and 
# post-stratified estimators for delta=1
comp <- ssd(dom=provlab, sweight=weight, domsize=sizeprov[,c(1,3)],
            direct=dir[,c("Domain","Direct")], synthetic=synth, data=incomedata)
comp



