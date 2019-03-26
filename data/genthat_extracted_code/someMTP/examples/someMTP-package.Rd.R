library(someMTP)


### Name: someMTP-package
### Title: Some Multiple Testing Procedures
### Aliases: someMTP-package someMTP
### Keywords: package

### ** Examples

set.seed(13)
y <- matrix(rnorm(5000),5,1000) #create toy data
y[,1:100] <- y[,1:100]+3 #create toy data

p <- apply(y,2,function(y) t.test(y)$p.value) #compute p-values
M2 <- apply(y^2,2,mean) #compute ordering criterion

fdr   <- p.adjust(p,method="BH") #(unweighted) procedure, fdr control
 sum(fdr<.05)
fdr.w <- p.adjust.w(p,method="BH",w=M2) #weighted procedure, weighted fdr control
 sum(fdr.w<.05)
 
fwer   <- p.adjust(p,method="holm") #(unweighted) procedure, fwer control
 sum(fwer<.05)
fwer.w <- p.adjust.w(p,method="BHfwe",w=M2) #weighted procedure, weighted fwer (=fwer) control
sum(fwer.w<.05)

plot(M2,-log10(p))



