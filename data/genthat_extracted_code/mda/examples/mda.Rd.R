library(mda)


### Name: mda
### Title: Mixture Discriminant Analysis
### Aliases: mda print.mda
### Keywords: classif

### ** Examples

data(iris)
irisfit <- mda(Species ~ ., data = iris)
irisfit
## Call:
## mda(formula = Species ~ ., data = iris)
##
## Dimension: 4
##
## Percent Between-Group Variance Explained:
##     v1     v2     v3     v4
##  96.02  98.55  99.90 100.00
##
## Degrees of Freedom (per dimension): 5
##
## Training Misclassification Error: 0.02 ( N = 150 )
##
## Deviance: 15.102

data(glass)
# random sample of size 100
samp <- c(1, 3, 4, 11, 12, 13, 14, 16, 17, 18, 19, 20, 27, 28, 31,
          38, 42, 46, 47, 48, 49, 52, 53, 54, 55, 57, 62, 63, 64, 65,
          67, 68, 69, 70, 72, 73, 78, 79, 83, 84, 85, 87, 91, 92, 94,
          99, 100, 106, 107, 108, 111, 112, 113, 115, 118, 121, 123,
          124, 125, 126, 129, 131, 133, 136, 139, 142, 143, 145, 147,
          152, 153, 156, 159, 160, 161, 164, 165, 166, 168, 169, 171,
          172, 173, 174, 175, 177, 178, 181, 182, 185, 188, 189, 192,
          195, 197, 203, 205, 211, 212, 214) 
glass.train <- glass[samp,]
glass.test <- glass[-samp,]
glass.mda <- mda(Type ~ ., data = glass.train)
predict(glass.mda, glass.test, type="post") # abbreviations are allowed
confusion(glass.mda,glass.test)



