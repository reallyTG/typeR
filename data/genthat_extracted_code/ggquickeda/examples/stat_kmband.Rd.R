library(ggquickeda)


### Name: StatKmband
### Title: Adds confidence bands to a Kaplan Meier Estimate of Survival
### Aliases: StatKmband stat_kmband
### Keywords: internal

### ** Examples

library(ggplot2)
sex <- rbinom(250, 1, .5)
df <- data.frame(time = exp(rnorm(250, mean = sex)), status = rbinom(250, 1, .75), sex = sex)
ggplot(df, aes(time = time, status = status, color = factor(sex))) +
 stat_km()

## Examples illustrating the options passed to survfit.formula

p1 <- ggplot(df, aes(time = time, status = status))
p1 + stat_km() + stat_kmband(conf.int = .99)
p1 + stat_km() + stat_kmband(error = "tsiatis")
# NOTE this example doesn't work
# p1 + stat_km() + stat_km(conf.type = "log-log")




