library(Qtools)


### Name: tsrq
### Title: Quantile Regression Transformation Models
### Aliases: rcrq nlrq1 tsrq2 nlrq2 tsrq
### Keywords: transformations conditional quantiles

### ** Examples


###########################################################
## Example 1 - singly bounded (from Geraci and Jones, 2014)

## Not run: 
##D 
##D data(trees)
##D require(MASS)
##D 
##D dx <- 0.01
##D 
##D lambda0 <- boxcox(Volume ~ log(Height), data = trees,
##D 	lambda = seq(-0.9, 0.5, by = dx))
##D lambda0 <- lambda0$x[which.max(lambda0$y)]
##D trees$z <- bc(trees$Volume,lambda0)
##D trees$y <- trees$Volume
##D trees$x <- log(trees$Height)
##D trees$x <- trees$x - mean(log(trees$Height))
##D 
##D fit.lm <- lm(z ~ x, data = trees)
##D newd <- data.frame(x = log(seq(min(trees$Height),
##D 	max(trees$Height), by = 0.1)))
##D newd$x <- newd$x - mean(log(trees$Height))
##D ylm <- invbc(predict(fit.lm, newdata = newd), lambda0)
##D 
##D lambdas <- list(bc = seq(-10, 10, by=dx),
##D 	mcjIs = seq(0,10,by = dx), mcjIa = seq(0,20,by = dx))
##D 
##D taus <- 1:3/4
##D fit0 <- tsrq(y ~ x, data = trees, tsf = "bc", symm = FALSE,
##D 	lambda = lambdas$bc, tau = taus)
##D fit1 <- tsrq(y ~ x, data = trees, tsf = "mcjI", symm = TRUE,
##D 	dbounded = FALSE, lambda = lambdas$mcjIs, tau = taus)
##D fit2 <- tsrq(y ~ x, data = trees, tsf = "mcjI", symm = FALSE,
##D 	dbounded = FALSE, lambda = lambdas$mcjIa, tau = taus)
##D 
##D 
##D par(mfrow = c(1,3), mar = c(7.1, 7.1, 5.1, 2.1), mgp = c(5, 2, 0))
##D 
##D cx.lab <- 2.5
##D cx.ax <- 2
##D lw <- 2
##D cx <- 2
##D xb <- "log(Height)"
##D yb <- "Volume"
##D xl <- range(trees$x)
##D yl <- c(5,80)
##D 
##D yhat <- predict(fit0, newdata = newd)
##D plot(y ~ x, data = trees, xlim = xl, ylim = yl, main = "Box-Cox",
##D 	cex.lab = cx.lab, cex.axis = cx.ax, cex.main = cx.lab,
##D 	cex = cx, xlab = xb, ylab = yb)
##D lines(newd$x, yhat[,1], lwd = lw)
##D lines(newd$x, yhat[,2], lwd = lw)
##D lines(newd$x, yhat[,3], lwd = lw)
##D lines(newd$x, ylm, lwd = lw, lty = 2)
##D 
##D yhat <- predict(fit1, newdata = newd)
##D plot(y ~ x, data = trees, xlim = xl, ylim = yl, main = "Proposal I (symmetric)",
##D 	cex.lab = cx.lab, cex.axis = cx.ax, cex.main = cx.lab,
##D 	cex = cx, xlab = xb, ylab = yb)
##D lines(newd$x, yhat[,1], lwd = lw)
##D lines(newd$x, yhat[,2], lwd = lw)
##D lines(newd$x, yhat[,3], lwd = lw)
##D lines(newd$x, ylm, lwd = lw, lty = 2)
##D 
##D yhat <- predict(fit2, newdata = newd)
##D plot(y ~ x, data = trees, xlim = xl, ylim = yl, main = "Proposal I (asymmetric)",
##D 	cex.lab = cx.lab, cex.axis = cx.ax, cex.main = cx.lab,
##D 	cex = cx, xlab = xb, ylab = yb)
##D lines(newd$x, yhat[,1], lwd = lw)
##D lines(newd$x, yhat[,2], lwd = lw)
##D lines(newd$x, yhat[,3], lwd = lw)
##D lines(newd$x, ylm, lwd = lw, lty = 2)
## End(Not run)

###########################################################
## Example 2 - doubly bounded

## Not run: 
##D 
##D data(Chemistry)
##D 
##D Chemistry$gcse_gr <- cut(Chemistry$gcse, c(0,seq(4,8,by=0.5)))
##D with(Chemistry, plot(score ~ gcse_gr, xlab = "GCSE score",
##D 	ylab = "A-level Chemistry score"))
##D 
##D 
##D # The dataset has > 31000 observations and computation can be slow
##D set.seed(178)
##D chemsub <- Chemistry[sample(1:nrow(Chemistry), 2000), ]
##D 
##D # Fit symmetric Aranda-Ordaz quantile 0.9
##D tsrq(score ~ gcse, data = chemsub, tsf = "ao", symm = TRUE,
##D 	lambda = seq(0,2,by=0.01), tau = 0.9)
##D 
##D # Fit symmetric Proposal I quantile 0.9
##D tsrq(score ~ gcse, data = chemsub, tsf = "mcjI", symm = TRUE,
##D 	dbounded = TRUE, lambda = seq(0,2,by=0.01), tau = 0.9)
##D 
##D # Fit Proposal II quantile 0.9 (Nelder-Mead)
##D nlrq2(score ~ gcse, data = chemsub, dbounded = TRUE, tau = 0.9)
##D 
##D # Fit Proposal II quantile 0.9 (grid search)
##D # This is slower than nlrq2 but more stable numerically
##D tsrq2(score ~ gcse, data = chemsub, dbounded = TRUE,
##D 	lambda = seq(0, 2, by = 0.1), delta = seq(0, 2, by = 0.1),
##D 	tau = 0.9)
##D 
## End(Not run)

