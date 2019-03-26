library(sclero)


### Name: assign.value
### Title: Assign values to 'rawDist' objects for plotting.
### Aliases: assign.value

### ** Examples

data(barium)
data(shellsizes)

## rawDist
shellvalues <- assign.value(shellsizes, barium, value.name = "Ba/Ca")
plot(shellvalues, spot.size = "actual", spot.type = "value", main.type = "none")

## spotDist
shellvalues.aligned <- spot.dist(shellvalues)
plot(shellvalues.aligned, spot.size = "actual", spot.type = "idvalue", 
spot.color = "darkgrey", highlight.gbs = c("WG_start", "WG_end"))



