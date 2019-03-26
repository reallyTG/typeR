## ----global_options, include=FALSE---------------------------------------
knitr::opts_chunk$set(fig.pos = 'H', fig.align = 'center')

## ---- message = FALSE----------------------------------------------------
library(RLumModel)

## ------------------------------------------------------------------------
own_state_parameters <- c(0, 0, 1e11)

## ---- fig.cap = "The effect of thermal quenching for TL signals"---------
W <- c(0, 1.05)

TL_Akselrod_1998 <- lapply(W, function(W){
  
  own_parameters <- list(
    N = c(1e18, 1e17, 1e18),
    E = c(1.25, 0, 0),
    s = c(1e13, 0, 0),
    A = c(1e-16, 1e-16, 2e-17),
    B = c(0, 0, 1e-16),
    K = ifelse(W == 0, 0, 1e12),
    W = W,
    model = "customized",
    R = 1e13)
  
  sequence <- list(
    IRR = c(20, 0.225, 0.01),
    TL = c(20, 300, 1))
  
  model_output <- model_LuminescenceSignals(
    model = "customized", 
    sequence = sequence, 
    own_parameters = own_parameters, 
    own_state_parameters = own_state_parameters,
    verbose = FALSE,
    plot = FALSE)
  
  return(get_RLum(model_output, recordType = "TL$", drop = FALSE))
})

merge_results <- merge_RLum.Analysis(TL_Akselrod_1998)

plot_RLum.Analysis(
  merge_results,
  legend.text = c("Unquenched", "Quenched"),
  combine = T)

## ----Pagonis_2007 Chip101------------------------------------------------
own_parameters <- list(
  N = c(2e15, 2e15, 2.4e16, 1e17),
  E = c(1.3,0, 0, 0),
  s = c(1e13, 0, 0, 0),
  A = c(2e-8, 2e-9, 4e-9, 1e-8),
  B = c(0, 0, 5e-11, 4e-8),
  K = 1e11,
  W = 1.1,
  model = "customized",
  R = 1.7e15)

own_state_parameters <- c(0, 0, 0, 9.4e15)

## ---- fig.cap= "TL signal for different given doses"---------------------
dose <- 10^seq(-1, 3.5, 0.5)

Pagonis_2007 <- lapply(dose, function(dose){
  
  sequence <- list(
    IRR = c(20, dose, 1),
    PAUSE = c(20, 60),
    TL = c(20, 250, 1))
  
  model_output <- model_LuminescenceSignals(
    model = "customized", 
    sequence = sequence, 
    own_parameters = own_parameters,
    own_state_parameters = own_state_parameters,
    verbose = FALSE,
    plot = FALSE)

  return(Luminescence::get_RLum(model_output, recordType = "TL", drop = FALSE))
})

merge_results <- Luminescence::merge_RLum.Analysis(Pagonis_2007)

Luminescence::plot_RLum.Analysis(
  merge_results,
  subset =  list(recordType = "TL$"),
  xlim = c(100, 250),
  legend.text = paste0(round(dose, digits = 2), " Gy"),
  combine = T)


## ----calculate TL max----------------------------------------------------
TL_max <- vapply(1:length(Pagonis_2007), function(x){
  
  TL <- get_RLum(get_RLum(Pagonis_2007[[x]], recordType = "TL$"))
  
  return(max(TL[,2]))
  
}, FUN.VALUE = 1)

## ----calculate concentration of m1---------------------------------------

m1_max <- vapply(1:length(Pagonis_2007), function(x){
  
  m1 <- get_RLum(get_RLum(Pagonis_2007[[x]], recordType = "conc. level 4"))
  
  return(m1[1,2])

}, FUN.VALUE = 1)

## ----plot TL max, echo = FALSE, fig.cap = "TL max vs. dose"--------------
plot(dose, TL_max, log = "xy",
     xlab = "Dose [Gy]", ylab = "TL max [a.u.]",
     ylim = c(1e11, 1e14), pch = 16)
grid()

## ----plot concentration m1, echo = FALSE, fig.cap = "Concentration of m1 (L-centre) vs. dose"----
plot(x = dose, y = m1_max, log = "x",
     xlab = "Dose [Gy]", ylab = "Conc. m1 [a.u.]",
     ylim = c(1e14, 1.2e16), pch = 16)
grid()

## ------------------------------------------------------------------------
dose <- seq(1,400, 1)

Fig_5 <- lapply(dose, function(dose){
  
  sequence <- list(
    RF = c(20, dose, 1))
  
  model_output <- model_LuminescenceSignals(
    model = "customized", 
    sequence = sequence, 
    own_parameters = own_parameters,
    own_state_parameters = own_state_parameters,
    verbose = FALSE,
    plot = FALSE)

})

## ------------------------------------------------------------------------
n1 <- vapply(1:length(Fig_5), function(x){
  
  temp <- get_RLum(get_RLum(Fig_5[[x]], recordType = "conc. level 1"))
  
  return(temp[nrow(temp),2])
  
}, FUN.VALUE = 1)

n2 <- vapply(1:length(Fig_5), function(x){
  
  temp <- get_RLum(get_RLum(Fig_5[[x]], recordType = "conc. level 2"))
  
  return(temp[nrow(temp),2])
  
}, FUN.VALUE = 1)

m1 <- vapply(1:length(Fig_5), function(x){
  
  temp <- get_RLum(get_RLum(Fig_5[[x]], recordType = "conc. level 4"))
  
  return(temp[nrow(temp),2])
  
}, FUN.VALUE = 1)

m2 <- vapply(1:length(Fig_5), function(x){
  
  temp <- get_RLum(get_RLum(Fig_5[[x]], recordType = "conc. level 3"))
  
  return(temp[nrow(temp),2])
  
}, FUN.VALUE = 1)

## ---- fig.cap = "Concentration in different traps at the end of the irradiation"----
plot(dose, m2, type = "l", ylim = c(0, 1.5e16), xlim = c(0, 500), xlab= "Dose [Gy]", ylab = "Concentration [a.u.]")
lines(dose, n2, col = "red")
lines(dose, m1, col = "green")
lines(dose, n1, col = "blue")

legend("topright", legend = c("n1", "n2", "m1", "m2"), col = c("blue", "red", "green", "black"), lwd = 1, bty = "n")
grid()