###########################################################
## Example 3 - doubly bounded

data(labor)

new <- labor
new$y <- new$pain
new$x <- (new$time-30)/30
new$x_gr <- as.factor(new$x)

par(mfrow = c(2,2))

cx.lab <- 1
cx.ax <- 2.5
cx <- 2.5
yl <- c(0,0.06)

hist(new$y[new$treatment == 1], xlab = "Pain score", main = "Medication group",
	freq = FALSE, ylim = yl)

plot(y ~ x_gr, new, subset = new$treatment == 1, xlab = "Time (min)",
	ylab = "Pain score", axes = FALSE, range = 0)
axis(1, at = 1:6, labels = c(0:5)*30 + 30)
axis(2)
box()

hist(new$y[new$treatment == 0], xlab = "Pain score", main = "Placebo group",
	freq = FALSE, ylim = yl)

plot(y ~ x_gr, new, subset = new$treatment == 0, xlab = "Time (min)",
	ylab = "Pain score", axes = FALSE, range = 0)
axis(1, at = 1:6, labels = (0:5)*30 + 30)
axis(2)
box()

#

## Not run: 
##D 
##D taus <- c(1:3/4)
##D ls <- seq(0,3.5,by=0.1)
##D 
##D fit.aos <- tsrq(y ~ x*treatment, data = new, tsf = "ao", symm = TRUE,
##D 	dbounded = TRUE, tau = taus, lambda = ls)
##D fit.aoa <- tsrq(y ~ x*treatment, data = new, tsf = "ao", symm = FALSE,
##D 	dbounded = TRUE, tau = taus, lambda = ls)
##D fit.mcjs <- tsrq(y ~ x*treatment, data = new, tsf = "mcjI", symm = TRUE,
##D 	dbounded = TRUE, tau = taus, lambda = ls)
##D fit.mcja <- tsrq(y ~ x*treatment, data = new, tsf = "mcjI", symm = FALSE,
##D 	dbounded = TRUE, tau = taus, lambda = ls)
##D fit.mcj2 <- tsrq2(y ~ x*treatment, data = new, dbounded = TRUE, tau = taus,
##D 	lambda = seq(0,2,by=0.1), delta = seq(0,1.5,by=0.3))
##D fit.nlrq <- nlrq2(y ~ x*treatment, data = new, start = coef(fit.mcj2, all = TRUE)[,1],
##D 	dbounded = TRUE, tau = taus)
##D 
##D sel <- 0 # placebo (change to sel == 1 for medication group)
##D x <- new$x
##D nd <- data.frame(x = seq(min(x), max(x), length=200), treatment = sel)
##D xx <- nd$x+1
##D 
##D par(mfrow = c(2,2))
##D 
##D fit <- fit.aos
##D yhat <- predict(fit, newdata = nd)
##D 
##D plot(y ~ x_gr, new, subset = new$treatment == sel, xlab = "",
##D 	ylab = "Pain score", axes = FALSE, main = "Aranda-Ordaz (s)",
##D 	range = 0, col = grey(4/5))
##D apply(yhat, 2, function(y,x) lines(x, y, lwd = 2), x = xx)
##D axis(1, at = 1:6, labels = (0:5)*30 + 30)
##D axis(2, at = c(0, 25, 50, 75, 100))
##D box()
##D 
##D fit <- fit.aoa
##D yhat <- predict(fit, newdata = nd)
##D 
##D plot(y ~ x_gr, new, subset = new$treatment == sel, xlab = "", ylab = "",
##D 	axes = FALSE, main = "Aranda-Ordaz (a)", range = 0, col = grey(4/5))
##D apply(yhat, 2, function(y,x) lines(x, y, lwd = 2), x = xx)
##D axis(1, at = 1:6, labels = (0:5)*30 + 30)
##D axis(2, at = c(0, 25, 50, 75, 100))
##D box()
##D 
##D fit <- fit.mcjs
##D yhat <- predict(fit, newdata = nd)
##D 
##D plot(y ~ x_gr, new, subset = new$treatment == sel, xlab = "Time (min)",
##D 	ylab = "Pain score", axes = FALSE, main = "Proposal I (s)",
##D 	range = 0, col = grey(4/5))
##D apply(yhat, 2, function(y,x) lines(x, y, lwd = 2), x = xx)
##D axis(1, at = 1:6, labels = (0:5)*30 + 30)
##D axis(2, at = c(0, 25, 50, 75, 100))
##D box()
##D 
##D fit <- fit.mcj2
##D yhat <- predict(fit, newdata = nd)
##D 
##D plot(y ~ x_gr, new, subset = new$treatment == sel, xlab = "Time (min)",
##D 	ylab = "", axes = FALSE, main = "Proposal II", range = 0, col = grey(4/5))
##D apply(yhat, 2, function(y,x) lines(x, y, lwd = 2), x = xx)
##D axis(1, at = 1:6, labels = (0:5)*30 + 30)
##D axis(2, at = c(0, 25, 50, 75, 100))
##D box()
## End(Not run)




