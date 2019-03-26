library(s20x)


### Name: estimateContrasts
### Title: Contrast Estimates
### Aliases: estimateContrasts
### Keywords: models

### ** Examples


## computer data:
data(computer.df)
computer.df = within(computer.df, {selfassess = factor(selfassess)})
computer.fit = lm(score ~ selfassess, data = computer.df)
contrast.matrix = matrix(c(-1/2, -1/2, 1), byrow = TRUE, nrow = 1, ncol = 3)
contrast.matrix
s20x:::estimateContrasts(contrast.matrix,computer.fit)



