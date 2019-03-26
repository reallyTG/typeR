library(mosaic)


### Name: do
### Title: Do Things Repeatedly
### Aliases: do do.numeric do.default Do print.repeater
###   *,repeater,ANY-method
### Keywords: iteration

### ** Examples

do(3) * rnorm(1)
do(3) * "hello"
do(3) * 1:4
do(3) * mean(rnorm(25))
if (require(mosaicData)) {
  do(3) * lm(shuffle(height) ~ sex + mother, Galton)
  do(3) * anova(lm(shuffle(height) ~ sex + mother, Galton))
  do(3) * c(sample.mean = mean(rnorm(25)))
  set.rseed(1234)
  do(3) * tally( ~sex|treat, data=resample(HELPrct))
  set.rseed(1234)  # re-using seed gives same results again
  do(3) * tally( ~sex|treat, data=resample(HELPrct))
}



