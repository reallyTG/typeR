library(mosaicData)


### Name: Utilities2
### Title: Utility bills
### Aliases: Utilities2
### Keywords: datasets

### ** Examples

data(Utilities2)
if (require(ggformula)) {
  gf_point(gasbillpday ~ temp, data = Utilities2)
}




