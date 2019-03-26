## ---- eval=T, echo=TRUE--------------------------------------------------
require(weco);
set.seed(10000);
n.sim     <- 50000;
sdx       <- 2;
simu.data <- rnorm(n.sim, sd = sdx);
quants    <- c(0.25, 0.5, 0.75);
xmax      <- 3000;
ymax      <- 0.015;

## ---- eval=T, echo=TRUE, fig.width=6, fig.height=5-----------------------
l          <- 3;
rst.1      <- weco.rule(rule=1, x=simu.data, l=l, sdx=sdx, mux=0);
simu.arl   <- weco.rl(rst.1);
hist(simu.arl, breaks = 100, freq = F,
     xlim=c(0, xmax), ylim=c(0,ymax),
     xlab="Running Length", ylab="Probability", main="Rule 1");

## ---- eval=T, echo=TRUE, fig.width=6, fig.height=5-----------------------
k          <- 9;
rst.2      <- weco.rule(rule=2, x=simu.data, k=k, sdx=sdx, mux=0);
simu.arl   <- weco.rl(rst.2);
hist(simu.arl, breaks = 100, freq = F,
     xlim=c(0, xmax), ylim=c(0,ymax),
     xlab="Running Length", ylab="Probability", main="Rule 2");

## ---- eval=T, echo=TRUE, fig.width=6, fig.height=5-----------------------
k          <- 6;
rst.3      <- weco.rule(rule=3, x=simu.data, k=k, sdx=sdx, mux=0);
simu.arl   <- weco.rl(rst.3);
hist(simu.arl, breaks = 100, freq = F,
     xlim=c(0, xmax), ylim=c(0,ymax),
     xlab="Running Length", ylab="Probability", main="Rule 3");

## ---- eval=T, echo=TRUE, fig.width=6, fig.height=5-----------------------
k          <- 14;
rst.4      <- weco.rule(rule=4, x=simu.data, k=k, sdx=sdx, mux=0);
simu.arl   <- weco.rl(rst.4);
hist(simu.arl, breaks = 100, freq = F,
     xlim=c(0, xmax), ylim=c(0,ymax),
     xlab="Running Length", ylab="Probability", main="Rule 3");

## ---- eval=T, echo=TRUE, fig.width=6, fig.height=5-----------------------
k          <- 2;
rst.5      <- weco.rule(rule=5, x=simu.data, k=k, l=2, sdx=sdx, mux=0);
simu.arl   <- weco.rl(rst.5);
hist(simu.arl, breaks = 100, freq = F,
     xlim=c(0, xmax), ylim=c(0,ymax),
     xlab="Running Length", ylab="Probability", main="Rule 5");

## ---- eval=T, echo=TRUE, fig.width=6, fig.height=5-----------------------
k          <- 4;
rst.6      <- weco.rule(rule=6, x=simu.data, k=k, l=1, sdx=sdx, mux=0);
simu.arl   <- weco.rl(rst.6);
hist(simu.arl, breaks = 100, freq = F, 
     xlim=c(0, xmax), ylim=c(0,ymax),
     xlab="Running Length", ylab="Probability", main="Rule 6");

## ---- eval=T, echo=TRUE, fig.width=6, fig.height=5-----------------------
k          <- 15;
rst.7      <- weco.rule(rule=7, x=simu.data, k=k, l=1, sdx=sdx, mux=0);
simu.arl   <- weco.rl(rst.7);
hist(simu.arl, breaks = 100, freq = F, 
     xlim=c(0, xmax), ylim=c(0,ymax),
     xlab="Running Length", ylab="Probability", main="Rule 7");

## ---- eval=T, echo=TRUE, fig.width=6, fig.height=5-----------------------
k          <- 8;
rst.8      <- weco.rule(rule=8, x=simu.data, k=k, l=1, sdx=sdx, mux=0);
simu.arl   <- weco.rl(rst.8);
hist(simu.arl, breaks = 100, freq = F, 
     xlim=c(0, xmax), ylim=c(0,ymax),
     xlab="Running Length", ylab="Probability", main="Rule 8");

## ---- eval=T, echo=TRUE, fig.width=6, fig.height=5-----------------------
##rules 1 and 2
lst.rules  <- list(list(1, l=3),
                   list(2, k=9));
rst.m      <- weco.combine(simu.data, lst.rules=lst.rules);
simu.arl   <- weco.rl(rst.m);
hist(simu.arl, breaks = 100, freq = F, 
     xlim=c(0, xmax), ylim=c(0,ymax),
     xlab="Running Length", ylab="Probability", main="Multiple Rules");

## ---- eval=T, echo=TRUE, fig.width=6, fig.height=5-----------------------
plot(rst.m, start=1000, end=1500);

## ---- eval=F, echo=TRUE, fig.width=6, fig.height=5-----------------------
#  run.weco();

