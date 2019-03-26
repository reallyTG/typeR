library(PairedData)


### Name: paired-class
### Title: Class '"paired"'
### Aliases: paired-class
### Keywords: classes

### ** Examples

data(IceSkating)
p<-with(IceSkating,paired(Extension,Flexion))
show(p)
plot(p)
summary(p)
effect.size(p)



