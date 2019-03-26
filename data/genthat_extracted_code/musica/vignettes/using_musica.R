## ------------------------------------------------------------------------
library(data.table)
library(ggplot2)
library(lubridate)

## ---- include=FALSE------------------------------------------------------
load('data.RData')

## ---- message=FALSE, eval=-3---------------------------------------------
library(musica)
data(basin_PT)
str(basin_PT)

## ----intro, cache=FALSE, eval=FALSE--------------------------------------
#  dec = decomp(basin_PT$obs_ctrl, period = c('Y5', 'Y1', 'M6', 'M3', 'M1', 'D20'))

## ----decomp, cache=FALSE, fig.width=6.3, fig.height=4, fig.cap='Basin average precipitation and temperature at 5 year, 1 year, 6 months and 3 months time scale.'----
ggplot(dec[period %in% c('Y5', 'Y1', 'M6', 'M3')]) + 
    geom_line(aes(x = period_pos, y = value, col = period)) + 
    facet_wrap(~variable, scale= 'free', ncol = 1) + theme_bw()

## ----add, cache=FALSE, eval=FALSE----------------------------------------
#  dobs = decomp(basin_PT$obs_ctrl, period = c('Y5', 'Y1', 'M6', 'M3', 'M1', 'D15', 'D1'))
#  dctrl = decomp(basin_PT$sim_ctrl, period = c('Y5', 'Y1', 'M6', 'M3', 'M1', 'D15', 'D1'))
#  dscen = decomp(basin_PT$sim_scen, period = c('Y5', 'Y1', 'M6', 'M3', 'M1', 'D15', 'D1'))

## ----compare, cache=FALSE------------------------------------------------
bi_bc = compare(x = list(`BIAS IN MEAN` = dctrl), compare_to = dobs, fun = mean, wet_int_only = TRUE)

## ----biasPlot, cache=FALSE, fig.width=6.3, fig.height=4, fig.cap='Bias in mean basin average precipitation and temperature at various time scales. For sub-seasonal time scales the changes are averaged over seasons.'----
ggplot(bi_bc[period!='G1']) + 
  geom_line(aes(x = TS, y = DIF, col = factor(sub_period), group = sub_period)) + 
  facet_grid(variable~comp, scale = 'free')+
  scale_x_log10()+theme_bw()

## ----compare2, cache=FALSE-----------------------------------------------
bi_dc = compare(x = list(`CHANGE IN Q90` = dscen), compare_to = dctrl, fun = Q(.9))

## ----biasPlot2, cache=FALSE, fig.width=6.3, fig.height=4, fig.cap='Changes in 90th quantile of basin average precipitation and temperature at various time scales. For sub-seasonal time scales the changes are averaged over seasons. \\label{fig-introchan}'----
ggplot(bi_dc[period!='G1']) + 
  geom_line(aes(x = TS, y = DIF, col = sscale2sea(sub_period), group = sub_period)) +
  facet_grid(variable~comp, scale = 'free')+
  scale_x_log10(breaks = tscale(c('Y5', 'Y1', 'M1')), lab = c('Y5', 'Y1', 'M1')) + theme_bw() 

## ----vcompare, cache=FALSE-----------------------------------------------
co = vcompare(x = list(OBS = dobs, CTRL = dctrl, SCEN = dscen), fun = cor)

## ----vcomparePlot, cache=FALSE, fig.width=6.3, fig.height=4, fig.cap='Correlation between precipitation and temperature in observed data (green) and control (red) and scenario (blue) simulation'----
co = co[, SEA:=sscale2sea(sub_period)]
ggplot(co[period!='G1']) + 
  geom_line(aes(x = TS, y = value, col = ID))+
  facet_grid(VARS~SEA, scales = 'free') +
  scale_x_log10(breaks = tscale(c('Y5', 'Y1', 'M1')), lab = c('Y5', 'Y1', 'M1')) + 
  theme_bw()

## ---- cache=FALSE--------------------------------------------------------
dta4bc = list(FROM = basin_PT$sim_ctrl, TO = basin_PT$obs_ctrl, NEWDATA = basin_PT$sim_scen)

## ---- cache=FALSE--------------------------------------------------------
dta4dc = list(FROM = basin_PT$sim_ctrl, TO = basin_PT$sim_scen, NEWDATA = basin_PT$obs_ctrl)

## ---- cache=FALSE--------------------------------------------------------
dta4bc0 = list(FROM = basin_PT$sim_ctrl, TO = basin_PT$obs_ctrl, NEWDATA = basin_PT$sim_ctrl)

