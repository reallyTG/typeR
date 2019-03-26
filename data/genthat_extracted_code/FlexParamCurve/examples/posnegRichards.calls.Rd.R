library(FlexParamCurve)


### Name: posnegRichards.calls
### Title: List of calls for fitting 33 SSposnegRichards models in
###   'nlsList'
### Aliases: posnegRichards.calls
### Keywords: datasets

### ** Examples

# see all possible calls
posnegRichards.calls
# extract the call for fitting a nls model with 8-parameter double-Richards curve (model 1)
#for an example just fit a subset of the data, 3 group levels (individuals)
   data <- subset(posneg.data, as.numeric(row.names (posneg.data) ) < 40)
modtofit <- as.character( 
               posnegRichards.calls [[2]] [row.names(posnegRichards.calls [[2]]) == "22",] )
#change the data source
modtofit <- sub("posneg.data","data",modtofit)
modtofit <- parse(text = modtofit)
#create list for fixed parameters
modpar(posneg.data$age, posneg.data$mass, pn.options = "myoptions")
#create a new nlsList object called richards22.lis
eval(modtofit)
#view object
richardsR22.lis

# view call for model 1
posnegRichards.calls [[1]] [row.names(posnegRichards.calls [[1]]) == "1",]

# view call for model 21
posnegRichards.calls [[2]] [row.names(posnegRichards.calls [[2]]) == "21",]



