## ----load1, eval=TRUE----------------------------------------------------
  data("allMod_nVar3_dMax2")
  names(allMod_nVar3_dMax2)

## ----load2, eval=TRUE----------------------------------------------------
  data("TSallMod_nVar3_dMax2")

## ----visuNH86, eval=TRUE-------------------------------------------------
visuEq(nVar = 3, dMax = 2, K = allMod_nVar3_dMax2$NH86, substit = 1)

## ----plotNH86, eval=TRUE, fig.align='center'-----------------------------
  TS <- TSallMod_nVar3_dMax2$NH86$reconstr
  plot(TS[,1], TS[,2], type = 'l', ylim = c(-6.2,5.2), xlab = 't', ylab = '', 
       main = 'Nosé-Hoover', col = 'blue')
  lines(TS[,1], TS[,3], type = 'l',  col = 'red')
  lines(TS[,1], TS[,4], type = 'l',  col = 'green')
  legend(10,-3.5, c("x(t)", "y(t)", "z(t)"), col=c('blue', 'red', 'green'), lty=1, cex = 0.8)

## ----corrNH86, eval=FALSE------------------------------------------------
#    # Compute the correlation
#      cor(TS[,2:4])

## ----gpomoNH86, eval=FALSE-----------------------------------------------
#  # modelling from time series starting
#  outNH86 <- gPoMo(data = TS[,2:4], tin = TS[,1], dMax = 2, nS = c(1,1,1),
#                show = 1,
#                IstepMin = 10, IstepMax = 15000, nPmin = 3, nPmax = 5,
#                method = 'rk4')

## ----visuNH86b, eval=FALSE-----------------------------------------------
#  visuEq(nVar = 3, dMax = 2, K = outNH86$models$model6, substit = 1, approx = 2)

## ----visuNH86c, eval=TRUE, echo=FALSE------------------------------------
visuEq(nVar = 3, dMax = 2, K = data_vignetteVII$out4model6, substit = 1, approx = 2)

## ----visuGT92, eval=TRUE-------------------------------------------------
visuEq(nVar = 3, dMax = 2, K = allMod_nVar3_dMax2$GT92, substit = 1)

## ----plotGT92, eval=TRUE, fig.align='center'-----------------------------
  TS <- TSallMod_nVar3_dMax2$GT92$reconstr
  plot(TS[,1], TS[,2], type = 'l', ylim = c(-1.1, 0.8), xlab = 't', ylab = '', 
       main= 'Genesio-Tesi (1992)', col = 'blue')
  lines(TS[,1], TS[,3], type = 'l', col = 'red')
  lines(TS[,1], TS[,4], type = 'l', col = 'green')
  legend(22,-0.5, c("x(t)", "y(t)", "z(t)"), col=c('blue', 'red', 'green'), lty=1, cex = 0.8)


## ----gpomoGT92, eval=FALSE-----------------------------------------------
#  # modelling from time series starting
#  outGT92 <- gPoMo(data = TS[,2:4], tin = TS[,1], dMax = 2, nS = c(1,1,1),
#                show = 1,
#                IstepMin = 10, IstepMax = 15000, nPmin = 6, nPmax = 6,
#                method = 'rk4')

## ----visuGT92b, eval=FALSE-----------------------------------------------
#  visuEq(nVar = 3, dMax = 2, K = outGT92$models$model1, substit = 1, approx = 2)

## ----visuGT92c, eval=TRUE, echo=FALSE------------------------------------
visuEq(nVar = 3, dMax = 2, K = data_vignetteVII$out5model1, substit = 1, approx = 2)

## ----visuSprF, eval=TRUE-------------------------------------------------
visuEq(nVar = 3, dMax = 2, K = allMod_nVar3_dMax2$SprF, substit = 1)

## ----plotSprF, eval=TRUE, fig.align='center'-----------------------------
  TS <- TSallMod_nVar3_dMax2$SprF$reconstr
  plot(TS[,1], TS[,2], type = 'l', ylim = c(-3.6,4.2),
       xlab = 't', ylab = '', main = 'Sprott-F', col = 'blue')
  lines(TS[,1], TS[,3], type = 'l', col = 'red')
  lines(TS[,1], TS[,4], type = 'l', col = 'green')
  legend(0,4, c("x(t)", "y(t)", "z(t)"), col=c('blue', 'red', 'green'), lty=1, cex = 0.8)


## ----corrSprF, eval=FALSE------------------------------------------------
#    # Compute the correlation
#      cor(TS[,2:4])

