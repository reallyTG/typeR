library(EngrExpt)


### Name: bath
### Title: Electrical resistance after water bath
### Aliases: bath
### Keywords: datasets

### ** Examples

str(bath)
dotplot(ordered(time) ~ er, bath, groups = temp, type = c("p","a"),
        xlab = expression("Electrical resistance (ohm/" * m^2 * ")"),
        ylab = "Time in bath (coded)",
        auto.key = list(columns = 2, lines = TRUE))
summary(fm1 <- lm(er ~ time * temp, bath))
summary(fm2 <- lm(er ~ time + temp, bath))
summary(fm3 <- lm(er ~ temp, bath))



