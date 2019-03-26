library(mosaic)


### Name: ntiles
### Title: Create vector based on roughly equally sized groups
### Aliases: ntiles

### ** Examples

if (require(mosaicData)) {
tally( ~ ntiles(age, 4), data=HELPrct)
tally( ~ ntiles(age, 4, format="center"), data=HELPrct)
tally( ~ ntiles(age, 4, format="interval"), data=HELPrct)
tally( ~ ntiles(age, 4, format="left"), data=HELPrct)
tally( ~ ntiles(age, 4, format="right"), data=HELPrct)
tally( ~ ntiles(age, 4, format="mean"), data=HELPrct)
tally( ~ ntiles(age, 4, format="median"), data=HELPrct)
bwplot( i2 ~ ntiles(age, n=5, format="interval"), data=HELPrct)
}



