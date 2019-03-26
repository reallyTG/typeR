library(BiDimRegression)


### Name: lm2
### Title: Fitting Bidimensional Regression Models
### Aliases: lm2

### ** Examples

lm2euc <- lm2(depV1 + depV2 ~ indepV1 + indepV2, NakayaData, 'euclidean')
lm2aff <- lm2(depV1 + depV2 ~ indepV1 + indepV2, NakayaData, 'affine')
lm2prj <- lm2(depV1 + depV2 ~ indepV1 + indepV2, NakayaData, 'projective')
anova(lm2euc, lm2aff, lm2prj)
predict(lm2euc)
summary(lm2euc)



