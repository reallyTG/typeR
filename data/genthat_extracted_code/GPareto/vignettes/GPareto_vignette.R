## ----setup, echo=FALSE, include=FALSE-------------------------------------
library("knitr", quietly = TRUE)
# set global chunk options
opts_chunk$set(prompt=TRUE)
options(prompt = "R> ", continue = "+  ", width = 76, useFancyQuotes = FALSE)
opts_chunk$set(highlight=FALSE)
opts_chunk$set(background='#FFFFFF')
# opts_chunk$set(cache=TRUE, autodep=TRUE)
opts_chunk$set(comment=NA)
opts_chunk$set(warning=FALSE)
opts_chunk$set(message=FALSE)
knit_hooks$set(document = function(x) {sub('\\usepackage[]{color}', '\\usepackage[dvipsnames]{xcolor}', x, fixed = TRUE)})

knit_hooks$set(rgl = function(before, options, envir) {
  if (!before) {
    ## after a chunk has been evaluated
    if (rgl.cur() == 0) return()  # no active device
    name = paste(options$fig.path, options$label, sep = '')
    rgl.snapshot(paste(name, '.png', sep = ''), fmt = 'png')
     # rgl.postscript(paste(name, '.pdf', sep = ''), fmt = 'pdf')
  }
})

## ----EpsInd,echo=FALSE, fig.width = 5, fig.height = 5---------------------
## Figure 1) Left
library("GPareto", quietly = TRUE)

# Pareto front creation
ParetoRef <- matrix(c(0.2, 0.22, 0.35, 0.5, 0.65, 0.8, 0.7, 0.6, 0.55, 0.4, 0.25, 0.2), 6, 2)

# Plot epsilon indicator
plot(ParetoRef, xlim = c(0, 1), ylim = c(0, 1), pch = 21, cex = 2, col = "black", bg = "red", bty = "l",
     xlab = expression(f[1]), ylab = expression(f[2]))
plotParetoEmp(ParetoRef, col = "red", lwd = 2, lty = 2)

points(x = 0.45, y = 0.32,  col = "black", bg = "blue", pch = 22, cex = 2)
lines(c(0.45, 0.45, 0.65), c(0.55, 0.32, 0.32), lty = 5, lwd = 1, col = "blue")

points(x = 0.1, y = 0.9,  col = "black", bg = "green", pch = 22, cex = 2)
lines(c(0.1, 0.1, 0.2), c(1, 0.9, 0.9), lty = 5, lwd = 1, col = "green")

arrows(0.1, 0.95, 0.2, 0.95, code = 3, length = 0.1, col = "green")

arrows(0.55, 0.32, 0.55, 0.4, code = 3, length = 0.1, col = "blue")

## ----HyperInd,echo=FALSE, fig.width = 5, fig.height = 5-------------------

## Figure 1) right
# Plot hypervolume indicator
plot(ParetoRef, xlim = c(0, 1), ylim = c(0, 1), pch = 21, cex = 2, col = "black", bg = "red", bty = "l",
     xlab = expression(f[1]), ylab = expression(f[2]))
plotParetoEmp(ParetoRef, col = "red", lwd = 2, lty = 2)

polygon(x = c(0.45, 0.45, 0.65, 0.65, 0.5, 0.5),
        y = c(0.55, 0.32, 0.32, 0.4, 0.4, 0.55), col = rgb(0, 0, 1, 0.5), border = NA)

polygon(x = c(0.1, 0.1, 0.2, 0.2), y = c(1, 0.9, 0.9, 1), col = rgb(0, 1, 0, 0.5), border =
          NA)

polygon(x = c(0.2, 0.2, 0.22, 0.22, 0.35, 0.35, 0.5, 0.5, 0.65, 0.65, 0.8, 0.8, 1, 1 ),
        y = c(1, 0.7, 0.7, 0.6, 0.6, 0.55, 0.55, 0.40, 0.4, 0.25, 0.25, 0.2, 0.2, 1),
        density = 15, col = "red", border = NA)

points(x = 0.45, y = 0.32,  col = "black", bg = "blue", pch = 22, cex = 2)
lines(c(0.45, 0.45, 0.65), c(0.55, 0.32, 0.32), lty = 5, lwd = 1, col = "blue")


points(x = 0.1, y = 0.9,  col = "black", bg = "green", pch = 22, cex = 2)
lines(c(0.1, 0.1, 0.2), c(1, 0.9, 0.9), lty = 5, lwd = 1, col = "green")