## ----gpomoSprF, eval=FALSE-----------------------------------------------
#  # modelling from time series starting
#  outSprF <- gPoMo(data = TS[,2:4], tin = TS[,1], dMax = 2, nS = c(1,1,1),
#                show = 1, IstepMin = 10, IstepMax = 15000, nPmin = 6, nPmax = 6,
#                method = 'rk4')

## ----visuSprFb, eval=FALSE-----------------------------------------------
#  visuEq(nVar = 3, dMax = 2, K = outSprF$models$model5, substit = 1, approx = 2)

## ----visuSprFc, eval=TRUE, echo=FALSE------------------------------------
visuEq(nVar = 3, dMax = 2, K = data_vignetteVII$out6model5, substit = 1, approx = 2)

## ----visuSprH, eval=TRUE-------------------------------------------------
visuEq(nVar = 3, dMax = 2, K = allMod_nVar3_dMax2$SprH, substit = 1)

## ----plotSprH, eval=TRUE, fig.align='center'-----------------------------
  TS <- TSallMod_nVar3_dMax2$SprH$reconstr
  plot(TS[,1], TS[,2], type = 'l', ylim = c(-5,5),
       xlab = 't', ylab = '', main = 'Sprott-H', col = 'blue')
  lines(TS[,1], TS[,3], type = 'l',  col = 'red')
  lines(TS[,1], TS[,4], type = 'l',  col = 'green')
  legend(0, -2, c("x(t)", "y(t)", "z(t)"), col=c('blue', 'red', 'green'), lty=1, cex = 0.8)

## ----corrSprH, eval=FALSE------------------------------------------------
#    # Compute the correlation
#      cor(TS[,2:4])

## ----gpomoSprH, eval=FALSE-----------------------------------------------
#  # modelling from time series starting
#  outSprH <- gPoMo(data = TS[,2:4], tin = TS[,1], dMax = 2, nS = c(1,1,1),
#                show = 1,
#                IstepMin = 10, IstepMax = 15000, nPmin = 6, nPmax = 6,
#                method = 'rk4')

## ----visuSprHa, eval=FALSE-----------------------------------------------
#  visuEq(nVar = 3, dMax = 2, K = outSprH$models$model5, substit = 1, approx = 2)

## ----visuSprHb, eval=TRUE, echo=FALSE------------------------------------
visuEq(nVar = 3, dMax = 2, K = data_vignetteVII$out7model5, substit = 1, approx = 2)

## ----visuSprK, eval=TRUE-------------------------------------------------
visuEq(nVar = 3, dMax = 2, K = allMod_nVar3_dMax2$SprK, substit = 1)

## ----plotSprK, eval=TRUE, fig.align='center'-----------------------------
  TS <- TSallMod_nVar3_dMax2$SprK$reconstr
  plot(TS[,1], TS[,2], type = 'l', ylim = c(-3,3.6), xlab = 't', ylab= '', 
       main = 'Sprott-K', col = 'blue')
  lines(TS[,1], TS[,3], type = 'l', col = 'red')
  lines(TS[,1], TS[,4], type = 'l',  col = 'green')
  legend(0,3.5, c("x(t)", "y(t)", "z(t)"), col=c('blue', 'red', 'green'), lty=1, cex = 0.8)


## ----gpomoSprK, eval=FALSE-----------------------------------------------
#  # modelling from time series starting
#  outSprK <- gPoMo(data = TS[,2:4], tin = TS[,1], dMax = 2, nS = c(1,1,1),show = 1,
#                IstepMin = 10, IstepMax = 15000, nPmin = 6, nPmax = 6, method = 'rk4')

## ----visuSprKb, eval=FALSE-----------------------------------------------
#  visuEq(nVar = 3, dMax = 2, K = outSprK$models$model5, substit = 1, approx = 2)

## ----visuSprKc, eval=TRUE, echo=FALSE------------------------------------
visuEq(nVar = 3, dMax = 2, K = data_vignetteVII$out8model5, substit = 1, approx = 2)

## ----visuSprO, eval=TRUE-------------------------------------------------
visuEq(nVar = 3, dMax = 2, K = allMod_nVar3_dMax2$SprO, substit = 1)

## ----plotSprO, eval=TRUE, fig.align='center'-----------------------------
  TS <- TSallMod_nVar3_dMax2$SprO$reconstr
  plot(TS[,1], TS[,2], type = 'l', ylim = c(-1.5,1), main = 'Sprott-O',
       xlab = 't', ylab='', col = 'blue')
  lines(TS[,1], TS[,3], type = 'l', col = 'red')
  lines(TS[,1], TS[,4], type = 'l', col = 'green')
  legend(0,-1, c("x(t)", "y(t)", "z(t)"), col=c('blue', 'red', 'green'), lty=1, cex = 0.8)


