## ---- message  = FALSE---------------------------------------------------
library(BayesGOF)
set.seed(8697)
data(rat)
###Use MLE to determine starting values
rat.start <- gMLE.bb(rat$y, rat$n)$estimate

## ------------------------------------------------------------------------
rat.ds <- DS.prior(rat, max.m = 6, rat.start, family = "Binomial")

## ---- fig.height = 5.5, fig.width = 5.5, fig.align = 'center'------------
plot(rat.ds, plot.type = "Ufunc")

## ------------------------------------------------------------------------
rat.ds

## ----fig.height = 5.5, fig.width = 5.5,fig.align = 'center'--------------
plot(rat.ds, plot.type = "DSg", main = "DS vs g: Rat")

## ---- warning = FALSE----------------------------------------------------
rat.macro.md <- DS.macro.inf(rat.ds, num.modes = 2 , iters = 15, method = "mode") 

## ------------------------------------------------------------------------
rat.macro.md

## ---- fig.height = 5.5, fig.width = 5.5,fig.align = 'center'-------------

plot(rat.macro.md, main = "MacroInference: Rat")

## ---- fig.align = 'center'-----------------------------------------------
rat.y71.micro <- DS.micro.inf(rat.ds, y.0 = 4, n.0 = 14)
rat.y71.micro

## ----fig.height = 5.5, fig.width = 5.5,fig.align = 'center'--------------
plot(rat.y71.micro, main = "Rat (4,14)")

## ---- fig.align = 'center'-----------------------------------------------
rat.y71.FB <- DS.Finite.Bayes(rat.ds, y.0 = 4, n.0 = 14, iters = 15)
rat.y71.FB

## ----fig.height = 5.5, fig.width = 5.5,fig.align = 'center'--------------
plot(rat.y71.FB, xlim = c(0,.5), ylim = c(0, 9))
legend("topright", c("DS Post", "DS Finite Bayes Post", "Parametric Post"), col = c("red", "darkgreen", "blue"), lty = c("solid","solid","dashed"), cex = 1)

## ------------------------------------------------------------------------
data(galaxy)
gal.start <- gMLE.nn(galaxy$y, galaxy$se, method = "DL")$estimate

## ------------------------------------------------------------------------
gal.ds.L2 <- DS.prior(galaxy[,c(1,2)], max.m = 6, g.par = gal.start, family = "Normal", LP.type = "L2")
gal.ds.ME <- DS.prior(galaxy[, c(1,2)], max.m = 6, g.par = gal.start, family = "Normal", LP.type = "MaxEnt")

## ---- fig.height = 3.25, fig.width = 3.25, fig.show = 'hold'-------------
plot(gal.ds.L2, plot.type = "Ufunc", main = "L2 U-function")
plot(gal.ds.L2, plot.type = "DSg", main = "L2 DS vs g")
plot(gal.ds.ME, plot.type = "Ufunc", main = "MaxEnt U-function")
plot(gal.ds.ME, plot.type = "DSg", main = "MaxEnt DS vs g")

## ------------------------------------------------------------------------
gal.ds.L2
gal.ds.ME

## ------------------------------------------------------------------------
data(arsenic)
arsn.start <- gMLE.nn(arsenic$y, arsenic$se, method = "DL")$estimate

## ------------------------------------------------------------------------
arsn.ds <- DS.prior(arsenic, max.m = 4, arsn.start, family = "Normal", LP.type = "MaxEnt")

## ---- fig.height = 5.5, fig.width = 5.5, fig.align = 'center'------------
plot(arsn.ds, plot.type = "Ufunc")

## ------------------------------------------------------------------------
arsn.ds

## ----fig.height = 5.5, fig.width = 5.5,fig.align = 'center'--------------
plot(arsn.ds, plot.type = "DSg", main = "DS vs g: Arsenic")

## ---- warning = FALSE----------------------------------------------------
arsn.macro <- DS.macro.inf(arsn.ds, num.modes = 2, iters = 20, method = "mode")

## ------------------------------------------------------------------------
arsn.macro

## ---- fig.height = 5.5, fig.width = 5.5,fig.align = 'center'-------------
#plot(arsn.macro, main = "MacroInference: Arsenic Data")
par(mar=c(5,5.2,4,2)+0.3) #changes left margin to make large labels fit
	plot(arsn.macro$prior.fit$theta.vals, arsn.macro$prior.fit$ds.prior, 
		type = "l", xlim = c(8,18.5),
		lwd = 2, col = "red3", 
		xlab = expression(theta), ylab = "", font.main = 1,
		cex.lab=1.45, cex.axis=1.5, cex.main= 1.75, cex.sub=1.5,
		main = "MacroInference: Arsenic Data")
	title(ylab = expression(paste(hat(pi)(theta))), line = 2.3, cex.lab=1.45)
		points(arsn.macro$model.modes[2],-.02, col = "green", pch = 17, cex = 1.5)
		axis(1, at=seq(arsn.macro$model.modes[2]-arsn.macro$mode.sd[2], 
		    arsn.macro$model.modes[2]+arsn.macro$mode.sd[2],
		    length= (3-2) * 20),tick=TRUE, col="goldenrod4", labels = F, tck=-0.015)

## ------------------------------------------------------------------------
data(ChildIll)
child.start <- gMLE.pg(ChildIll)

## ------------------------------------------------------------------------
child.ds <- DS.prior(ChildIll, max.m = 8, child.start, family = "Poisson")

## ---- fig.height = 5.5, fig.width = 5.5, fig.align = 'center'------------
plot(child.ds, plot.type = "Ufunc")

## ------------------------------------------------------------------------
child.ds

## ----fig.height = 5.5, fig.width = 5.5,fig.align = 'center'--------------
plot(child.ds, plot.type = "DSg", main = "DS vs. g: Child Illness Data")

## ------------------------------------------------------------------------
child.micro.1 <- DS.micro.inf(child.ds, y.0 = 1)
child.micro.3 <- DS.micro.inf(child.ds, y.0 = 3)
child.micro.5 <- DS.micro.inf(child.ds, y.0 = 5)
child.micro.10 <- DS.micro.inf(child.ds, y.0 = 10)

## ---- fig.height = 3.25, fig.width = 3.25, fig.show = 'hold'-------------
plot(child.micro.1, xlim = c(0,10), main = "y = 1")
plot(child.micro.3, xlim = c(0,10), main = "y = 3")
plot(child.micro.5, xlim = c(0,10), main = "y = 5")
plot(child.micro.10, xlim = c(0,20), main = "y = 10")

