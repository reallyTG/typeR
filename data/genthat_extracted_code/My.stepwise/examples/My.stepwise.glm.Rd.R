library(My.stepwise)


### Name: My.stepwise.glm
### Title: Stepwise Variable Selection Procedure for Generalized Linear
###   Models
### Aliases: My.stepwise.glm

### ** Examples

data("iris")
names(iris)
my.data <- iris[51:150, ]
my.data$Width <- (my.data$Sepal.Width + my.data$Petal.Width)/2
names(my.data)
dim(my.data)
my.data$Species1 <- ifelse(my.data$Species == "virginica", 1, 0)
my.variable.list <- c("Sepal.Length", "Petal.Length")
My.stepwise.glm(Y = "Species1", variable.list = my.variable.list,
    in.variable = c("Width"), data = my.data, myfamily = "binomial")

my.variable.list <- c("Sepal.Length", "Sepal.Width", "Width")
My.stepwise.glm(Y = "Species1", variable.list = my.variable.list,
    data = my.data, sle = 0.25, sls = 0.25, myfamily = "binomial")