## ---- cache=FALSE--------------------------------------------------------
dta4dc0 = list(FROM = basin_PT$sim_ctrl, TO = basin_PT$sim_scen, NEWDATA = basin_PT$sim_ctrl)

## ---- cache=FALSE, eval=FALSE--------------------------------------------
#  out1 = msTrans_abs(copy(dta4bc0),  maxiter = 10, period = 'D1')

## ---- cache=FALSE, eval=FALSE--------------------------------------------
#  out2 = msTrans_abs(copy(dta4bc0),  maxiter = 10, period = c('G1', 'Y1', 'M1', 'D1'))

## ---- cache=FALSE, eval=FALSE--------------------------------------------
#  pers = c('Y1', 'M3' , 'M1', 'D1')
#  abb = quarter
#  dobs_0 = decomp(basin_PT$obs_ctrl, period = pers,  agg_by = abb)
#  dctrl_0 = decomp(basin_PT$sim_ctrl, period = pers, agg_by = abb)
#  dQMD1 = decomp(out1, period = pers, agg_by = abb)
#  dQMMS = decomp(out2, period = pers, agg_by = abb)
#  

## ---- cache=FALSE, fig.width=6.3, fig.height=4, fig.cap='Comparison of bias in maximum precipitation and temperature in simulated data and after standard and multiscale bias correction.'----
bi_0 = compare(x = list(`ORIGINAL` = dctrl_0, `STANDARD` = dQMD1, `MULTISCALE` = dQMMS), compare_to = dobs_0, fun = max)

ggplot(bi_0[period!='G1']) + 
  geom_line(aes(x = TS, y = DIF, col = sscale2sea(sub_period), group = sub_period)) +
  facet_grid(variable~comp, scale = 'free') +
  scale_x_log10(breaks = tscale(c('Y5', 'Y1', 'M1')), lab = c('Y5', 'Y1', 'M1')) + theme_bw() 

## ---- eval = FALSE-------------------------------------------------------
#  input data:
#    data.frames F, T, N
#  
#  parameters:
#    scales      # considered temporal scales
#    tol         # tolerance
#    maxiter     # maximum number of iterations
#    g           # form of the summary function
#  
#  T* = N
#  
#  while (error > tol & iter < maxiter){
#  
#    for (s in scales){
#  
#      d = dist[g(T), g(F)]
#      d* = dist[g(T*), g(N)]
#      T* = update[T*, dist(d, d*)]
#  
#    }
#  
#    error = sum_accros_scales(
#      dist{
#        dist[g_s(T*), g_s(N)], dist[g_s(T), g_s(F)]
#      })
#  
#    iter = iter + 1
#  
#  }
#  

## ---- cache=FALSE, eval=FALSE--------------------------------------------
#  out3 = msTrans_dif(dta4dc0,  maxiter = 10, period = 'D1', model = 'identity')

## ---- cache=FALSE, eval=FALSE--------------------------------------------
#  out4 = msTrans_dif(dta4dc0,  maxiter = 10, period = c('G1', 'Y1', 'M1', 'D1'), model = 'identity')

## ---- cache=FALSE, eval=FALSE--------------------------------------------
#  pers = c('Y1', 'M3' , 'M1', 'D1')
#  abb = quarter
#  dctrl_0 = decomp(basin_PT$sim_ctrl, period = pers, agg_by = abb)
#  dscen_0 = decomp(basin_PT$sim_scen, period = pers, agg_by = abb)
#  
#  dDCD1 = decomp(out3, period = pers, agg_by = abb)
#  dDCMS = decomp(out4, period = pers, agg_by = abb)
#  

## ---- cache=FALSE, fig.width=6.3, fig.height=4, fig.cap='Comparison of changes in maximum precipitation and temperature in simulated data and after standard and multiscale delta change transformation.'----
bi_1 = compare(x = list(`SIMULATED` = dscen_0, `STANDARD` = dDCD1, `MULTISCALE` = dDCMS), compare_to = dctrl_0, fun = max)

ggplot(bi_1[period!='G1']) + 
  geom_line(aes(x = TS, y = DIF, col = sscale2sea(sub_period), group = sub_period)) +
  facet_grid(variable~comp, scale = 'free') +
  scale_x_log10(breaks = tscale(c('Y5', 'Y1', 'M1')), lab = c('Y5', 'Y1', 'M1')) + theme_bw() 

