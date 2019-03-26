library(PairedData)


### Name: paired
### Title: Paired
### Aliases: paired

### ** Examples

x<-rnorm(15)
y<-rnorm(15)
p1<-paired(x,y)
show(p1)

data(IceSkating)
p2<-with(IceSkating,paired(Extension,Flexion))
show(p2)




