library(rcosmo)


### Name: coords<-.HPDataFrame
### Title: Assign new coordinate system to a 'HPDataFrame'
### Aliases: coords<-.HPDataFrame
### Keywords: internal

### ** Examples


## Create df with no coords, then create df2 with cartesian coords
df <- HPDataFrame(I = rep(0,12), nside = 1)
df
df2 <- coords(df, new.coords = "cartesian")
df2
df

## Change the coords of df directly (to spherical)
coords(df) <- "spherical"
df




