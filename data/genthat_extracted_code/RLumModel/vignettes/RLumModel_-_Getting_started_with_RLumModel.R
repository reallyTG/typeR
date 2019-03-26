## ----global_options, include=FALSE---------------------------------------
knitr::opts_chunk$set(fig.pos = 'H', fig.align = 'center')

## ---- echo=FALSE, message = FALSE----------------------------------------
library(RLumModel)
library(knitr)
library(kableExtra)

## ---- eval = FALSE-------------------------------------------------------
#  data("ExampleData.ModelOutput", package = "RLumModel")
#  
#  ##show class
#  class(model.output)
#  
#  ##show structure
#  Luminescence::structure_RLum(model.output)
#  
#  ##seperate TL-curve from TL-concentrations
#  TL_curve <- Luminescence::get_RLum(model.output, recordType = "TL$")
#  TL_conc <- Luminescence::get_RLum(model.output, recordType = "(TL)", drop = FALSE)
#  
#  ##also possible: TL_curve <- get_RLum(model.output, record.id = 1)
#  
#  ##plot results
#  Luminescence::plot_RLum(TL_curve)
#  Luminescence::plot_RLum(TL_conc)
#  

## ---- eval = FALSE, fig.align = "center"---------------------------------
#  ##plot every energy-level by an extra plot
#  Luminescence::plot_RLum(TL_conc, plot.single = TRUE)

## ---- eval = FALSE-------------------------------------------------------
#  ##see structure of model.output
#  Luminescence::structure_RLum(model.output)

## ------------------------------------------------------------------------
model <- "Bailey2001"

## ------------------------------------------------------------------------
sequence <- system.file(
  "extdata",
  "example_SAR_cycle.SEQ",
  package = "RLumModel")

## ------------------------------------------------------------------------
lab.dose_rate <-  0.105

## ---- echo = FALSE-------------------------------------------------------
keywords <- data.frame(
  ARGUMENTS = c("TL","OSL","ILL","LM_OSL", "RF", "RF_heating", "IRR", "CH", "PH", "PAUSE"),
DESCRIPTION = c("Thermally stimulated luminescence", "Optically stimulated luminescence", "Illumination", "Linear modulated OSL", "Radiofluorescence", "RF during heating/cooling","Irradiation", "Cutheat", "Preheat", "Pause"),
SUB_ARGUMENTS = c("’temp_begin’ [°C], ’temp_end’ [°C], ’heating_rate’ [°C/s]",
"’temp’ [°C], ’duration’ [s], ’optical_power’ [%]",
"’temp’ [°C], ’duration’ [s], ’optical_power’ [%]",
"’temp’ [°C], ’duration’ [s], optional: ’start_power’ [%], ’end_power’ [%]",
"’temp’ [°C], ’dose’ [Gy], ’dose_rate’ [Gy/s]",
"’temp_begin’ [°C], ’temp_end’ [°C], 'heating rate' [°C/s], 'dose_rate' [Gy/s]",
"’temp’ [°C], ’dose’ [Gy], ’dose_rate’ [Gy/s]",
"’temp’ [°C], optional: ’duration’ [s], ’heating_rate’ [°C/s]",
"’temp’ [°C], ’duration’ [s], optional: ’heating_rate’ [°C/s]",
"’temp’ [°C], ’duration [s]’"))

kable(keywords,
      format = "html",
      col.names = c("ARGUMENTS", "DESCRIPTION", "SUB-ARGUMENTS"),
      caption = "Keywords in RLumModel for creating sequences") %>%
    kable_styling(bootstrap_options = c("striped", "hover"), full_width = F)


## ------------------------------------------------------------------------
sequence <- list(
 IRR = c(temp = 20, dose = 10, dose_rate = 1),
 TL = c(temp_begin = 20, temp_end = 400 , heating_rate = 5))


## ------------------------------------------------------------------------
sequence <- list(
  IRR = c(20, 10, 1),
  TL = c(20, 400, 5))

