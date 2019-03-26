library(mbest)


### Name: mhglm_sim
### Title: Simulate response patterns
### Aliases: mhglm_sim
### Keywords: datagen

### ** Examples

mhglm_sim(n = 2, m_per_level = c(3, 3), sd_intercept = c(1, 2), 
        sd_slope = c(2, 1), family = "gaussian", seed = 123)

mhglm_sim(n = 2, m_per_level = c(3, 3), sd_intercept = c(1, 2), 
        sd_slope = c(2, 1), family = "binomial", seed = 123)



