library(RSDA)


### Name: classic.to.sym
### Title: Generate a symbolic data table
### Aliases: classic.to.sym
### Keywords: data symbolic table

### ** Examples

result <- classic.to.sym(data = iris,
              concept = "Species",
              variables = c(Sepal.Length,Sepal.Width,Petal.Length,Petal.Width))
result

result <- classic.to.sym(data = iris,
concept = "Species", # concepto
variables = c(Sepal.Length,Sepal.Width,Petal.Length,Petal.Width), # variable a utilizar
variables.types = c(Sepal.Length = type.interval(), # tipo para cada una de las variable
             Sepal.Width = type.interval(),
             Petal.Length = type.interval(),
             Petal.Width = type.interval()))
result



