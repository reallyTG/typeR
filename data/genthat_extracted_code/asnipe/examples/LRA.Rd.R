library(asnipe)


### Name: LRA
### Title: Dyadic Lagged Association Rate
### Aliases: LRA

### ** Examples


data("group_by_individual")
data("times")
data("individuals")

## calculate lagged association rate
lagged_rates <- LRA(gbi,times,3600, classes=inds$SPECIES, which_classes="GRETI", output_style=2)

## do something (run a model, plot a surface, etc..)