## ----gpomoSprO, eval=FALSE-----------------------------------------------
#  # modelling from time series starting
#  outSprO <- gPoMo(data = TS[,2:4], tin = TS[,1], dMax = 2, nS = c(1,1,1),
#                show = 1,
#                IstepMin = 10, IstepMax = 15000, nPmin = 6, nPmax = 6,
#                method = 'rk4')

## ----visuSprOb, eval=FALSE-----------------------------------------------
#  visuEq(nVar = 3, dMax = 2, K = outSprO$models$model2, substit = 1, approx = 2)

## ----visuSprOc, eval=TRUE, echo=FALSE------------------------------------
visuEq(nVar = 3, dMax = 2, K = data_vignetteVII$out9model2, substit = 1, approx = 2)

## ----visuSprP, eval=TRUE-------------------------------------------------
visuEq(nVar = 3, dMax = 2, K = allMod_nVar3_dMax2$SprP, substit = 1)

## ----plotSprP, eval=TRUE, fig.align='center'-----------------------------
  TS <- TSallMod_nVar3_dMax2$SprP$reconstr
  plot(TS[,1], TS[,2], type = 'l', ylim = c(-1.2,2.2), main='Sprott-P',
       xlab = 't', ylab = '', col = 'blue')
  lines(TS[,1], TS[,3], type = 'l', col = 'red')
  lines(TS[,1], TS[,4], type = 'l', col = 'green')
  legend(8,2, c("x(t)", "y(t)", "z(t)"), col=c('blue', 'red', 'green'), lty=1, cex = 0.8)


## ----gpomoSprP, eval=FALSE-----------------------------------------------
#  # modelling from time series starting
#  outSprP<- gPoMo(data = TS[,2:4], tin = TS[,1], dMax = 2, nS = c(1,1,1), show = 1,
#                  IstepMin = 10, IstepMax = 15000, nPmin = 6, nPmax = 6, method = 'rk4')

## ----visuSprPb, eval=FALSE-----------------------------------------------
#  visuEq(nVar = 3, dMax = 2, K = outSprP$models$model5, substit = 1, approx = 2)

## ----visuSprPc, eval=TRUE, echo=FALSE------------------------------------
visuEq(nVar = 3, dMax = 2, K = data_vignetteVII$out10model5, substit = 1, approx = 2)

## ----visuSprG, eval=TRUE-------------------------------------------------
visuEq(nVar = 3, dMax = 2, K = allMod_nVar3_dMax2$SprG, substit = 1)

## ----plotSprG, eval=TRUE, fig.align='center'-----------------------------
  TS <- TSallMod_nVar3_dMax2$SprG$reconstr
  plot(TS[,1], TS[,2], type = 'l', ylim = c(-2.5,2),
       xlab = 't', ylab = '', main='Sprott-G', col = 'blue')
  lines(TS[,1], TS[,3], type = 'l', col = 'red')
  lines(TS[,1], TS[,4], type = 'l', col = 'green')
  legend(0, 2 , c("x(t)", "y(t)", "z(t)"), col=c('blue', 'red', 'green'), lty=1, cex = 0.8)


## ----gpomoSprG, eval=FALSE-----------------------------------------------
#  # modelling from time series starting
#  outSprG <- gPoMo(data = TS[,2:4], tin = TS[,1], dMax = 2, nS = c(1,1,1),
#                show = 1, IstepMin = 10, IstepMax = 15000, nPmin = 3, nPmax = 6, method = 'rk4')

## ----visuSprGb, eval=FALSE-----------------------------------------------
#  visuEq(nVar = 3, dMax = 2, K = outSprG$models$model5, substit = 1, approx = 2)

## ----visuSprGc, eval=TRUE, echo=FALSE------------------------------------
visuEq(nVar = 3, dMax = 2, K = data_vignetteVII$out11model5, substit = 1, approx = 2)

## ----visuSprM, eval=TRUE-------------------------------------------------
visuEq(nVar = 3, dMax = 2, K = allMod_nVar3_dMax2$SprM, substit = 1)

