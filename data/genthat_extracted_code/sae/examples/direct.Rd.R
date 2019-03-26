library(sae)


### Name: direct
### Title: Direct estimators.
### Aliases: direct
### Keywords: method

### ** Examples

# Load data set with synthetic income data for provinces (domains)
data(incomedata)

# Load population sizes of provinces
data(sizeprov)   

# Compute Horvitz-Thompson direct estimator of mean income for each 
# province under random sampling without replacement within each province.
result1 <- direct(y=income, dom=prov, sweight=weight,
                   domsize=sizeprov[,2:3], data=incomedata)
result1

# The same but using province labels as domain codes
result2 <- direct(y=incomedata$income, dom=incomedata$provlab,
                  sweight=incomedata$weight, domsize=sizeprov[,c(1,3)])
result2

# The same, under SRS without replacement within each province.
result3 <- direct(y=income ,dom=provlab, domsize=sizeprov[,c(1,3)],
                  data=incomedata)
result3

# Compute direct estimator of mean income for each province
# under SRS with replacement within each province
result4 <- direct(y=income, dom=provlab, data=incomedata, replace=TRUE)
result4



