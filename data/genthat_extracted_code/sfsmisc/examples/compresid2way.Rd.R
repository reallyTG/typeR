library(sfsmisc)


### Name: compresid2way
### Title: Plot Components + Residuals for Two Factors
### Aliases: compresid2way
### Keywords: hplot

### ** Examples

 ## From Venables and Ripley (2002) p.165.
 N <- c(0,1,0,1,1,1,0,0,0,1,1,0,1,1,0,0,1,0,1,0,1,1,0,0)
 P <- c(1,1,0,0,0,1,0,1,1,1,0,0,0,1,0,1,1,0,0,1,0,1,1,0)
 K <- c(1,0,0,1,0,1,1,0,0,1,0,1,0,1,1,0,0,0,1,1,1,0,1,0)
 yield <- c(49.5,62.8,46.8,57.0,59.8,58.5,55.5,56.0,62.8,55.8,69.5,55.0,
            62.0,48.8,45.5,44.2,52.0,51.5,49.8,48.8,57.2,59.0,53.2,56.0)
 npk <- data.frame(block=gl(6,4), N=factor(N), P=factor(P),
                   K=factor(K), yield=yield)
 npk.cr <- compresid2way(yield ~ N+P+K, data=npk, fac=c("P","K"))

 ## Fisher's 1926 data on potatoe yield
 data(potatoes)
 pot.aov <- aov(yield ~ nitrogen+potash+pos, data=potatoes)
 compresid2way(pot.aov, pch=as.character(potatoes$pos))

 compresid2way(yield~nitrogen+potash, data=subset(potatoes, pos == 2))

 ## 2 x 3 design :
 data(warpbreaks)
 summary(fm1 <- aov(breaks ~ wool + tension, data = warpbreaks))
 compresid2way(fm1)



