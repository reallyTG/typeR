library(mosaic)


### Name: aggregatingFunction2
### Title: 2-ary aggregating functions
### Aliases: aggregatingFunction2

### ** Examples

if(require(mosaicData)) {
  foo <- aggregatingFunction2(stats::cor)
  foo(length ~ width, data = KidsFeet)
  stats::cor(KidsFeet$length, KidsFeet$width)
}



