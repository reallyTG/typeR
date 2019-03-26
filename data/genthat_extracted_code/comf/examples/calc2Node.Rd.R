library(comf)


### Name: calc2Node
### Title: Calculating Comfort Indices based on the 2-Node-Model
### Aliases: calc2Node calcET calcSET calcTSens calcDisc calcPD calcPS
###   calcPTS 2Node Gagge ET SET TSens Disc PD PS PTS et set tsens disc pd
###   ps pts calcPMVGagge calcPMVStar calcSkinWettedness
### Keywords: manip

### ** Examples

## Calculation of a single set of values.
calc2Node(22, 25, .50, 50)

## Using several rows of data:
ta <- c(20,22,24)
tr <- ta
vel <- rep(.15,3)
rh <- rep(50,3)

maxLength <- max(sapply(list(ta, tr, vel, rh), length))
SET <- sapply(seq(maxLength), function(x) { calcSET(ta[x], tr[x], vel[x], rh[x]) } ) 



