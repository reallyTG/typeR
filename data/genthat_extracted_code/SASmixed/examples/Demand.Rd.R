library(SASmixed)


### Name: Demand
### Title: Per-capita demand deposits by state and year
### Aliases: Demand
### Keywords: datasets

### ** Examples

str(Demand)
if (require("lme4", quietly = TRUE, character = TRUE)) {
  ## compare to output 3.13, p. 132
  summary(fm1Demand <-
      lmer(log(d) ~ log(y) + log(rd) + log(rt) + log(rs) + (1|State) + (1|Year),
         Demand))
}