points(x = 1, y = 1, pch = 13, cex = 2)

## ----Simus, echo=FALSE, results='hide', fig.width=8, fig.height=3, warning=FALSE, message=FALSE----
library("DiceKriging", quietly = TRUE)

set.seed(42)
# First objective
forrester<-function(x){
  return(((x * 6 - 2)^2) * sin((x * 6 - 2) * 2))
}
# Second objective
f2 <- function(x){
  10 * x * sin(10 * x) + 10 * x * cos(20 * x)
}

# design of experiments
design.grid <- c(0, 0.15, 0.25, 0.3, 0.48, 0.95, 1)
# initial observations
response1 <- forrester(design.grid)
response2 <- f2(design.grid)

# create GP models with DiceKriging 'km'
model1 <- km(~1, design = data.frame(x = design.grid), response = response1, covtype = "matern5_2")

model2 <- km(~1, design = data.frame(x = design.grid), response = response2, covtype = "matern5_2",
             coef.cov = 0.387, coef.var = 260)
# prediction locations
x <- seq(0, 1, length.out = 1000)

# generate conditional simulations from the GPs
n_sim <- 3 # three different simulations

simus1 <- simulate(model1, nsim = n_sim, newdata = data.frame(x = x), cond = TRUE, nugget.sim = 1e-6)
simus2 <- simulate(model2, nsim = n_sim, newdata = data.frame(x = x), cond = TRUE, nugget.sim = 1e-6)

par(mfrow = c(1, 3))
# plot observations and simulations of the first objective
plot(x, simus1[1,], col = "red", type = "l", xlab = "x", ylab = expression(f[1]))
points(x[!is_dominated(rbind(simus1[1,], simus2[1,]))], simus1[1,!is_dominated(rbind(simus1[1,], simus2[1,]))], 
pch = 20, col = "red")
lines(x, simus1[2,], col = "blue")
points(x[!is_dominated(rbind(simus1[2,], simus2[2,]))], simus1[2,!is_dominated(rbind(simus1[2,], simus2[2,]))],
pch = 20, col = "blue")
lines(x, simus1[3,], col = "green")
points(x[!is_dominated(rbind(simus1[3,], simus2[3,]))], simus1[3,!is_dominated(rbind(simus1[3,], simus2[3,]))],
pch = 20, col = "green")
points(design.grid, response1, pch = 17)

# plot observations and simulations of the second objective
plot(x, simus2[1,], col = "red", type = "l", xlab = "x", ylab = expression(f[2]), ylim = c(-15, 20))
points(x[!is_dominated(rbind(simus1[1,], simus2[1,]))], simus2[1,!is_dominated(rbind(simus1[1,], simus2[1,]))], 
pch = 20, col = "red")
lines(x, simus2[2,], col = "blue")
points(x[!is_dominated(rbind(simus1[2,], simus2[2,]))], simus2[2,!is_dominated(rbind(simus1[2,], simus2[2,]))],
pch = 20, col = "blue")
lines(x, simus2[3,], col = "green")
points(x[!is_dominated(rbind(simus1[3,], simus2[3,]))], simus2[3,!is_dominated(rbind(simus1[3,], simus2[3,]))],
pch = 20, col = "green")
points(design.grid, response2, pch = 17)

# plot observations and simulations of both objective
plot(simus1[1,], simus2[1,], col = "red", type = "l", xlab = expression(f[1]), ylab = expression(f[2]), ylim = c(-15, 20))
points(simus1[1,!is_dominated(rbind(simus1[1,], simus2[1,]))], simus2[1,!is_dominated(rbind(simus1[1,], simus2[1,]))], 
pch = 20, col = "red")
lines(simus1[2,], simus2[2,], col = "blue")
points(simus1[2,!is_dominated(rbind(simus1[2,], simus2[2,]))], simus2[2,!is_dominated(rbind(simus1[2,], simus2[2,]))],
pch = 20, col = "blue")
lines(simus1[3,], simus2[3,], col = "green")
points(simus1[3, !is_dominated(rbind(simus1[3,], simus2[3,]))], simus2[3,!is_dominated(rbind(simus1[3,], simus2[3,]))],
pch = 20, col = "green")
points(response1, response2, pch = 17)

par(mfrow = c(1, 1))
rm(list = ls())

## ----echo=FALSE, message=FALSE, warning=FALSE-----------------------------
library("DiceDesign", quietly = TRUE)
set.seed(42)

