library(deisotoper)


### Name: findNN
### Title: find index of nearest neighbor.
### Aliases: findNN

### ** Examples

(NNidx <- findNN(q<-c(1, 1.0001, 1.24, 1.26), DB<-seq(1,5,by=0.25)))
(NNidx == c(1,1,2,2))

# should be 0
unique(DB[findNN(DB,DB)] - DB)



