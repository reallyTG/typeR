library(inlmisc)


### Name: AddColorKey
### Title: Add Color Key to Plot
### Aliases: AddColorKey
### Keywords: hplot

### ** Examples

op <- par(mfrow = c(7, 1), omi = c(1, 1, 1, 1), mar = c(2, 3, 2, 3))
AddColorKey(breaks = 0:10, explanation = "Example description of data variable.")
AddColorKey(breaks = 0:1000, at = pretty(0:1000))
AddColorKey(breaks = c(0, 1, 2, 4, 8, 16))
breaks <- c(pi * 10^(-5:5))
AddColorKey(breaks = breaks, log = TRUE)
AddColorKey(breaks = breaks, at = breaks[as.logical(seq_along(breaks) %% 2)],
            scipen = NULL, log = TRUE)
AddColorKey(is.categorical = TRUE, labels = LETTERS[1:5])
AddColorKey(is.categorical = TRUE, col = GetColors(5, scheme = "bright"))
par(op)