## ----plotSprM, eval=TRUE, fig.align='center'-----------------------------
  TS <- TSallMod_nVar3_dMax2$SprM$reconstr
  plot(TS[,1], TS[,2], type = 'l', ylim = c(-5.1,2.8), main='Sprott-M',
       xlab = 't', ylab = '', col = 'blue')
  lines(TS[,1], TS[,3], type = 'l', col = 'red')
  lines(TS[,1], TS[,4], type = 'l', col = 'green')
  legend(2, -3, c("x(t)", "y(t)", "z(t)"), col=c('blue', 'red', 'green'), lty=1, cex = 0.8)

## ----gpomoSprM, eval=FALSE-----------------------------------------------
#  # modelling from time series starting
#  outSprM <- gPoMo(data = TS[,2:4], tin = TS[,1], dMax = 2, nS = c(1,1,1),
#                show = 1,
#                IstepMin = 10, IstepMax = 15000, nPmin = 6, nPmax = 6,
#                method = 'rk4')

## ----visuSprMb, eval=FALSE-----------------------------------------------
#  visuEq(nVar = 3, dMax = 2, K = outSprM$models$model2, substit = 1, approx = 2)

## ----visuSprMc, eval=TRUE, echo=FALSE------------------------------------
visuEq(nVar = 3, dMax = 2, K = data_vignetteVII$out12model2, substit = 1, approx = 2)

## ----visuSprQ, eval=TRUE-------------------------------------------------
visuEq(nVar = 3, dMax = 2, K = allMod_nVar3_dMax2$SprQ, substit = 1)

## ----plotSprQ, eval=TRUE, fig.align='center'-----------------------------
  TS <- TSallMod_nVar3_dMax2$SprQ$reconstr
  plot(TS[,1], TS[,2], type = 'l', ylim = c(-7,8.8), main = 'Sprott-Q',
       xlab = 't', ylab = '', col = 'blue')
  lines(TS[,1], TS[,3], type = 'l', col = 'red')
  lines(TS[,1], TS[,4], type = 'l', col = 'green')
  legend(4, 7, c("x(t)", "y(t)", "z(t)"), col=c('blue', 'red', 'green'), lty=1, cex = 0.8)


## ----gpomoSprQ, eval=FALSE-----------------------------------------------
#  # modelling from time series starting
#  outSprQ <- gPoMo(data = TS[,2:4], tin = TS[,1], dMax = 2, nS = c(1,1,1), show = 1,
#                   IstepMin = 10, IstepMax = 15000, nPmin = 6, nPmax = 6, method = 'rk4')

## ----visuSprQb, eval=FALSE-----------------------------------------------
#  visuEq(nVar = 3, dMax = 2, K = outSprQ$models$model2, substit = 1, approx = 2)

## ----visuSprQc, eval=TRUE, echo=FALSE------------------------------------
visuEq(nVar = 3, dMax = 2, K = data_vignetteVII$out13model2, substit = 1, approx = 2)

## ----visuSprS, eval=TRUE-------------------------------------------------
visuEq(nVar = 3, dMax = 2, K = allMod_nVar3_dMax2$SprS, substit = 1)

## ----plotSprS, eval=TRUE, fig.align='center'-----------------------------
  TS <- TSallMod_nVar3_dMax2$SprS$reconstr
  plot(TS[,1], TS[,2], type = 'l', ylim = c(-4,2), main = 'Sprott-S',
       xlab = 't', ylab = '', col = 'blue')
  lines(TS[,1], TS[,3], type = 'l', col = 'red')
  lines(TS[,1], TS[,4], type = 'l', col = 'green')
  legend(0,-2.5, c("x(t)", "y(t)", "z(t)"), col=c('blue', 'red', 'green'), lty=1, cex = 0.8)


## ----gpomoSprS, eval=FALSE-----------------------------------------------
#  # modelling from time series starting
#  outSprS<- gPoMo(data = TS[,2:4], tin = TS[,1], dMax = 2, nS = c(1,1,1), show = 1,
#                  IstepMin = 10, IstepMax = 15000, nPmin = 6, nPmax = 6, method = 'rk4')

## ----visuSprSb, eval=FALSE-----------------------------------------------
#  visuEq(nVar = 3, dMax = 2, K = outSprS$models$model5, substit = 1, approx = 2)

## ----visuSprSc, eval=TRUE, echo=FALSE------------------------------------
visuEq(nVar = 3, dMax = 2, K = data_vignetteVII$out14model5, substit = 1, approx = 2)

## ----visuL63, eval=TRUE--------------------------------------------------
  visuEq(nVar = 3, dMax = 2, K = allMod_nVar3_dMax2$L63, substit = 1, approx = 4)

