library(genridge)


### Name: vif.ridge
### Title: Variance Inflation Factors for Ridge Regression
### Aliases: vif.ridge
### Keywords: models regression

### ** Examples

data(longley)
lmod <- lm(Employed ~ GNP + Unemployed + Armed.Forces + Population + 
                      Year + GNP.deflator, data=longley)
vif(lmod)

longley.y <- longley[, "Employed"]
longley.X <- data.matrix(longley[, c(2:6,1)])

lambda <- c(0, 0.005, 0.01, 0.02, 0.04, 0.08)
lridge <- ridge(longley.y, longley.X, lambda=lambda)
coef(lridge)


vridge <- vif(lridge)
vridge

# plot VIFs
pch <- c(15:18, 7, 9)
clr <- c("black", rainbow(5, start=.6, end=.1))

matplot(rownames(vridge), vridge, type='b', 
	xlab='Ridge constant (k)', ylab="Variance Inflation", 
	xlim=c(0, 0.08), 
	col=clr, pch=pch, cex=1.2)
text(0.0, vridge[1,], colnames(vridge), pos=4)

matplot(lridge$df, vridge, type='b', 
	xlab='Degrees of freedom', ylab="Variance Inflation", 
	col=clr, pch=pch, cex=1.2)
text(6, vridge[1,], colnames(vridge), pos=2)

# more useful to plot VIF on the sqrt scale

matplot(rownames(vridge), sqrt(vridge), type='b', 
	xlab='Ridge constant (k)', ylab=expression(sqrt(VIF)), 
	xlim=c(-0.01, 0.08), 
	col=clr, pch=pch, cex=1.2, cex.lab=1.25)
text(-0.01, sqrt(vridge[1,]), colnames(vridge), pos=4, cex=1.2)

matplot(lridge$df, sqrt(vridge), type='b', 
	xlab='Degrees of freedom', ylab=expression(sqrt(VIF)), 
	col=clr, pch=pch, cex=1.2, cex.lab=1.25)
text(6, sqrt(vridge[1,]), colnames(vridge), pos=2, cex=1.2)




