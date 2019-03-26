library(mosaicData)


### Name: Births78
### Title: US Births in 1978
### Aliases: Births78

### ** Examples

data(Births78)
if (require(ggformula)) {
  gf_point(births ~ date, data = Births78)
  gf_point(births ~ date, data = Births78, color = ~ wday)
}



