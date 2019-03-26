library(mosaic)


### Name: maggregate
### Title: Aggregate for mosaic
### Aliases: maggregate

### ** Examples

if (require(mosaicData)) {
maggregate( cesd ~ sex, HELPrct, FUN=mean )
# using groups instead
maggregate( ~ cesd, groups = sex, HELPrct, FUN=sd )
# the next four all do the same thing
maggregate( cesd ~ sex + homeless, HELPrct, FUN=mean )
maggregate( cesd ~ sex | homeless, HELPrct, FUN=sd )
maggregate( ~ cesd | sex , groups= homeless, HELPrct, FUN=sd )
maggregate( cesd ~ sex, groups = homeless, HELPrct, FUN=sd )
# this is unusual, but also works.
maggregate( cesd ~ NULL , groups = sex, HELPrct, FUN=sd )
}




