library(AER)


### Name: TravelMode
### Title: Travel Mode Choice Data
### Aliases: TravelMode
### Keywords: datasets

### ** Examples

data("TravelMode")

## overall proportions for chosen mode
with(TravelMode, prop.table(table(mode[choice == "yes"])))

## travel vs. waiting time for different travel modes
library("lattice")
xyplot(travel ~ wait | mode, data = TravelMode)

## Greene (2003), Table 21.11, conditional logit model
if(require("mlogit")) {
TravelMode$incair <- with(TravelMode, income * (mode == "air"))
tm_cl <- mlogit(choice ~ gcost + wait + incair, data = TravelMode,
  shape = "long", alt.var = "mode", reflevel = "car")
summary(tm_cl)
}



