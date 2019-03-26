library(rrcov)


### Name: LdaClassic
### Title: Linear Discriminant Analysis
### Aliases: LdaClassic LdaClassic.formula LdaClassic.default
### Keywords: robust multivariate

### ** Examples

## Example anorexia
library(MASS)
data(anorexia)

## rrcov: LdaClassic()
lda <- LdaClassic(Treat~., data=anorexia)
predict(lda)@classification

## MASS: lda()
lda.MASS <- lda(Treat~., data=anorexia)
predict(lda.MASS)$class

## Compare the prediction results of MASS:::lda() and LdaClassic()
all.equal(predict(lda)@classification, predict(lda.MASS)$class)



