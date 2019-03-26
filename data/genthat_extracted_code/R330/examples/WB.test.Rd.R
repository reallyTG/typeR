library(R330)


### Name: WB.test
### Title: Performs a Weisberg-Bingham test for normality
### Aliases: WB.test WB.test.lm WB.test.formula
### Keywords: univar

### ** Examples

data(cherry.df)
cherry.lm =lm(volume~diameter+height,data=cherry.df) 
WB.test(cherry.lm)