## ----plotL63, eval=TRUE, fig.align='center'------------------------------
  TS <- TSallMod_nVar3_dMax2$L63$reconstr
  plot(TS[,1], TS[,2], type = 'l', ylim = c(-25,45), xlab = 't', ylab = '', 
       main = 'Lorenz 1963', col = 'blue')
  lines(TS[,1], TS[,3], type = 'l', col = 'red')
  lines(TS[,1], TS[,4], type = 'l', col = 'green')
  legend(8, -5, c("x(t)", "y(t)", "z(t)"), col=c('blue', 'red', 'green'), lty=1, cex = 0.8)


## ----gpomoL63, eval=FALSE------------------------------------------------
#  # modelling from time series starting
#  outL63 <- gPoMo(data = TS[,2:4], tin = TS[,1], dMax = 2, nS = c(1,1,1), show = 1,
#                  IstepMin = 10, IstepMax = 1500, nPmin = 6, nPmax = 7, method = 'rk4')

## ----visuL63b, eval=FALSE------------------------------------------------
#  visuEq(nVar = 3, dMax = 2, K = outL63$models$model5, substit = 1, approx = 2)

## ----visuL63c, eval=TRUE, echo=FALSE-------------------------------------
#data("data_vignetteVII$out1model5")
visuEq(nVar = 3, dMax = 2, K = data_vignetteVII$out1model5, substit = 1, approx = 2)

## ----visuL63d, eval=FALSE------------------------------------------------
#  visuEq(nVar = 3, dMax = 2, K = outL63$models$model18, substit = 1, approx = 2)

## ----visuL63e, eval=TRUE, echo=FALSE-------------------------------------
visuEq(nVar = 3, dMax = 2, K = data_vignetteVII$out1model18, substit = 1, approx = 2)

## ----plotLorenzPortraits_a, eval=FALSE-----------------------------------
#    plot(TS[,2], TS[,3], type = 'l', xlab = 'x(t)', ylab = 'y(t)', main = 'model #5')
#    lines(outL63$stockoutreg$model5[,1], outL63$stockoutreg$model5[,2],
#          type = 'l', col = 'red')

## ----plotLorenzPortraits_a2, eval=TRUE, echo=FALSE-----------------------
  library(float)
  plot(TS[,2], TS[,3], type = 'l', xlab = 'x(t)', ylab = 'y(t)', main = 'model #5')
  lines(dbl(data_vignetteVII$outL63_stockoutreg_model5[,1]), 
        dbl(data_vignetteVII$outL63_stockoutreg_model5[,2]), type = 'l', col = 'red')

## ----plotLorenzPortraits_b, eval=FALSE-----------------------------------
#    plot(TS[,2], TS[,3], type = 'l', xlab = 'x(t)', ylab = 'y(t)', main = 'model #15')
#    lines(outL63$stockoutreg$model15[,1], outL63$stockoutreg$model15[,2],
#          type = 'l', col = 'red')

## ----plotLorenzPortraits_b2, eval=TRUE, echo=FALSE-----------------------
  plot(TS[,2], TS[,3], type = 'l', xlab = 'x(t)', ylab = 'y(t)', main = 'model #15')
  lines(dbl(data_vignetteVII$outL63_stockoutreg_model15[,1]), 
        dbl(data_vignetteVII$outL63_stockoutreg_model15[,2]), type = 'l', col = 'red')

## ----plotLorenzPortraits_c, eval=FALSE-----------------------------------
#    plot(TS[,2], TS[,3], type = 'l', xlab = 'x(t)', ylab = 'y(t)', main = 'model #18')
#    lines(dbl(outL63$stockoutreg$model18[,1]), dbl(outL63$stockoutreg$model18[,2]),
#          type = 'l', col = 'red')

## ----plotLorenzPortraits_c2, eval=TRUE, echo=FALSE-----------------------
  plot(TS[,2], TS[,3], type = 'l', xlab = 'x(t)', ylab = 'y(t)', main = 'model #18')
  lines(dbl(data_vignetteVII$outL63_stockoutreg_model18[,1]), 
        dbl(data_vignetteVII$outL63_stockoutreg_model18[,2]), type = 'l', col = 'red')

## ----plotLorenzPortraits_d, eval=FALSE-----------------------------------
#    plot(TS[,2], TS[,3], type = 'l', xlab = 'x(t)', ylab = 'y(t)', main = 'model #19')
#    lines(dbl(outL63$stockoutreg$model19[,1]), dbl(outL63$stockoutreg$model19[,2]),
#          type = 'l', col = 'red')

