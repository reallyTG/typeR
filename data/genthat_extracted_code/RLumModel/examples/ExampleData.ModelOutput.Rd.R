library(RLumModel)


### Name: ExampleData.ModelOutput
### Title: Example data (TL curve) simulated with parameter set from
###   Pagonis 2007
### Aliases: ExampleData.ModelOutput model.output
### Keywords: datasets

### ** Examples


data("ExampleData.ModelOutput", envir = environment())

TL_curve <- get_RLum(model.output, recordType = "TL$", drop = FALSE)

##plot TL curve
plot_RLum(TL_curve)

TL_concentrations <- get_RLum(model.output, recordType = "(TL)", drop = FALSE)
plot_RLum(TL_concentrations)





