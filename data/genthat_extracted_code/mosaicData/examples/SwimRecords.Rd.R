library(mosaicData)


### Name: SwimRecords
### Title: 100 m Swimming World Records
### Aliases: SwimRecords
### Keywords: datasets

### ** Examples

data(SwimRecords)
if (require(ggformula)) {
  gf_point(time ~ year, data = SwimRecords, color = ~ sex) 
}