#-----------------------------------------------------
#1D example 
#-----------------------------------------------------
n <- 100
X <- matrix(seq(0, 1, length.out = n), ncol = 1)
F <- MOP2(X)
I <- !is_dominated(t(F))
Fstar <- F[I,]
Xstar <- X[I]

## ----example1_init,results='hide', warning=FALSE--------------------------
design.init <- matrix(seq(0, 1, length.out = 6), ncol = 1)
response.init <- MOP2(design.init)
mf1 <- km(~1, design = design.init, response = response.init[, 1])
mf2 <- km(~1, design = design.init, response = response.init[, 2])
model <- list(mf1, mf2)

## ----echo=FALSE, warning=FALSE, results='hide'----------------------------
# Prediction
ParetoFront.init <- t(nondominated_points(t(response.init)))
p1 <- predict(object = mf1, newdata = X, checkNames = FALSE, type = "UK")
p2 <- predict(object = mf2, newdata = X, checkNames = FALSE, type = "UK")

# Criterion computation
refPoint <- c(max(F[, 1]), max(F[, 2])) # used reference point
crit <- apply(X, 1, crit_EHI, model, critcontrol = list(refPoint = refPoint))

## ----warning=FALSE--------------------------------------------------------
res <- GParetoptim(model = model, fn = MOP2, crit = "EHI", nsteps = 7,
  lower = 0, upper = 1, critcontrol = list(refPoint = c(2, 2)))

## ----echo=FALSE-----------------------------------------------------------
# extract models from res
mf1.res <- res$lastmodel[[1]]
mf2.res <- res$lastmodel[[2]]
# predict on the grid
p1.res <- predict(mf1.res, newdata = X, checkNames = FALSE, type = "UK")
p2.res <- predict(mf2.res, newdata = X, checkNames = FALSE, type = "UK")
# current Pareto front from non-dominated solutions
ParetoFront.res <- t(nondominated_points(t(cbind(mf1.res@y, mf2.res@y))))

## ----fig.width=8, fig.height=6, echo=FALSE,warning=FALSE------------------
## Figure 3
par(mfrow=c(3,3))
# Top left
plot(X, F[,1], type = "l", main = "Objective 1", xlab = "x", ylab = expression(f[1]))
points(Xstar, Fstar[,1], col = "red")
points(mf1@X, mf1@y, col = "blue", pch = 19, cex = 1.2)

# top center
plot(X, F[,2], col = "black", type = "l", main = "Objective 2", xlab = "x", ylab = expression(f[2]))
points(Xstar, Fstar[,2], col = "red")
points(mf2@X, mf2@y, col = "blue", pch = 19, cex = 1.2)

# top right
plot(F[,1], F[,2], main = "Initial and real Pareto front", xlab = expression(f[1]), ylab = expression(f[2]))
plotParetoEmp(Fstar, col = "red")
points(mf1@y, mf2@y, col = "blue", pch = 19, cex = 1.2)
plotParetoEmp(ParetoFront.init, col = "blue")

# middle left
plot(X, p1$mean, type = "l", xlab = "x", ylab = expression(y[1]), lwd = 3, 
     ylim = range(c(p1$mean + 2 * p1$sd, p1$mean - 2 * p1$sd)), main = "Initial GP model 1")
polygon(x = c(X, rev(X)), y = c(p1$mean + 2 * p1$sd, rev(p1$mean - 2 * p1$sd)), border = NA, col = "lightgrey")
lines(X, p1$mean, lwd = 2)
points(mf1@X, mf1@y, col = "blue", pch = 19, cex = 1.2)

# middle center
plot(X, p2$mean, type = "l", xlab = "x",  ylab = expression(y[2]), lwd = 3,
     ylim = range(c(p2$mean + 2 * p2$sd, p2$mean - 2 * p2$sd)), main = "Initial GP model 2")
polygon(x = c(X,rev(X)), y = c(p2$mean + 2 * p2$sd, rev(p2$mean - 2 * p2$sd)), border = NA, col = "lightgrey")
lines(X, p2$mean, lwd = 2)
points(mf2@X, mf2@y, col = "blue", pch = 19, cex = 1.2)

# middle right
plot(X, crit, type = "l", main = "EHI criterion", ylim = c(0, 0.07))
abline(v=X[which.max(crit)], col = "darkgreen")

