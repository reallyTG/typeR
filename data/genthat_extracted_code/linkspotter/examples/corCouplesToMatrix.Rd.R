library(linkspotter)


### Name: corCouplesToMatrix
### Title: Couples to matrix
### Aliases: corCouplesToMatrix

### ** Examples

# calculate a correlation dataframe
data(iris)
corDF<-multiBivariateCorrelation(dataset = iris, corMethods = "MaxNMI")
corMatrix<-corCouplesToMatrix(x1_x2_val = corDF[,c('X1','X2',"MaxNMI")])
print(corMatrix)
corCouples<-matrixToCorCouples(corMatrix,coefName="pearson")
print(corCouples)




