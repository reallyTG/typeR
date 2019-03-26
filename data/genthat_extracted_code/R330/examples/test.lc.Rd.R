library(R330)


### Name: test.lc
### Title: tests hypothesis cc^Tb=c
### Aliases: test.lc test.lc.lm test.lc.glm test.lc.formula
### Keywords: univar

### ** Examples

data(cherry.df)
cherry.lm = lm(log(volume)~log(diameter)+log(height),data=cherry.df)
cc = c(0,1,1)
c = 3
test.lc(cherry.lm, cc, c)



