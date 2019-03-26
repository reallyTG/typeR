library(quantable)


### Name: volcanoplot
### Title: volcano plot
### Aliases: volcanoplot

### ** Examples


library(quantable)
foldchange <- rnorm(1000)
pvals <-rexp(1000)
length(foldchange)
length(pvals)
volcanoplot(foldchange, pvals, pthresh=0.1, foldchangethresh=1,main='test')
volcanoplot(foldchange, pvals, pthresh=0.1,
 foldchangethresh=1,main='test', labels=rep("abcde", length(pvals)))

volcanoplot(foldchange, pvals,pthresh=0.1, foldchangethresh=3,main='test')
abline(v=0.05,col=2)




