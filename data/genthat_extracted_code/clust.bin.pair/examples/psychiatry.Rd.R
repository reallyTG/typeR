library(clust.bin.pair)


### Name: psychiatry
### Title: Psychiatrist and patient disagreement data
### Aliases: psychiatry
### Keywords: datasets

### ** Examples

data(psychiatry)

psychiatry$Wh == round((psychiatry$bh - psychiatry$ch) / psychiatry$Nh, 2)

clust.bin.pair(psychiatry$ah, psychiatry$bh, psychiatry$ch, psychiatry$dh, method="eliasziw")