# bottom left
plot(X, p1.res$mean, type = "l", xlab = "x", ylab = expression(y[1]), lwd = 3,  
     ylim = range(c(p1.res$mean + 2 * p1.res$sd, p1.res$mean - 2 * p1.res$sd)), main = "Final GP model 1")
polygon(x = c(X, rev(X)), y = c(p1.res$mean + 2 * p1.res$sd, rev(p1.res$mean - 2*p1.res$sd)), border = NA, col = "lightgrey")
lines(X, p1.res$mean, lwd = 2)
points(mf1.res@X, mf1.res@y, col = "blue", pch = 19, cex = 1.2)

# bottom center
plot(X, p2.res$mean, type = "l", xlab = "x", ylab = expression(y[2]), lwd = 3,  
     ylim = range(c(p2.res$mean + 2 * p2.res$sd, p2.res$mean - 2 * p2.res$sd)), main="Final GP model 2")
polygon(x = c(X,rev(X)), y = c(p2.res$mean + 2 * p2.res$sd, rev(p2.res$mean - 2 * p2.res$sd)), border = NA, col = "lightgrey")
lines(X, p2.res$mean, lwd = 2)
points(mf2.res@X, mf2.res@y, col = "blue", pch = 19, cex = 1.2)

# bottom right
plot(F[,1], F[,2], main = "Final Pareto front", xlab = expression(f[1]), ylab = expression(f[2]))
plotParetoEmp(Fstar, col = "red")
points(mf1.res@y, mf2.res@y, col = "blue", pch = 19, cex = 1.2)
plotParetoEmp(ParetoFront.res, col = "blue")
par(mfrow = c(1, 1))
rm(list = ls())

#-----------------------------------------------------
# 2D example - Figure 4, 5 and 6
#-----------------------------------------------------


## ----P1,fig.show='hide',fig.width=10, fig.height=5------------------------
plotParetoGrid(P1)

## ----echo=TRUE,message=FALSE,warning=FALSE, results='hide'----------------
set.seed(1)
d <- 2; ninit <- 7; fun <- P1
design <- lhsDesign(ninit, d, seed = 42)$design
response <- t(apply(design, 1, fun))
mf1 <- km(~., design = design, response = response[, 1])
mf2 <- km(~., design = design, response = response[, 2])
model <- list(mf1, mf2)

## ----echo=TRUE,message=FALSE,warning=FALSE,results='hide'-----------------
x.grid <- seq(0, 1, length.out = 21)
test.grid <- expand.grid(x.grid, x.grid)
SURcontrol <- list(integration.points = test.grid)
omEGO1 <- crit_optimizer(crit = "SUR", model = model,  lower = c(0, 0),
  upper = c(1, 1), critcontrol = list(SURcontrol = SURcontrol),
  optimcontrol = list(method = "genoud", pop.size = 20, 
  int.seed = 2, unif.seed = 3)
  )

## ----echo=TRUE,message=FALSE,warning=FALSE, results='hide'----------------
fun1 <- function(x) P1(x)[, 1]; fun2 <- function(x) P1(x)[, 2]
fastmf2 <- fastfun(fn = fun2, design = design, response = response[, 2])
model2 <- list(mf1, fastmf2)

## ----echo=FALSE,message=FALSE,warning=FALSE, results='hide'---------------
omEGO2 <- crit_optimizer(crit="SUR", model=model2,  lower=c(0,0), upper=c(1,1),
                         optimcontrol=list(method="pso", maxit=50),
                         critcontrol=list(SURcontrol=SURcontrol))

## ----echo=FALSE,message=FALSE,warning=FALSE, results='hide'---------------
suppressPackageStartupMessages(library("KrigInv", quietly = T))
# grid on which the SUR criterion is computed
n.grid <- 21
x.grid <- seq(0, 1, length.out = n.grid)

# Prepare data structure to pass to crit_SUR directly
integration.param <- integration_design_optim(SURcontrol = SURcontrol, lower = c(0, 0), upper = c(1, 1), model = model)
integration.points <- as.matrix(integration.param$integration.points)
integration.weights <- integration.param$integration.weights

precalc.data <- list()
mn.X <- sn.X <- matrix(0, nrow = 2, ncol = nrow(integration.points))

for (i in 1:2){
  p.tst.all <- predict(model[[i]], newdata = integration.points, type = "UK", checkNames = FALSE)
  mn.X[i,] <- p.tst.all$mean
  sn.X[i,]   <- p.tst.all$sd
  if (max(sn.X[i,]) != 0) precalc.data[[i]] <- precomputeUpdateData(model[[i]], integration.points)
}

