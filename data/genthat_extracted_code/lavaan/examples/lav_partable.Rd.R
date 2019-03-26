library(lavaan)


### Name: lav_partable
### Title: lavaan partable functions
### Aliases: lav_partable_independence lav_partable_unrestricted
###   lav_partable_df lav_partable_ndat lav_partable_npar
###   lav_partable_labels lav_partable_from_lm lav_partable_complete
###   lav_partable_attributes lav_partable_merge

### ** Examples

# generate syntax for an independence model
HS.model <- ' visual  =~ x1 + x2 + x3
              textual =~ x4 + x5 + x6
              speed   =~ x7 + x8 + x9 '

fit <- cfa(HS.model, data=HolzingerSwineford1939)
lav <- lav_partable_independence(fit)
as.data.frame(lav, stringsAsFactors = FALSE)


# how many free parameters?
lav_partable_npar(lav)

# how many sample statistics?
lav_partable_ndat(lav)



