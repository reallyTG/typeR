library(RcppZiggurat)


### Name: zrnorm
### Title: Collection of Ziggurat Normal RNGs
### Aliases: zrnorm zrnormLZLLV zrnormMT zrnormV1 zrnormV1b zrnormStl
###   zrnormStlV1 zrnormVec zrnormVecV1 zrnormGSL zrnormQL zrnormGl zrnormR
###   zsetseed zsetseedV1 zsetseedV1b zsetseedLZLLV zsetseedMT zsetseedGSL
###   zsetseedQL zsetseedGl zgetseed zgetseedV1 ziggbin ziggsum ziggtest
### Keywords: package

### ** Examples

  set.seed(42)
  system.time(replicate(500, rnorm(10000)))

  zsetseed(42)
  system.time(replicate(500, zrnorm(10000)))



