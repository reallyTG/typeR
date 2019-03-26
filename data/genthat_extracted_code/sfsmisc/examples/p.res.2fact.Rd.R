library(sfsmisc)


### Name: p.res.2fact
### Title: Plot Numeric (e.g. Residuals) vs 2 Factors Using Boxplots
### Aliases: p.res.2fact
### Keywords: hplot regression

### ** Examples

I <- 8; J <- 3; K <- 20
xx <- factor(rep(rep(1:I, rep(K,I)),J))
yy <- factor(rep(1:J, rep(I*K,J)))
zz <- rt(I*J*K, df=5) #-- Student t with 5 d.f.
p.res.2fact(xx,yy,zz, restr= 4, main= "i.i.d. t <- 5 random  |.| <= 4")
mtext("p.res.2fact(xx,yy,zz, restr= 4, ..)",
      line=1, adj=1, outer=TRUE, cex=1)

## Real data
data(warpbreaks)
(fm1 <- lm(breaks ~ wool*tension, data = warpbreaks))
## call via formula method of p.res.2x():
p.res.2x(~ ., fm1) # is shorter than, but equivalent to
## p.res.2x(~ wool + tension, fm1)  ##  or the direct
## with(warpbreaks, p.res.2fact(wool, tension, residuals(fm1)))
##
## whereas this is "transposed":
p.res.2x(~ tension+wool, fm1)



