library(Luminescence)


### Name: calc_Lamothe2003
### Title: Apply fading correction after Lamothe et al., 2003
### Aliases: calc_Lamothe2003
### Keywords: datagen

### ** Examples


##load data
##ExampleData.BINfileData contains two BINfileData objects
##CWOSL.SAR.Data and TL.SAR.Data
data(ExampleData.BINfileData, envir = environment())

##transform the values from the first position in a RLum.Analysis object
object <- Risoe.BINfileData2RLum.Analysis(CWOSL.SAR.Data, pos=1)

##perform SAR analysis and set rejection criteria
results <- analyse_SAR.CWOSL(
object = object,
signal.integral.min = 1,
signal.integral.max = 2,
background.integral.min = 900,
background.integral.max = 1000,
verbose = FALSE,
plot = FALSE,
onlyLxTxTable = TRUE
)

##run fading correction
results_corr <- calc_Lamothe2003(
  object = results,
  dose_rate.envir =  c(1.676 , 0.180),
  dose_rate.source = c(0.184, 0.003),
  g_value =  c(2.36, 0.6),
  plot = TRUE,
  fit.method = "EXP")





