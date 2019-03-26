library(broom)


### Name: tidy.ridgelm
### Title: Tidy a(n) ridgelm object
### Aliases: tidy.ridgelm ridgelm_tidiers

### ** Examples


names(longley)[1] <- "y"
fit1 <- MASS::lm.ridge(y ~ ., longley)
tidy(fit1)

fit2 <- MASS::lm.ridge(y ~ ., longley, lambda = seq(0.001, .05, .001))
td2 <- tidy(fit2)
g2 <- glance(fit2)

# coefficient plot
library(ggplot2)
ggplot(td2, aes(lambda, estimate, color = term)) +
  geom_line()

# GCV plot
ggplot(td2, aes(lambda, GCV)) +
  geom_line()

# add line for the GCV minimizing estimate
ggplot(td2, aes(lambda, GCV)) + 
  geom_line() +
  geom_vline(xintercept = g2$lambdaGCV, col = "red", lty = 2)




