library(saeSim)


### Name: sim_sample
### Title: Sampling component
### Aliases: sim_sample

### ** Examples

# Simple random sample - 5% sample:
sim_base_lm() %>% sim_sample(sample_fraction(0.05))

# Simple random sampling proportional to size - 5% in each domain:
sim_base_lm() %>% sim_sample(sample_fraction(0.05, groupVars = "idD"))

# User defined sampling function:
sample_mySampleFun <- function(dat) {
  dat[sample.int(nrow(dat), 10), ]
}

sim_base_lm() %>% sim_sample(sample_mySampleFun)



