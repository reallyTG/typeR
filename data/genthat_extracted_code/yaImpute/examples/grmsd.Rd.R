library(yaImpute)


### Name: grmsd
### Title: Generalized Root Mean Square Distance Between Observed and
###   Imputed Values
### Aliases: grmsd
### Keywords: multivariate

### ** Examples

require(yaImpute)

data(iris)
set.seed(12345)

# form some test data
refs=sample(rownames(iris),50)
x <- iris[,1:2]      # Sepal.Length Sepal.Width
y <- iris[refs,3:4]  # Petal.Length Petal.Width

# build yai objects using 2 methods
msn <- yai(x=x,y=y)
mal <- yai(x=x,y=y,method="mahalanobis")

# compute the average distances between observed and imputed (predicted)
grmsd(msn,mal,lmFit=lm(as.matrix(y) ~ ., data=x[refs,]))

# use the all variables and observations in iris
# Species is a factor and is automatically deleted with a warning
grmsd(msn,mal,ancillaryData=iris)

# here is an example using lm, and another using column
# means as predictions.

impMean <- y 
colnames(impMean) <- paste0(colnames(impMean),".o")
impMean <- cbind(impMean,y)
# set the predictions to the mean's of the variables
impMean[,"Petal.Length"] <- mean(impMean[,"Petal.Length"])
impMean[,"Petal.Width"]  <- mean(impMean[,"Petal.Width"])

grmsd(msn, mal, lmFit=lm(as.matrix(y) ~ ., data=x[refs,]), impMean )

# compare to using function rmsd (values match):
msnimp <- na.omit(impute(msn))
grmsd(msnimp[,c("Petal.Length","Petal.Length.o")])   
rmsd(msnimp[,c("Petal.Length","Petal.Length.o")],scale=TRUE)

# these are multivariate cases and they don't match
# because the covariance of the two variables is > 0.
grmsd(msnimp)
colSums(rmsd(msnimp,scale=TRUE))/2

# get the vectors and make a boxplot, identify outliers
stats <- boxplot(grmsd(msn,mal,ancillaryData=iris[,-5],rtnVectors=TRUE),
                 ylab="Mahalanobis distance")
stats$out
#     118      132 
#2.231373 1.990961 



