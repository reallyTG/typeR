library(mosaicModel)


### Name: HDD_Minneapolis
### Title: Heating degree days in Minneapolis, Minnesota, USA
### Aliases: HDD_Minneapolis
### Keywords: datasets

### ** Examples

mod_1 <- lm(hdd ~ year, data = HDD_Minneapolis)
mod_2 <- lm(hdd ~ year + month, data = HDD_Minneapolis)



