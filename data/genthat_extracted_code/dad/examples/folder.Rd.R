library(dad)


### Name: folder
### Title: Folder of data sets
### Aliases: folder

### ** Examples

# First example              
x1 <- data.frame(x = rnorm(10), y = 1:10)
x2 <- data.frame(x = rnorm(10), z = runif(10, 1, 10))
f1 <- folder(x1, x2)
print(f1)

f2 <- folder(x1, x2, cols.select = "union")
print(f2)

#Second example
data(iris)
iris.set <- iris[iris$Species == "setosa", 1:4]
iris.ver <- iris[iris$Species == "versicolor", 1:4]
iris.vir <- iris[iris$Species == "virginica", 1:4]
irisf1 <- folder(iris.set, iris.ver, iris.vir)
print(irisf1)

listofdf <- list(df1 = iris.set,df2 = iris.ver,df3 = iris.vir)
irisf2 <- folder(listofdf,x2 = NULL)
print(irisf2)



