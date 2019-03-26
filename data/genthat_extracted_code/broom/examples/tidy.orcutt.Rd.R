library(broom)


### Name: tidy.orcutt
### Title: Tidy a(n) orcutt object
### Aliases: tidy.orcutt orcutt_tidiers

### ** Examples


reg <- lm(mpg ~ wt + qsec + disp, mtcars)
tidy(reg)

if (require("orcutt", quietly = TRUE)) {
  co <- cochrane.orcutt(reg)
  co

  tidy(co)
  glance(co)
}




