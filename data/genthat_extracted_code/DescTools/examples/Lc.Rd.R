library(DescTools)


### Name: Lc
### Title: Lorenz Curve
### Aliases: Lc 'Lorenz curve' Lc.default Lc.formula plot.Lc plot.Lclist
###   lines.Lc
### Keywords: univar

### ** Examples

priceCarpenter <- d.pizza$price[d.pizza$driver=="Carpenter"]
priceMiller <- d.pizza$price[d.pizza$driver=="Miller"]

# compute the Lorenz curves
Lc.p <- Lc(priceCarpenter, na.rm=TRUE)
Lc.u <- Lc(priceMiller, na.rm=TRUE)
plot(Lc.p)
lines(Lc.u, col=2)

# the picture becomes even clearer with generalized Lorenz curves
plot(Lc.p, general=TRUE)
lines(Lc.u, general=TRUE, col=2)

# inequality measures emphasize these results, e.g. Atkinson's measure
Atkinson(priceCarpenter, na.rm=TRUE)
Atkinson(priceMiller, na.rm=TRUE)


# income distribution of the USA in 1968 (in 10 classes)
# x vector of class means, n vector of class frequencies
x <- c(541, 1463, 2445, 3438, 4437, 5401, 6392, 8304, 11904, 22261)
n <- c(482, 825, 722, 690, 661, 760, 745, 2140, 1911, 1024)

# compute minimal Lorenz curve (= no inequality in each group)
Lc.min <- Lc(x, n=n)
plot(Lc.min)


# input of frequency tables with midpoints of classes
fl <- c(2.5,7.5,15,35,75,150)   # midpoints
n  <- c(25,13,10,5,5,2)	        # frequencies

plot(Lc(fl, n),                 # Lorenz-Curve
     panel.first=grid(10, 10),
     main="Lorenzcurve Farmers",
     xlab="Percent farmers (cumulative)",
     ylab="Percent of area (%)"
)
# add confidence band
lines(Lc(fl, n), conf.level=0.95,
      args.cband=list(col=SetAlpha(DescToolsOptions("col")[2], 0.3)))

Gini(fl, n)

# find specific function values using appprox
x <- c(1,1,4)
lx <- Lc(x)
plot(lx)

# get interpolated function value at p = 0.55
y0 <- approx(x=lx$p, y=lx$L, xout=0.55)
abline(v=0.55, h=y0$y, lty="dotted")

# and for the inverse question
y0 <- approx(x=lx$L, y=lx$p, xout=0.6)
abline(h=0.6, v=y0$y, col="red")

text(x=0.1, y=0.65, label=expression(L^{-1}*(0.6) == 0.8), col="red")
text(x=0.65, y=0.2, label=expression(L(0.55) == 0.275))

# input of frequency tables with midpoints of classes
fl <- c(2.5,7.5,15,35,75,150)     # midpoints
n  <- c(25,13,10,5,5,2)           # frequencies

# the formula interface for Lc
lst <- Lc(count ~ cut(price, breaks=5), data=d.pizza)

plot(lst, col=1:length(lst), panel.first=grid(), lwd=2)
legend(x="topleft", legend=names(lst), fill=1:length(lst))

# Describe with Desc-function
lx <- Lc(fl, n)
Desc(lx)




