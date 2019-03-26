library(rcosmo)


### Name: coords<-.data.frame
### Title: Assign new coordinate system to a 'data.frame'
### Aliases: coords<-.data.frame
### Keywords: internal

### ** Examples


## Create df with no coords, then create df2 with cartesian coords
df <- data.frame(x = c(1,0,0), y = c(0,1,0), z = c(0,0,1))
df2 <- coords(df, new.coords = "cartesian")
df2
df

## Change the coords of df directly (to spherical)
coords(df) <- "spherical"
df




