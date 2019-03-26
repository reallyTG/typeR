library(NADA)


### Name: ros
### Title: Regression on Order Statistics
### Aliases: ros lros cenros
### Keywords: regression

### ** Examples

    obs      = c(0.5,    0.5,   1.0,  1.5,   5.0,    10,   100)
    censored = c(TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE)

    myros = ros(obs, censored) 

    plot(myros)
    summary(myros)
    mean(myros); sd(myros)
    quantile(myros); median(myros)
    as.data.frame(myros)