# put all arguments in the critcontrol list
critcontrol <- list(integration.points = integration.points,
                    integration.weights = integration.weights,
                    mn.X = mn.X, sn.X = sn.X, precalc.data = precalc.data)

# For the case with fastfun, only the second part must be recomputed
p.tst.all <- predict(model2[[2]], newdata = integration.points, type = "UK", checkNames = FALSE)
mn.X[2,] <- p.tst.all$mean
sn.X[2,]   <- p.tst.all$sd
precalc.data <- list(precalc.data[[1]])
critcontrol2 <- list(integration.points = integration.points,
                    integration.weights = integration.weights,
                    mn.X = mn.X, sn.X = sn.X, precalc.data = precalc.data)

# Compute SUR criterion
SUR_grid <- apply(test.grid, 1, crit_SUR, model=model, critcontrol=critcontrol)
SUR_grid2 <- apply(test.grid, 1, crit_SUR, model=model2, critcontrol=critcontrol2)

## ----echo=FALSE,message=FALSE,warning=FALSE, fig.height=6, fig.width=6----
filled.contour(x.grid, x.grid, 
               matrix(SUR_grid, n.grid), main="SUR Criterion",
               xlab=expression(x[1]), ylab=expression(x[2]), color=terrain.colors,
               plot.axes={axis(1); axis(2);
                 points(design[, 1], design[, 2], pch=21, bg="white", cex=2);
                 points(omEGO1$par, col="red", pch=4, cex=2)})


## ----echo=FALSE,message=FALSE,warning=FALSE, fig.height=6, fig.width=6----
filled.contour(x.grid, x.grid,
               matrix((SUR_grid2), n.grid), main="SUR Criterion (fastfun)",
               xlab=expression(x[1]), ylab=expression(x[2]), color=terrain.colors,
               plot.axes={axis(1); axis(2);
                 points(design[, 1], design[, 2], pch=21, bg="white", cex=2);
                 points(omEGO2$par, col="red", pch=4, cex=2)
               }
)

## ----UQ_opt1, message = FALSE, warning=FALSE, results='hide', fig.show='hide'----
sol <- GParetoptim(model = model, fn = fun, crit = "SUR", nsteps = 7,
  lower = c(0, 0), upper = c(1, 1), optimcontrol = list(method = "pso"),
  critcontrol = list(SURcontrol = list(distrib = "SUR", n.points = 50)))

## ----UQ_opt2, message=FALSE, warning=FALSE, results='hide', fig.show='hide'----
solFast <- GParetoptim(model = list(mf1), fn = fun1, cheapfn = fun2, 
  crit = "SUR", nsteps = 7, lower = c(0, 0), upper = c(1, 1),
  optimcontrol = list(method = "pso"),
  critcontrol = list(SURcontrol = list(distrib = "SUR", n.points = 50)))

## ----UQ_1, warning=FALSE, fig.show='hide',fig.width=6, fig.height=5-------
lim1 <- seq(-50, 240, length.out = 101)
lim2 <- seq(-35, 0, length.out = 101)
plotGPareto(sol, UQ_PF = TRUE, UQ_PS = TRUE, UQ_dens = TRUE,
  control = list(f1lim = lim1, f2lim = lim2))

## ----UQ_2, warning=FALSE, fig.show='hide',fig.width=6, fig.height=5-------
plotGPareto(solFast, UQ_PF = TRUE, UQ_PS = TRUE, UQ_dens = TRUE,
  control = list(f1lim = lim1, f2lim = lim2))

## ----warning=FALSE, message=FALSE-----------------------------------------
newPoint <- getDesign(model = sol$lastmodel, target = c(42, -26),
  lower = c(0, 0), upper = c(1, 1), optimcontrol = list(method = "pso"))
newPoint

## ----echo=TRUE,message=FALSE,warnings=FALSE, results='hide'---------------
res <- easyGParetoptim(fn = DTLZ2, budget = 50, lower = rep(0, 4),
  upper = rep(1, 4))

## ----ex3DPS, fig.show='hide',fig.width=c(5,6), fig.height=c(5,6), rgl = TRUE----
library("rgl", quietly = TRUE)
r3dDefaults$windowRect <- c(0,50, 800, 800) # for better looking figure
plotGPareto(res, UQ_PS = TRUE, control = list(lower = rep(0, 4),
  upper = rep(1, 4), nintegpoints = 100, option = "mean",
  resolution = 25))

