library(UsingR)


### Name: father.son
### Title: Pearson's data set on heights of fathers and their sons
### Aliases: father.son
### Keywords: datasets

### ** Examples

data(father.son)
## like cover of Freedman, Pisani, and Purves
plot(sheight ~ fheight, data=father.son,bty="l",pch=20)
abline(a=0,b=1,lty=2,lwd=2)
abline(lm(sheight ~ fheight, data=father.son),lty=1,lwd=2)



