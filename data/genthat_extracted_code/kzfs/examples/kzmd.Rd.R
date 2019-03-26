library(kzfs)


### Name: kzmd
### Title: Yet Another Multi-dimensional Kolmogorov-Zurbenko Filter
### Aliases: kzmd
### Keywords: KZ-filter

### ** Examples

zs <- rbind(c(0,5,1,40),c(12,6,1,10),c(6,7,1,20),c(15,15,4,80))
colnames(zs) <- c("x","y","z","v")
zs <- kzmd(data.frame(zs), scale=c(1,1,1), window=c(3,5,3), k=4)
u <- zs[zs$z==1, -3]
x = sort(unique(u$x))
y = sort(unique(u$y))
z=df2mt(u, scale=c(1,1))	# Transfer from data frame to matrix.
image(x=x, y=y, z=z)




