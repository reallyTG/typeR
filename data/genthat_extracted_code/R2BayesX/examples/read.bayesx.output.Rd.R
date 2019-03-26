library(R2BayesX)


### Name: read.bayesx.output
### Title: Read BayesX Output from Directories
### Aliases: read.bayesx.output
### Keywords: regression

### ** Examples

## load example data from
## package example folder
dir <- file.path(find.package("R2BayesX"), "/examples/ex01")
b <- read.bayesx.output(dir)

## some model summaries
print(b)
summary(b)

## now plot estimated effects
plot(b)

## 2nd example
dir <- file.path(find.package("R2BayesX"), "/examples/ex02")
list.files(dir)

## dir contains of 2 different
## base names
## 01 only one nonparametric effect
b <- read.bayesx.output(dir, model.name = "nonparametric")
plot(b)

## 02 only one bivariate
## nonparametric effect
b <- read.bayesx.output(dir, model.name = "surface")
plot(b)



