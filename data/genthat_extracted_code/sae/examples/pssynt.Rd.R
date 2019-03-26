library(sae)


### Name: pssynt
### Title: Post-stratified synthetic estimators of domain means.
### Aliases: pssynt
### Keywords: method

### ** Examples

# Compute post-stratified synthetic estimators of mean income 
# for provinces considering the education levels codes 
# (variable educ) as post-strata.

# Load data set
data(incomedata)   

# Load province sizes by education levels
data(sizeprovedu)

# Compute post-stratified synthetic estimators with province labels 
# as domain codes
colnames(sizeprovedu) <- c("provlab", "prov", "0", "1", "2", "3")
result1 <- pssynt(y=income, sweight=weight, ps=educ,
                  domsizebyps=sizeprovedu[,-2], data=incomedata)
result1

# Now with province codes as domain codes
colnames(sizeprovedu) <- c("provlab", "prov", "0", "1", "2", "3")
result2 <- pssynt(y=income, sweight=weight, ps=educ,
                  domsizebyps=sizeprovedu[,-1], data=incomedata)
result2



