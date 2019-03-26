library(rcosmo)


### Name: window.data.frame
### Title: Get a sub window from a data.frame
### Aliases: window.data.frame

### ** Examples


win1 <- CMBWindow(theta = c(0,pi/2,pi/2), phi = c(0,0,pi/2))

cmbdf <- CMBDataFrame(nside = 4)
df2 <- coords(cmbdf, new.coords = "cartesian")
df <- as.data.frame(df2[,1:3])
df
df.win <- window(df, new.window = win1)
df.win




