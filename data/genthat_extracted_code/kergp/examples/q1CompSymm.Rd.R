library(kergp)


### Name: q1CompSymm
### Title: Qualitative Correlation or Covariance Kernel with one Input and
###   Compound Symmetric Correlation
### Aliases: q1CompSymm

### ** Examples

School <- factor(1L:3L, labels = c("Bad", "Mean" , "Good"))
myCor <- q1CompSymm(School, input = "School")
coef(myCor) <- 0.26

## Use a data.frame with a factor
set.seed(246)
newSchool <- factor(sample(1L:3L, size = 20, replace = TRUE),
                    labels = c("Bad", "Mean" , "Good"))
C1 <- covMat(myCor, X = data.frame(School = newSchool),
             compGrad = FALSE, lowerSQRT = FALSE)

## or use a matrix with integer content
C2 <- covMat(myCor, X = cbind(School = as.integer(newSchool)),
             compGrad = FALSE, lowerSQRT = FALSE)
max(abs(C1 - C2))



