library(mosaic)


### Name: aggregatingFunction1
### Title: 1-ary Aggregating functions
### Aliases: aggregatingFunction1

### ** Examples

if (require(mosaicData)) {
  foo <- aggregatingFunction1(base::mean)
  foo( ~ length, data = KidsFeet)
  base::mean(KidsFeet$length)
  foo(length ~ sex, data = KidsFeet)
} 



