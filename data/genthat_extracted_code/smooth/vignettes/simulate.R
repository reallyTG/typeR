## ----global_options, include=FALSE---------------------------------------
knitr::opts_chunk$set(fig.width=6, fig.height=4, fig.path='Figs/', fig.show='hold',
                      warning=FALSE, message=FALSE)

## ----load_libraries, message=FALSE, warning=FALSE------------------------
require(smooth)

## ----sim_es_ANN----------------------------------------------------------
ourSimulation <- sim.es("ANN", frequency=12, obs=120)

## ----sim_es_ANN_plot_data------------------------------------------------
plot(ourSimulation$data)

## ----sim_es_ANN_plot-----------------------------------------------------
plot(ourSimulation)

## ----sim_es_MAdM---------------------------------------------------------
ourSimulation <- sim.es("MAdM", frequency=12, obs=120, phi=0.95, persistence=c(0.1,0.05,0.01))
plot(ourSimulation)

## ----sim_es_MAdM_lnorm---------------------------------------------------
ourSimulation <- sim.es("MAdM", frequency=12, obs=120, phi=0.95, persistence=c(0.1,0.05,0.01), randomizer="rlnorm", meanlog=0, sdlog=0.015)
plot(ourSimulation)

## ----sim_es_iMNN---------------------------------------------------------
ourSimulation <- sim.es("MNN", frequency=12, obs=120, iprob=0.2, initial=10, persistence=0.1)
plot(ourSimulation)

## ----sim_es_iMNN_50------------------------------------------------------
ourSimulation <- sim.es("MNN", frequency=12, obs=120, iprob=0.2, initial=10, persistence=0.1, nsim=50)

## ----simulate_smooth_es--------------------------------------------------
x <- ts(rnorm(100,120,15),frequency=12)
ourModel <- es(x, h=18, silent=TRUE)
ourData <- simulate(ourModel, nsim=50, obs=100)

## ----simulate_smooth_es_compare------------------------------------------
par(mfcol=c(1,2))
plot(x)
plot(ourData$data[,1])
par(mfcol=c(1,1))

## ----sim_ssarima_(0,1,1)-------------------------------------------------
ourSimulation <- sim.ssarima(frequency=12, obs=120, nsim=10)

## ----sim_ssarima_(0,1,1)_plot--------------------------------------------
plot(ourSimulation$data[,5])

## ----sim_ssarima_(0,1,1)(1,0,2)_12_drift---------------------------------
ourSimulation <- sim.ssarima(orders=list(ar=c(0,1),i=c(1,0),ma=c(1,2)), lags=c(1,12), constant=TRUE, obs=120)
plot(ourSimulation)

## ----sim_ssarima_(0,1,1)(1,0,2)_12_drift_predefined----------------------
ourSimulation <- sim.ssarima(orders=list(ar=c(0,1),i=c(1,0),ma=c(1,2)), lags=c(1,12), constant=TRUE, MA=c(0.5,0.2,0.3), obs=120)
ourSimulation

## ----sim_ssarima_(1,0,2)_1(0,1,1)_7(1,0,1)_30----------------------------
ourSimulation <- sim.ssarima(orders=list(ar=c(1,0,1),i=c(0,1,0),ma=c(2,1,1)), lags=c(1,7,30), obs=360)
ourSimulation
plot(ourSimulation)

## ----sim_ssarima_(1,0,2)_1(0,1,1)_7intermittent--------------------------
ourSimulation <- sim.ssarima(orders=list(ar=c(1,0),i=c(0,1),ma=c(2,1)), lags=c(1,7), obs=120, iprob=0.2)
ourSimulation
plot(ourSimulation)

## ----simulate_smooth_ssarima---------------------------------------------
x <- ts(100 + c(1:100) + rnorm(100,0,15),frequency=12)
ourModel <- auto.ssarima(x, h=18, silent=TRUE)
ourData <- simulate(ourModel, nsim=50, obs=100)

## ----simulate_ssarima_orders---------------------------------------------
ourData <- sim.ssarima(orders=orders(ourModel), lags=lags(ourModel), nsim=50, obs=100)

## ----simulate_smooth_ssarima_compare-------------------------------------
par(mfcol=c(1,2))
plot(x)
plot(ourData)
par(mfcol=c(1,1))

## ----sim_ces_(n)---------------------------------------------------------
ourSimulation <- sim.ces(frequency=12, obs=120, nsim=1)

## ----sim_ces_(n)_plot----------------------------------------------------
plot(ourSimulation)

## ----sim_ces_(n)_summary-------------------------------------------------
ourSimulation

## ----sim_ces_(s)---------------------------------------------------------
ourSimulation <- sim.ces("s",frequency=24, obs=240, nsim=1)
plot(ourSimulation)

## ----sim_ces_(s)_messing_arround-----------------------------------------
ourSimulation$initial[c(1:5,20:24),] <- 0
ourSimulation <- sim.ces("s",frequency=24, obs=120, nsim=1, initial=ourSimulation$initial, randomizer="rt", df=4)
plot(ourSimulation)

## ----sim_ces_(p)---------------------------------------------------------
ourSimulation <- sim.ces("p",B=0.2,frequency=12, obs=240, nsim=10)
plot(ourSimulation)

## ----sim_ces_(f)---------------------------------------------------------
ourSimulation <- sim.ces("f",frequency=12, obs=240, nsim=10)
plot(ourSimulation)

## ----simulate_smooth_ces-------------------------------------------------
x <- ts(rnorm(120,0,5) + rep(runif(12,-50,50),10)*rep(c(1:10),each=12) ,frequency=12)
ourModel <- ces(x, seasonality="s", h=18, silent=TRUE)
ourData <- simulate(ourModel, nsim=50, obs=100)

## ----simulate_smooth_ces_compare-----------------------------------------
par(mfcol=c(1,2))
plot(x)
plot(ourData)
par(mfcol=c(1,1))

## ----simulate_smooth_gum-------------------------------------------------
x <- ts(100 + rnorm(120,0,5) + rep(runif(12,-50,50),10)*rep(c(1:10),each=12) ,frequency=12)
ourModel <- auto.gum(x, h=18, silent=TRUE)
ourData <- simulate(ourModel, nsim=50)

## ----simulate_smooth_gum_compare-----------------------------------------
par(mfcol=c(1,2))
plot(x)
plot(ourData)
par(mfcol=c(1,1))

## ----sim_sma_(10)--------------------------------------------------------
ourSimulation <- sim.sma(10,frequency=12, obs=240, nsim=1)
plot(ourSimulation)

## ----simulate_smooth_sma-------------------------------------------------
x <- ts(rnorm(100,100,5), frequency=12)
ourModel <- sma(x)
ourData <- simulate(ourModel, nsim=50, obs=1000)
plot(ourData)

## ----simulate_smooth_ves-------------------------------------------------
x <- sim.ves("ANN",frequency=4,obs=40,nSeries=3,randomizer="rnorm",mean=0,sd=100)

## ----simulate_smooth_ves_estimated---------------------------------------
ourModel <- ves(x$data,model="AAN",persistence="dependent")
Y <- simulate(ourModel)
plot(Y)

