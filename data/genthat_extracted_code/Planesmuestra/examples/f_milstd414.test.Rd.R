library(Planesmuestra)


### Name: f_milstd414.test
### Title: Accept or reject a variable sample considering a shift factor
### Aliases: f_milstd414.test
### Keywords: acceptance shift

### ** Examples

x<-c(4.7,5.1,4.9,4.9,4.8,4.9,4.9,4.8,4.8,4.7,4.7,4.9,4.8,4.9,4.6,4.8,4.9,5.1,4.8,5,5,4.7,5,5,4.8)
f_milstd414.test(as.data.frame(x),k=1.98,Limite="S", L=5.1)
f_milstd414.test(as.data.frame(x),k=1.98,Limite="I", L=4.7)



