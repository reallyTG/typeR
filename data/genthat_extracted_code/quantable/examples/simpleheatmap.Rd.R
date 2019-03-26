library(quantable)


### Name: simpleheatmap
### Title: heatmap2 facade
### Aliases: simpleheatmap

### ** Examples

tmp = matrix(rep((1:100),times = 4) + rnorm(100*4,0,3),ncol=4)
mean = c(20,30,10,40)
sd = c(4,3,4,5)
tmp = sweep(tmp,2,sd,"*")
tmp = sweep(tmp,2,mean,"+")
par(mar=c(5,5,5,5))
simpleheatmap(tmp,ColSideColors=c("red","blue","pink","black"))
simpleheatmap(tmp)



