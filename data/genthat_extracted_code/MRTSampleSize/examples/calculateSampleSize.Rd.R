library(MRTSampleSize)


### Name: calculateSampleSize
### Title: Calculate sample size for micro-randomized trials
### Aliases: calculateSampleSize

### ** Examples

calculateSampleSize(days=42,
                    occ_per_day=5,
                    prob=0.4,
                    beta_shape="quadratic",
                    beta_mean=0.1,
                    beta_initial=0,
                    beta_quadratic_max=28,
                    tau_shape="quadratic",
                    tau_mean=0.5,
                    tau_initial=0.7,
                    tau_quadratic_max=42,
                    power=0.8,
                    sigLev=0.05)

prob1 <- c(replicate(35,0.7),replicate(35,0.6),replicate(35,0.5),replicate(35,0.4))
calculateSampleSize(days=28,
                    occ_per_day=5,
                    prob=prob1,
                    beta_shape="quadratic",
                    beta_mean=0.1,
                    beta_initial=0,
                    beta_quadratic_max=28,
                    tau_shape="quadratic",
                    tau_mean=0.5,
                    tau_initial=0.7,
                    tau_quadratic_max=42,
                    power=0.8,
                    sigLev=0.05)



