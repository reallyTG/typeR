library(quantable)


### Name: mypairs
### Title: normal pairs plot with different pch and plus abline
### Aliases: mypairs

### ** Examples

tmp = matrix(rep((1:100),times = 4) + rnorm(100*4,0,3),ncol=4)
mypairs(tmp,log="xy",main="small data")
mypairs(tmp,log="xy",main="small data", legend=TRUE)