## ---- echo = FALSE-------------------------------------------------------
SAR_sequence_table <- data.frame(
  ABBREVIATION = c("RegDose", "TestDose", "PH", "CH", "OSL_temp", "OSL_duration", "Irr_temp", "PH_duration", "dose_rate", "optical_power", "Irr_2recover"),
  DESCRIPTION = c("Dose points of the regenerative cycles [Gy]", 
                  "Test dose for the SAR cycles [Gy]",
                  "Temperature of the preheat [°C]",
                  "Temperature of the cutheat [°C]",
                  "Temperature of OSL read out [°C]",
                  "Duration of OSL read out [s]",
                  "Temperature of irradiation [°C]",
                  "Duration of the preheat [s]",
                  "Dose rate of the laboratory irradiation source [Gy/s]",
                  "Percentage of the full illumination power [%]",
                  "Dose to be recovered in a dose-recovery-test [Gy]"),
  EXAMPLE_ARGUMENTS = c("c(0, 80, 140, 260, 320, 0, 80)",
                        "50",
                        "240",
                        "200",
                        "125",
                        "default: 40",
                        "default: 20",
                        "default: 10",
                        "default: 1",
                        "default: 90",
                        "20"))

kable(SAR_sequence_table,
      format = "html",
      col.names = c("ABBREVIATION", "DESCRIPTION", "EXAMPLE ARGUMENTS"),
      caption = "Keywords in RLumModel for creating SAR sequences") %>%
  kable_styling(bootstrap_options = c("striped", "hover"), full_width = F)

## ------------------------------------------------------------------------
sequence <- list(
  RegDose = c(0,10,20,50,90,0,10),
  TestDose = 2,
  PH = 220,
  CH = 220,
  OSL_temp = 125,
  Irr_2recover = 20)

## ------------------------------------------------------------------------
sequence <- list (
IRR = c (20 , 10 , 1) ,
TL = c (20 , 400 , 5))

## ---- fig.cap = "TL curve with parameter set 'Bailey2001' after 10 Gy laboratory dose"----
model.output <- model_LuminescenceSignals(
  model = "Bailey2001",
  sequence = sequence,
  verbose = FALSE)

## ---- fig.cap = "TL signal with different heating rates"-----------------
##set heating rate
heating.rate <- seq(from = 2, to = 10, by = 2)

##model signals
##"verbose = FALSE" for no terminal output
## "TL$" for exact matching TL and not (TL)
model.output <- lapply(heating.rate, function(x){
  sequence <- list(
   IRR = c(20, 10, 1),
   TL = c(20, 400, x))


  TL_data <- model_LuminescenceSignals(
      sequence = sequence,
      model = "Bailey2001",
      plot = FALSE,
      verbose = FALSE)
  
  return(Luminescence::get_RLum(TL_data, recordType = "TL$", drop = FALSE))

})

##merge output
model.output.merged <- merge_RLum(model.output)

##plot results
plot_RLum(
 object = model.output.merged,
 xlab = "Temperature [\u00B0C]",
 ylab = "TL signal [a.u.]",
 main = "TL signal with different heating rates",
 legend.text = paste(heating.rate, "°C/s"),
 combine = TRUE)

## ----TACs, fig.align="center"--------------------------------------------
##set temperature
act.temp <- seq(from = 80, to = 600, by = 20)

##loop over temperature
model.output <- vapply(X = act.temp, FUN = function(x) {
  
  ##set sequence, note: sequence includes sample history
  sequence <- list(
    IRR = c(20, 1, 1e-11),
    IRR = c(20, 10, 1),
    PH = c(x, 1),
    IRR = c(20, 0.1, 1),
    TL = c(20, 150, 5)
    )

  ##run simulation
  temp <- model_LuminescenceSignals(
    sequence = sequence,
    model = "Pagonis2007",
    simulate_sample_history = TRUE,
    plot = FALSE,
    verbose = FALSE
    )
  
  ## "TL$" for exact matching TL and not (TL)
  TL_curve <- Luminescence::get_RLum(temp, recordType = "TL$")

  ##return max value in TL curve
  return(max(get_RLum(TL_curve)[,2]))

}, FUN.VALUE = 1)