## ----plotLorenzPortraits_d2, eval=TRUE, echo=FALSE-----------------------
  plot(TS[,2], TS[,3], type = 'l', xlab = 'x(t)', ylab = 'y(t)', main = 'model #19')
  lines(dbl(data_vignetteVII$outL63_stockoutreg_model19[,1]), 
        dbl(data_vignetteVII$outL63_stockoutreg_model19[,2]), type = 'l', col = 'red')

## ----visuBQ81, eval=TRUE-------------------------------------------------
visuEq(nVar = 3, dMax = 2, K = allMod_nVar3_dMax2$BS81, substit = 1, approx = 4)

## ----plotBQ81, eval=TRUE, fig.align='center'-----------------------------
  TS <- TSallMod_nVar3_dMax2$BS81$reconstr
  plot(TS[,1], TS[,2], type = 'l', ylim = c(-2,2.2), main = 'Burke-Shaw 1981',
       xlab = 't', ylab = '', col = 'blue')
  lines(TS[,1], TS[,3], type = 'l', col = 'red')
  lines(TS[,1], TS[,4], type = 'l', col = 'green')
  legend(9, 2.2, c("x(t)", "y(t)", "z(t)"), col=c('blue', 'red', 'green'), lty=1, cex = 0.8)
  

## ----gpomoBQ81, eval=FALSE-----------------------------------------------
#  # modelling from time series starting
#  outBS81 <- gPoMo(data = TS[,2:4], tin = TS[,1], dMax = 2, nS = c(1,1,1), show = 1,
#                   IstepMin = 10, IstepMax = 1500, nPmin = 5, nPmax = 6, method = 'rk4')

## ----visuBQ81b, eval=FALSE-----------------------------------------------
#  visuEq(nVar = 3, dMax = 2, K = outBS81$models$model3, substit = 1, approx = 2)

## ----visuBQ81c, eval=TRUE, echo=FALSE------------------------------------
visuEq(nVar = 3, dMax = 2, K = data_vignetteVII$out2model3, substit = 1, approx = 2)

## ----visuBQ81d, eval=FALSE-----------------------------------------------
#  visuEq(nVar = 3, dMax = 2, K = outBS81$models$model11, substit = 1, approx = 2)

## ----visuBQ81e, eval=TRUE, echo=FALSE------------------------------------
visuEq(nVar = 3, dMax = 2, K = data_vignetteVII$out2model11, substit = 1, approx = 2)

## ----plotBS81Portraits_a, eval=FALSE-------------------------------------
#    plot(TS[,2], TS[,3], type = 'l', xlab = 'x(t)', ylab = 'y(t)', main = 'model #3')
#    lines(outBS81$stockoutreg$model3[,1], outBS81$stockoutreg$model3[,2],
#          type = 'l', col = 'red')

## ----plotBS81Portraits_a2, echo=FALSE, eval=TRUE-------------------------
  plot(TS[,2], TS[,3], type = 'l', xlab = 'x(t)', ylab = 'y(t)', main = 'model #3')
  lines(dbl(data_vignetteVII$outBS81_stockoutreg_model3[,1]), 
        dbl(data_vignetteVII$outBS81_stockoutreg_model3[,2]), type = 'l', col = 'red')

## ----plotBS81Portraits_b, eval=FALSE-------------------------------------
#    plot(TS[,2], TS[,3], type = 'l', xlab = 'x(t)', ylab = 'y(t)', main = 'model #9')
#    lines(outBS81$stockoutreg$model9[,1], outBS81$stockoutreg$model9[,2],
#          type = 'l', col = 'red')

## ----plotBS81Portraits_b2, echo=FALSE, eval=TRUE-------------------------
  plot(TS[,2], TS[,3], type = 'l', xlab = 'x(t)', ylab = 'y(t)', main = 'model #9')
  lines(dbl(data_vignetteVII$outBS81_stockoutreg_model9[,1]), 
        dbl(data_vignetteVII$outBS81_stockoutreg_model9[,2]), type = 'l', col = 'red')

## ----plotBS81Portraits_c, eval=FALSE-------------------------------------
#    plot(TS[,2], TS[,3], type = 'l', xlab = 'x(t)', ylab = 'y(t)', main = 'model #11')
#    lines(outBS81$stockoutreg$model11[,1], outBS81$stockoutreg$model11[,2],
#          type = 'l', col = 'red')

## ----plotBS81Portraits_c2, echo=FALSE, eval=TRUE-------------------------
  plot(TS[,2], TS[,3], type = 'l', xlab = 'x(t)', ylab = 'y(t)', main = 'model #11')
  lines(dbl(data_vignetteVII$outBS81_stockoutreg_model11[,1]), 
        dbl(data_vignetteVII$outBS81_stockoutreg_model11[,2]), type = 'l', col = 'red')

