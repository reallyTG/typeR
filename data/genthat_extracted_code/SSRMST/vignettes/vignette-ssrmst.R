## ------------------------------------------------------------------------
ac_rate   = 30

ac_period = 70

tot_time  = 908

## ------------------------------------------------------------------------
shape0 = 1.05

shape1 = 1.05

scale0 = 8573

scale1 = 8573

## ------------------------------------------------------------------------
tau  = 900

## ------------------------------------------------------------------------
margin  = 18

## ------------------------------------------------------------------------
library(SSRMST)
ssrmst(ac_rate=ac_rate, ac_period=ac_period, tot_time=tot_time, tau=tau, shape0=shape0, scale0=scale0, shape1=shape1, scale1=scale1, margin=margin, seed=2017)

## ------------------------------------------------------------------------
ssrmst(ac_rate=ac_rate, ac_period=ac_period, tot_time=tot_time, tau=tau, shape0=shape0, scale0=scale0, shape1=shape1, scale1=scale1, seed=2017)

