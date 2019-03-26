library(mosaicData)


### Name: Mites
### Title: Mites and Wilt Disease
### Aliases: Mites
### Keywords: datasets

### ** Examples

data(Mites)
if (require(mosaic)) {
  tally(~ treatment + outcome, data=Mites)
  tally(~ outcome | treatment, format="percent", data=Mites)
}




