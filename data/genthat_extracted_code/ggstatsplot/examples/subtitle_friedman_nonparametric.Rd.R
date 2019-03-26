library(ggstatsplot)


### Name: subtitle_friedman_nonparametric
### Title: Making text subtitle for the Friedman Rank Sum Test
###   (nonparametric ANOVA) (within-subjects designs).
### Aliases: subtitle_friedman_nonparametric

### ** Examples

# setup
set.seed(123)
library(ggstatsplot)
library(jmv)
data("bugs", package = "jmv")

# converting to long format
data_bugs <- bugs %>%
  tibble::as_tibble(.) %>%
  tidyr::gather(., key, value, LDLF:HDHF)

# creating the subtitle
ggstatsplot::subtitle_friedman_nonparametric(
  data = data_bugs,
  x = key,
  y = value,
  k = 2
)



