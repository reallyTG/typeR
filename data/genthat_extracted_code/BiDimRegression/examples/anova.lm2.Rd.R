library(BiDimRegression)


### Name: anova.lm2
### Title: Anova for lm2 objects
### Aliases: anova.lm2

### ** Examples

lm2euc <- lm2(depV1+depV2~indepV1+indepV2, NakayaData, transformation = 'Euclidean')
lm2aff <- lm2(depV1+depV2~indepV1+indepV2, NakayaData, transformation = 'Affine')
anova(lm2euc, lm2aff)



