library(mosaicData)


### Name: Utilities
### Title: Utility bills
### Aliases: Utilities
### Keywords: datasets

### ** Examples

data(Utilities)
if (require(ggformula)) {
  gf_point(gasbill ~ temp, data = Utilities)
}




