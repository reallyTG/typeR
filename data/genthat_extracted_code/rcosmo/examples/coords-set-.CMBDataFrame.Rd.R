library(rcosmo)


### Name: coords<-.CMBDataFrame
### Title: Assign new coordinate system to a 'CMBDataFrame'
### Aliases: coords<-.CMBDataFrame
### Keywords: internal

### ** Examples


## Create df with no coords, then create df2 with cartesian coords
df <- CMBDataFrame(nside = 16)
df
coords(df)
df2 <- coords(df, new.coords = "cartesian")
coords(df2)
coords(df)

## Change the coords of df directly (to spherical)
coords(df) <- "spherical"
df




