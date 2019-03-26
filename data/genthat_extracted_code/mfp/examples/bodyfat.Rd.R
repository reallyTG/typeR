library(mfp)


### Name: bodyfat
### Title: percentage of body fat determined by underwater weighing
### Aliases: bodyfat
### Keywords: datasets

### ** Examples

    data(bodyfat)
    bodyfat$height[bodyfat$case==42] <- 69.5   # apparent error
    bodyfat <- bodyfat[-which(bodyfat$case==39),]  # cp. Royston $\amp$ Sauerbrei, 2004
    mfp(siri ~ fp(age, df = 4, select = 0.1) + fp(weight, df = 4, select = 0.1)
                 + fp(height, df = 4, select = 0.1), family = gaussian, data = bodyfat)



