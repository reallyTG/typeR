library(lsplsGlm)


### Name: BreastCancer
### Title: Gene expression and clinical data used to predict the presence
###   of subclinical metastases for breast cancer patients
### Aliases: BreastCancer

### ** Examples

# load dataset
data(BreastCancer)

# how many patients and how many genes ?
dim(BreastCancer$X)

# how many patients of class 0 and 1 respectively ?
sum(BreastCancer$Y==0)
sum(BreastCancer$Y==1)



