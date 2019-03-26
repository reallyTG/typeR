library(mosaic)


### Name: diffmean
### Title: Difference in means and proportions
### Aliases: diffmean diffprop

### ** Examples

if (require(mosaicData)) {
diffprop( homeless ~ sex , data=HELPrct)
do(3) * diffprop( homeless ~ shuffle(sex) , data=HELPrct)
diffmean( age ~ substance, data=HELPrct, only.2=FALSE)
do(3) * diffmean(age ~ shuffle(substance), data=HELPrct, only.2=FALSE)
diffmean( age ~ sex, data=HELPrct)
do(3) * diffmean(age ~ shuffle(sex), data=HELPrct)
}



