library(ggstatsplot)


### Name: subtitle_onesample_proptest
### Title: Making text subtitle for Proportion Test (N Outcomes)
### Aliases: subtitle_onesample_proptest

### ** Examples


# with counts
library(jmv)

subtitle_onesample_proptest(
  data = as.data.frame(HairEyeColor),
  main = Eye,
  counts = Freq
)

# in case no variation, only sample size will be shown
subtitle_onesample_proptest(
  data = cbind.data.frame(x = rep("a", 10)),
  main = x
)



