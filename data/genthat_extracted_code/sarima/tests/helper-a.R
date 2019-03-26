## Modified example from KFAS with 
set.seed(1)
arma2p2KFAS <- list(ar = c(0.8897, -0.4858), ma = c(-0.2279, 0.2488))
yKFAS <- arima.sim(n = 1000, arma2p2KFAS, 
                   innov = rnorm(1000) * sqrt(0.5))
y2KFAS <- yKFAS + 5