## ---- echo=FALSE, fig.cap = "TAC with parameter set of 'Pagonis2007'"----
##plot resutls
plot(
  act.temp[-(1:3)],
  model.output[-(1:3)],
  type = "b",
  xlab = "Temperature [\u00B0C]",
  ylab = "TL [a.u.]"
  )

## ---- fig.cap = "OSL measurement with different optical power densities with the parameter set of 'Bailey2004'"----
##set optical power [%]
optical_power <- c(0,20,40,60,80,100)

##loop over power 
model.output <- lapply(optical_power, function(x){

  ##set sequence
  sequence <- list(
    IRR = c(20, 50, 1),
    PH = c(220, 10, 5),
    OSL = c(125, 50, x))

  
  data <-  model_LuminescenceSignals(
    sequence = sequence,
    model = "Bailey2004",
    plot = FALSE,
    verbose = FALSE)
  
  ##"OSL$" for exact matching OSL and not (OSL)
  return(Luminescence::get_RLum(data, recordType = "OSL$", drop = FALSE))
  
})

##merge output
model.output.merged <- Luminescence::merge_RLum(model.output)

##plot results
Luminescence::plot_RLum(
  object = model.output.merged,
  xlab = "Illumination time [s]",
  ylab = "OSL signal [a.u.]",
  legend.text = paste("Optical power ", 20 * optical_power / 100," mW/cm^2"),
  combine = TRUE 
  )

## ----DRT, fig.cap = "Dose recovery test (DRT) with the parameter set of 'Pagonis2008'"----
##set PH temperatures
PH_temp <- seq(from = 160, to = 300, by = 20)

##set regeneration doses
RegDose = c(0, 80, 140, 260, 320, 0, 80)

##loop over PH temperatures
DRT.output <- lapply(PH_temp, function(x){

  sequence <- list(
       RegDose = RegDose,
       TestDose = 20,
       PH = x,
       CH = x,
       OSL_temp = 125,
       Irr_2recover = 200)

  model.output <- model_LuminescenceSignals(
       sequence = sequence,
       model = "Pagonis2008",
       plot = FALSE,
       verbose = FALSE)

  results <- Luminescence::analyse_SAR.CWOSL(
       object = model.output,
       signal.integral.min = 1,
       signal.integral.max = 7,
       background.integral.min = 301,
       background.integral.max = 401,
       fit.method = "EXP",
       dose.points = RegDose,
       plot = FALSE)
															
  temp <- get_RLum(results)
  out <- data.frame(
    De = temp$De, 
    De.error = temp$De.Error)
    
  return(out)
})

##output as data.frame for plot_DRTResults
DRT.result <- as.data.frame(do.call(rbind, DRT.output))

##plot DRT.results
Luminescence::plot_DRTResults(
     DRT.result, 
     preheat = PH_temp,
     given.dose = 200)

## ----SAR, fig.cap = "SAR protocol with the parameter set of 'Pagonis2008'"----
##set RegDose
RegDose = c(0, 80, 140, 260, 320, 0, 80)

##set sequence
sequence <- list(
  RegDose = RegDose,
  TestDose = 20,
  PH = 220,
  CH = 220,
  OSL_temp = 125
  )

##model 
model.output <- model_LuminescenceSignals(
  sequence = sequence,
  model = "Pagonis2008",
  plot = FALSE,
  verbose = FALSE
  )
		
##analyse SAR sequence and plot only the resulting growth curve	
results <-Luminescence::analyse_SAR.CWOSL(
  model.output,
  signal.integral.min = 1,
  signal.integral.max = 7,
  background.integral.min = 301,
  background.integral.max = 401,
  fit.method = "EXP",
  dose.points = RegDose, 
  verbose = FALSE, 
  plot.single = c(6)
  )

