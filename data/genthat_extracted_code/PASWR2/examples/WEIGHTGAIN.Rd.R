library(PASWR2)


### Name: WEIGHTGAIN
### Title: Weight Gain in Rats
### Aliases: WEIGHTGAIN
### Keywords: datasets

### ** Examples

ggplot(data = WEIGHTGAIN, aes(x = proteinamount, y = weightgain, 
fill = proteinsource)) + geom_boxplot()
aov(weightgain ~ proteinsource*proteinamount, data = WEIGHTGAIN)



