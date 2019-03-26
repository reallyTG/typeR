library(caroline)


### Name: nerge
### Title: Named Merge
### Aliases: nerge
### Keywords: manip

### ** Examples


df <- data.frame(a=c(6,7,8), b=c(9,8,7))
rownames(df) <- c('a','d','c')

l <- list(x=nv(c(1,2),c('a','b')),y=nv(c(2,3),c('b','d')),z=nv(c(4,1),c('c','d') ), w=df)
nerge(l, all=TRUE)


l2 <- list(a=nv(c(1.23, 1.423, 2.343), c('z','y','x')),b=nv(c(6.34,7.34, 12.545),c('z','w','y')))
nerge(l2, all=TRUE)





