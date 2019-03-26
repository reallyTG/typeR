library(aplore3)


### Name: burn1000
### Title: BURN1000 data
### Aliases: burn1000
### Keywords: datasets

### ** Examples

head(burn1000, n = 10)
summary(burn1000)

## Table 3.15 p. 80
summary(mod3.15 <- glm(death ~ tbsa + inh_inj + age + gender + flame + race,
                       family = binomial, data = burn1000 ))