## ----plotBS81Portraits_d, eval=FALSE-------------------------------------
#    plot(TS[,2], TS[,3], type = 'l', xlab = 'x(t)', ylab = 'y(t)', main = 'model #12')
#    lines(outBS81$stockoutreg$model12[,1], outBS81$stockoutreg$model12[,2],
#          type = 'l', col = 'red')

## ----plotBS81Portraits_d2, echo=FALSE, eval=TRUE-------------------------
  plot(TS[,2], TS[,3], type = 'l', xlab = 'x(t)', ylab = 'y(t)', main = 'model #12')
  lines(dbl(data_vignetteVII$outBS81_stockoutreg_model12[,1]), 
        dbl(data_vignetteVII$outBS81_stockoutreg_model12[,2]), type = 'l', col = 'red')

## ----visuL84, eval=TRUE--------------------------------------------------
visuEq(nVar = 3, dMax = 2, K = allMod_nVar3_dMax2$L84, substit = 1)

## ----plotL84, eval=TRUE, fig.align='center'------------------------------
  TS <- TSallMod_nVar3_dMax2$L84$reconstr
  plot(TS[,1], TS[,2], type = 'l', ylim = c(-2,2.2), main = 'Lorenz 1984',
       xlab = 't', ylab = '', col = 'blue')
  lines(TS[,1], TS[,3], type = 'l', col = 'red')
  lines(TS[,1], TS[,4], type = 'l', col = 'green')
  legend(16, -1, c("x(t)", "y(t)", "z(t)"), col=c('blue', 'red', 'green'), lty=1, cex = 0.8)


## ----gpomoL84, eval=FALSE------------------------------------------------
#  # modelling from time series starting
#  outL84 <- gPoMo(data = TS[,2:4], tin = TS[,1], dMax = 2, nS = c(1,1,1), show = 1,
#                IstepMin = 10, IstepMax = 15000, nPmin = 5, nPmax = 11, method = 'rk4')

## ----visuL84b, eval=FALSE------------------------------------------------
#  visuEq(nVar = 3, dMax = 2, K = outL84$models$model3, substit = 1, approx = 2)

## ----visuL84c, eval=TRUE, echo=FALSE-------------------------------------
visuEq(nVar = 3, dMax = 2, K = data_vignetteVII$out3model3, substit = 1, approx = 2)

## ----visuL84d, eval=FALSE------------------------------------------------
#  visuEq(nVar = 3, dMax = 2, K = outL84$models$model9, substit = 1, approx = 2)

## ----visuL84e, eval=TRUE, echo=FALSE-------------------------------------
visuEq(nVar = 3, dMax = 2, K = data_vignetteVII$out3model9, substit = 1, approx = 2)

## ----visuL84f, eval=FALSE------------------------------------------------
#  visuEq(nVar = 3, dMax = 2, K = outL84$models$model141, substit = 1, approx = 2)

## ----visuL84g, eval=TRUE, echo=FALSE-------------------------------------
visuEq(nVar = 3, dMax = 2, K = data_vignetteVII$out3model141, substit = 1, approx = 2)

## ----visuCS2004, eval=TRUE-----------------------------------------------
visuEq(nVar = 3, dMax = 2, K = allMod_nVar3_dMax2$CS2004, substit = 1)

## ----plotCS2004, eval=TRUE, fig.align='center'---------------------------
  TS <- TSallMod_nVar3_dMax2$CS2004$reconstr
  plot(TS[,1], TS[,2], type = 'l', xlab = 't', ylab ='', 
       main='Chlouverakis-Sprott', col = 'blue')
  lines(TS[,1], TS[,3], type = 'l', xlab = 't', ylab = 'y(t)', col = 'red')
  lines(TS[,1], TS[,4], type = 'l', xlab = 't', ylab = 'z(t)', col = 'green')
  legend(40, -1.5, c("x(t)", "y(t)", "z(t)"), col=c('blue', 'red', 'green'), lty=1, cex = 0.8)


## ----gpomoCS2004, eval=FALSE---------------------------------------------
#  # modelling from time series starting
#  outCS2004 <- gPoMo(data = TS[,2:4], tin = TS[,1], dMax = 2, nS = c(1,1,1), show = 1,
#                IstepMin = 10, IstepMax = 15000, nPmin = 3, nPmax = 8, method = 'rk4')

