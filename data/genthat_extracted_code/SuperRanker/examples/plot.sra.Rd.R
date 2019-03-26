library(SuperRanker)


### Name: plot.sra
### Title: Plot sequential rank agreement
### Aliases: plot.sra

### ** Examples

R1=c(1,2,3,4,5,7,6,8,9,10,11,12,13)
R2=c(5,11,4,7,8,3,12,13,6,10,9,2,1)
a <- sra(list(R1,R2))
plot(a)
arand = colMeans(do.call("rbind",lapply(1:20,function(b){
    sra(list(sample(R1),sample(R1)))
})))
lines(1:length(R1),arand,col=2,lwd=3)

l <- c(1,2,3,4,5,7,6,8,9,10,11,12,13)
l <- 1:100
aa <- sapply(1:20,function(i){
    sra(list(sample(l),sample(l),sample(l)))[i]
})
c(mean(aa),sd(aa))




