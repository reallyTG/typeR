library(abd)


### Name: DaphniaResistance
### Title: Daphnia Resistance to Cyanobacteria
### Aliases: DaphniaResistance
### Keywords: datasets

### ** Examples

str(DaphniaResistance)


bwplot(resistance ~ density, DaphniaResistance)
# with such a small data set, we can display all the data
# rather than a summary
xyplot(resistance ~ density, DaphniaResistance)
histogram( ~ resistance| density, DaphniaResistance,
	strip=FALSE, strip.left = TRUE,
	layout=c(1,3)
	)



