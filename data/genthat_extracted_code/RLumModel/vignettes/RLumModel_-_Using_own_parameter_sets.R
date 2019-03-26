## ---- echo=FALSE, message = FALSE----------------------------------------
library(RLumModel)

## ----global_options, include=FALSE---------------------------------------
knitr::opts_chunk$set(fig.pos = 'H', fig.align = 'center')

## ------------------------------------------------------------------------
own_parameters <- list(
  N = c(2e15, 2e15, 2.4e16, 1e17),
  E = c(0, 0, 0, 0),
  s = c(0, 0, 0, 0),
  A = c(2e-8, 2e-9, 4e-9, 1e-8),
  B = c(0, 0, 5e-11, 4e-8),
  K = 0,
  model = "customized",
  R = 1.7e15)

## ------------------------------------------------------------------------
own_state_parameters <- c(0, 0, 0, 9.4e15)

## ----set sequence Pagonis 2009-------------------------------------------
sequence <- list(RF = c(20, 0.1, 0.1))

## ---- fig.cap = "RF signal for 0.1 Gy/s"---------------------------------
RF_Pagonis2009 <- model_LuminescenceSignals(
  model = "customized", 
  sequence = sequence, 
  own_parameters = own_parameters, 
  own_state_parameters = own_state_parameters,
  verbose = FALSE)

## ---- fig.cap = "Concentration of m1 during RF"--------------------------
concentration_m1 <- Luminescence::get_RLum(
  RF_Pagonis2009,
  recordType = c("conc. level 4"))
  
Luminescence::plot_RLum(
  concentration_m1, 
  ylim = c(9.2e15, 9.6e15))

## ----Different Dose-rates Pagonis 2009, fig.cap = "RF signals for different dose rates"----
dose.rate <- seq(from = 0.1, to = 0.5, by = 0.1)

model.output <- lapply(dose.rate, function(x) {
    
    sequence <- list(RF = c(20, x, x))
    
    RF_data <- model_LuminescenceSignals(
      model = "customized", 
      sequence = sequence, 
      own_parameters = own_parameters, 
      own_state_parameters = own_state_parameters,
      verbose = FALSE,
      plot = FALSE
    )
    
    ## "RF$" for exact matching RF and not (RF)
    return(get_RLum(RF_data, recordType = "RF$", drop = FALSE))
    
  })

model.output.merged <- merge_RLum(model.output)

plot_RLum(
 object = model.output.merged,
 xlab = "Stimulation time [s]",
 ylab = "RF signal [a.u.]",
 legend.text = paste(dose.rate, "Gy/s"),
 legend.pos = "outside",
 combine = TRUE)

## ----Initial signal------------------------------------------------------
dose.rate <- seq(from = 0.1, to = 0.5, by = 0.1)

model.output <- vapply(X = dose.rate, FUN = function(x) {
    
    sequence <- list(RF = c(20, x, x))
    
    temp <- model_LuminescenceSignals(
      model = "customized", 
      sequence = sequence, 
      own_parameters = own_parameters, 
      own_state_parameters = own_state_parameters,
      verbose = FALSE,
      plot = FALSE
    )
    
    ## "RF$" for exact matching RF and not (RF)
    RF_curve <- get_RLum(temp, recordType = "RF$")
    
    return(max(get_RLum(RF_curve)[2,2]))
    
  }, FUN.VALUE = 1)

## ---- echo=FALSE, fig.cap = "Initial RF signal for different dose rates with parameters of Lawless 2009"----
plot(
  dose.rate,
  model.output,
  type = "b",
  xlab = "Stimulation Time [s]",
  ylab = "Initial RF intensitiy [a.u.]"
  )

## ----Lawless 2009 set parameters-----------------------------------------
own_parameters <- list(
  N = c(1e14, 1e15),
  E = c(0, 0),
  s = c(0, 0),
  A = c(1e-13, 1e-14),
  B = c(0, 1e-7),
  K = 0,
  model = "customized",
  R = 1e8)

sequence <- list(RF = c(20, 100, 1))

RF_Lawless_2009 <- model_LuminescenceSignals(
  model = "customized", 
  sequence = sequence, 
  own_parameters = own_parameters,
  verbose = FALSE,
  plot = FALSE)

concentration_n <- Luminescence::get_RLum(
  RF_Lawless_2009, 
    recordType = c("conc. level 1"))

## ---- echo=FALSE, fig.cap = "Concentration of Level 1 with numerical and analytical solutions"----
Luminescence::plot_RLum(
  concentration_n,
  ylim = c(0, 15e8), lwd = 3)

t <- seq(0, 100, 2)
numerical_eq16 <- 1e-13*1e14/1e-7 *((1 + 2*1e-7*1e8*t/(1e-13*1e14))^(0.5)-1)

numerical_eq18 <- (2*1e-13*1e14*1e8*t/(1e-7))^(0.5)

lines(t, numerical_eq16, pch = 3, col = "red", type = "b")
lines(t, numerical_eq18, pch = 4, col = "green", type = "b")

legend("bottomright", legend = c("Simulated", "Eq. 16","Eq. 18"), col = c("black", "red", "green"), lwd = 1)

## ----Chen 2013 set parameters--------------------------------------------
own_parameters <- list(
  N = c(1e9, 0),
  E = c(0.4, 0),
  s = c(1e11, 0),
  A = c(1e-9,0),
  B = c(0, 1e-10),
  K = 0,
  model = "customized")

own_state_parameters <- c(1e8, 1e8)

own_start_temperature <- -220

sequence <- list(TL = c(-220, 130, 1))

## ----solve Chen 2013, fig.cap = "TL with parameter sets of Chen 2013"----
TL_Chen2013 <- model_LuminescenceSignals(
  model = "customized", 
  sequence = sequence, 
  own_parameters = own_parameters, 
  own_state_parameters = own_state_parameters,
  own_start_temperature = own_start_temperature,
  verbose = FALSE)

## ---- echo=FALSE, fig.cap = "Concentrations of different energy levels"----
concentration <- Luminescence::get_RLum(
  TL_Chen2013, 
  recordType = c("conc. level 1", "conc. level 2", "conc. n_c"),
  drop = FALSE)

concentration@records[[1]]@recordType <- "TL"
concentration@records[[2]]@recordType <- "TL"
concentration@records[[3]]@recordType <- "TL"

Luminescence::plot_RLum(
  concentration,
  combine = TRUE,
  ylab = "concentrations",
  main = "",
  legend.text = c("n", "m","nc")
  )

