library(PairedData)


### Name: effect.size
### Title: Effect size computations for paired data
### Aliases: effect.size effect.size,paired-method

### ** Examples

z<-rnorm(20)
x<-rnorm(20)+z
y<-rnorm(20)+z+1
p<-paired(x,y)
effect.size(p)



