library(recexcavAAR)


### Name: kriglist
### Title: Apply kriging {kriging} to a list of data.frames
### Aliases: kriglist

### ** Examples

df1 <- data.frame(
 x = rnorm(50),
 y = rnorm(50),
 z = rnorm(50) - 5
)

df2 <- data.frame(
 x = rnorm(50),
 y = rnorm(50),
 z = rnorm(50) + 5
)

lpoints <- list(df1, df2)

surfacelist <- kriglist(lpoints, lags = 3, model = "spherical")




