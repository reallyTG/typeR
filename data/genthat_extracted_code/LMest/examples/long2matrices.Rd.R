library(LMest)


### Name: long2matrices
### Title: From data in the long format to data in array format
### Aliases: long2matrices

### ** Examples

# Example based on SRHS data
# load SRHS data
data(data_SRHS_long)
dataSRHS = data_SRHS_long[1:1600,]
head(dataSRHS)
X = cbind(dataSRHS$gender-1,dataSRHS$race==2|dataSRHS$race==3,
dataSRHS$education==4,dataSRHS$education==5,dataSRHS$age-50,
(dataSRHS$age-50)^2/100)
Y = dataSRHS$srhs
res = long2matrices(dataSRHS$id,X=X,Y=Y)



