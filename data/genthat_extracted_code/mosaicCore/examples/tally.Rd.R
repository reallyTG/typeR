library(mosaicCore)


### Name: tally
### Title: Tabulate categorical data
### Aliases: tally tally.tbl tally.data.frame tally.formula

### ** Examples

if (require(mosaicData)) {
tally( ~ substance, data = HELPrct)
tally( ~ substance + sex , data = HELPrct)
tally( sex ~ substance, data = HELPrct)   # equivalent to tally( ~ sex | substance, ... )
tally( ~ substance | sex , data = HELPrct)
tally( ~ substance | sex , data = HELPrct, format = 'count', margins = TRUE)
tally( ~ substance + sex , data = HELPrct, format = 'percent', margins = TRUE)
tally( ~ substance | sex , data = HELPrct, format = 'percent', margins = TRUE)
# force NAs to show up
tally( ~ sex, data = HELPrct, useNA = "always")
# show NAs if any are there
tally( ~ link, data = HELPrct)
# ignore the NAs
tally( ~ link, data = HELPrct, useNA = "no")
}



