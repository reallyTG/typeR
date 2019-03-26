library(gglorenz)


### Name: stat_lorenz
### Title: Values of Ordinary Lorenz Curve
### Aliases: stat_lorenz

### ** Examples

library(gglorenz)

ggplot(billionaires, aes(TNW)) +
    stat_lorenz()

ggplot(billionaires, aes(TNW)) +
    stat_lorenz(desc = TRUE) +
    coord_fixed() +
    geom_abline(linetype = "dashed") +
    theme_minimal()



