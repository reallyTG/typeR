library(NADA)


### Name: Cen
### Title: Create a Censored Object
### Aliases: Cen
### Keywords: survival

### ** Examples

    obs      = c(0.5,    0.5,   1.0,  1.5,   5.0,    10,   100)
    censored = c(TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE)

    Cen(obs, censored)
    flip(Cen(obs, censored))



