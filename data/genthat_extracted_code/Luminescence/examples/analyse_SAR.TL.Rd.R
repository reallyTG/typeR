library(Luminescence)


### Name: analyse_SAR.TL
### Title: Analyse SAR TL measurements
### Aliases: analyse_SAR.TL
### Keywords: datagen plot

### ** Examples


##load data
data(ExampleData.BINfileData, envir = environment())

##transform the values from the first position in a RLum.Analysis object
object <- Risoe.BINfileData2RLum.Analysis(TL.SAR.Data, pos=3)

##perform analysis
analyse_SAR.TL(object,
               signal.integral.min = 210,
               signal.integral.max = 220,
               log = "y",
               fit.method = "EXP OR LIN",
               sequence.structure = c("SIGNAL", "BACKGROUND"))




