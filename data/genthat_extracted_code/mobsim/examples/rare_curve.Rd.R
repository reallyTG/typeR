library(mobsim)


### Name: rare_curve
### Title: Species rarefaction curve
### Aliases: rare_curve

### ** Examples

sad1 <- sim_sad(100, 2000, sad_type = "lnorm", sad_coef = list("meanlog" = 2,
                                                                "sdlog" = 1))
rc1 <- rare_curve(sad1)
plot(rc1, type = "l", xlab = "Sample size", ylab = "Expected species richness")




