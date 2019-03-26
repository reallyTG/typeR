library(mosaicCore)


### Name: prop
### Title: Compute proportions, percents, or counts for a single level
### Aliases: prop prop1 count perc

### ** Examples

if (require(mosaicData)) {
  prop( ~sex, data=HELPrct)
  prop( ~sex, data=HELPrct, success = "male")
  count( ~sex | substance, data=HELPrct)
  prop( ~sex | substance, data=HELPrct)
  perc( ~sex | substance, data=HELPrct)
}



