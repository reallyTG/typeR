library(linkspotter)


### Name: matrixToCorCouples
### Title: Matrix to couples
### Aliases: matrixToCorCouples

### ** Examples

# calculate a correlation dataframe
data(iris)
corDF<-multiBivariateCorrelation(dataset = iris)
corMatrix<-corCouplesToMatrix(x1_x2_val = corDF[,c('X1','X2',"pearson")])
print(corMatrix)
corCouples<-matrixToCorCouples(matrix = corMatrix,coefName="pearson")
print(corCouples)