## ----visuCS2004b, eval=FALSE---------------------------------------------
#  visuEq(nVar = 3, dMax = 2, K = outCS2004$models$model26, substit = 1, approx = 2)

## ----visuCS2004c, eval=TRUE, echo=FALSE----------------------------------
visuEq(nVar = 3, dMax = 2, K = data_vignetteVII$out15model26, substit = 1, approx = 2)

## ----visuLi2007, eval=TRUE-----------------------------------------------
visuEq(nVar = 3, dMax = 2, K = allMod_nVar3_dMax2$Li2007, substit = 1, approx = 2)

## ----plotLi2007, eval=TRUE, fig.align='center'---------------------------
  TS <- TSallMod_nVar3_dMax2$Li2007$reconstr
  plot(TS[,1], TS[,2], type = 'l', ylim = c(-160, 230), xlab = 't', 
       ylab = '', main= ' Li 2007', col = 'blue')
  lines(TS[,1], TS[,3], type = 'l', xlab = 't', ylab = 'y(t)', col = 'red')
  lines(TS[,1], TS[,4], type = 'l', xlab = 't', ylab = 'z(t)', col = 'green')
  legend(0.3, -50, c("x(t)", "y(t)", "z(t)"), col=c('blue', 'red', 'green'), lty=1, cex = 0.8)


## ----gpomoLi2007, eval=FALSE---------------------------------------------
#  # modelling from time series starting
#  outLi2007<- gPoMo(data = TS[,2:4], tin = TS[,1], dMax = 2, nS = c(1,1,1), show = 1,
#                    IstepMin = 10, IstepMax = 15000, nPmin = 9, nPmax = 9, method = 'rk4')

## ----visuLi2007b, eval=FALSE---------------------------------------------
#  visuEq(nVar = 3, dMax = 2, K = outLi2007$models$model13, substit = 1, approx = 2)

## ----visuLi2007c, eval=TRUE, echo=FALSE----------------------------------
visuEq(nVar = 3, dMax = 2, K = data_vignetteVII$out16model13, substit = 1, approx = 2)

## ----visuCord, eval=TRUE-------------------------------------------------
visuEq(nVar = 3, dMax = 2, K = allMod_nVar3_dMax2$Cord2012, substit = 1)

## ----plotCord, eval=TRUE, fig.align='center'-----------------------------
  TS <- TSallMod_nVar3_dMax2$Cord2012$reconstr
  plot(TS[,1], TS[,2], type = 'l', ylim = c(-20,30),
       xlab = 't', ylab = '', main = 'Cord 2012', col = 'blue')
  lines(TS[,1], TS[,3], type = 'l', xlab = 't', ylab = 'y(t)', col = 'red')
  lines(TS[,1], TS[,4], type = 'l', xlab = 't', ylab = 'z(t)', col = 'green')
  legend(17, -8, c("x(t)", "y(t)", "z(t)"), col=c('blue', 'red', 'green'), lty=1, cex = 0.8)


## ----gpomoCord, eval=FALSE-----------------------------------------------
#  # modelling from time series starting
#  outCord2012 <- gPoMo(data = TS[,2:4], tin = TS[,1], dMax = 2, nS = c(1,1,1), show = 1,
#                       IstepMin = 10, IstepMax = 15000, nPmin = 7, nPmax = 11, method = 'rk4')

## ----visuCordb, eval=FALSE-----------------------------------------------
#  visuEq(nVar = 3, dMax = 2, K = outCord2012$models$model9, substit = 1, approx = 2)

## ----visuCordc, eval=TRUE, echo=FALSE------------------------------------
visuEq(nVar = 3, dMax = 2, K = data_vignetteVII$out17model9, substit = 1, approx = 2)

## ----visuCordd, eval=FALSE-----------------------------------------------
#  visuEq(nVar = 3, dMax = 2, K = outCord2012$models$model10, substit = 1, approx = 2)

## ----visuCorde, eval=FALSE, echo=FALSE-----------------------------------
#  visuEq(nVar = 3, dMax = 2, K = data_vignetteVII$out17model10, substit = 1, approx = 2)

## ----visuPhPortrait62, eval=FALSE----------------------------------------
#  visuOutGP(out17,selecmod = 62, prioMinMax = 'model')

## ----visuCordf, eval=FALSE-----------------------------------------------
#  visuEq(nVar = 3, dMax = 2, K = outCord2012$models$model62, substit = 1, approx = 2)

## ----visuCordg, eval=FALSE, echo=FALSE-----------------------------------
#  visuEq(nVar = 3, dMax = 2, K = data_vignetteVII$out17model62, substit = 1, approx = 2)

