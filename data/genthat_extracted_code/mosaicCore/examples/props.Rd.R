library(mosaicCore)


### Name: counts
### Title: Compute all proportions or counts
### Aliases: counts counts.factor counts.default counts.formula props percs

### ** Examples

if (require(mosaicData)) {
  props(HELPrct$substance)
  # numeric version tallies missing values as well
  props(HELPmiss$link)
  # Formula version omits missing data with warning (by default)
  props( ~ link, data = HELPmiss)                       # omit NAs with warning
  props( ~ link, data = HELPmiss, na.action = na.pass)  # no warning; tally NAs
  props( ~ link, data = HELPmiss, na.action = na.omit)  # no warning, omit NAs
  props( ~ substance | sex, data = HELPrct)
  props( ~ substance | sex, data = HELPrct, format = "percent")
  percs( ~ substance | sex, data = HELPrct)
  counts( ~ substance | sex, data = HELPrct)
  df_stats( ~ substance | sex, data = HELPrct, props, counts)
  df_stats( ~ substance | sex, data = HELPmiss, props, na.action = na.pass)
}




