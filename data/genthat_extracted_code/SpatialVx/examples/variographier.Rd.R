library(SpatialVx)


### Name: variographier
### Title: Variography Score
### Aliases: variographier variographier.default variographier.SpatialVx
### Keywords: manip

### ** Examples

data( "UKobs6" )
data( "UKfcst6" )
data( "UKloc" )

hold <- make.SpatialVx( UKobs6, UKfcst6, thresholds = c(0.01, 20.01),
    loc = UKloc, field.type = "Precipitation", units = "mm/h",
    data.name = "Nimrod", obs.name = "Observations 6", model.name = "Forecast 6",
    map = TRUE)

look <- variographier( hold )
look
plot( look )



