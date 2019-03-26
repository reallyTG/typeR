library(spacom)


### Name: SpawAggregateOutput-class
### Title: Class '"SpawAggregateOutput"'
### Aliases: SpawAggregateOutput-class
###   [,SpawAggregateOutput,ANY,ANY,ANY-method
###   getSample,SpawAggregateOutput-method
###   length,SpawAggregateOutput-method
###   merge,SpawAggregateOutput,SpawAggregateOutput-method
###   names<-,SpawAggregateOutput-method
###   names<-,SpawAggregateOutput,ANY-method
###   names,SpawAggregateOutput-method show,SpawAggregateOutput-method
### Keywords: classes spatial

### ** Examples

## load distance matrix
data(d_geo)
## create a weight matrix
geow.50 <- WeightMatrix(d_geo, bandwidth=50)
## load contextual data
data(traces_event)

## aggregate data
## Don't show: 
traces_event=traces_event[seq(1, nrow(traces_event), by=100),]
## End(Don't show)
wv.int <- SpawAggregate(contextual.data=traces_event,
                        context.id="area.name",
                        contextual.names=c("w_all", "w_all"),
                        contextual.weight.matrices=list(NULL, geow.50),
                        aggregation.functions="weighted.mean",
                        design.weight.names="weight",
                        nb.resamples=4)
## check the number of samples
length(wv.int)

## check the second sample
head(wv.int[2])

## change the names of the weighted indicators to more significant ones
names(wv.int) <- c("w_all.0", "w_all.50")

showClass("SpawAggregateOutput")



