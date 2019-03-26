library(rcosmo)


### Name: as.CMBDataFrame
### Title: Convert dataframes to CMBDataFrames
### Aliases: as.CMBDataFrame

### ** Examples


## Example 1: Create df with no coords, then create CMBDataFrames cmbdf and
## df2 with spherical coords

df <- data.frame(I=rnorm(12))
df

cmbdf <- as.CMBDataFrame(df,ordering= "ring", nside=1)
summary(cmbdf)
pix(cmbdf)
coords(cmbdf)

df2 <- coords(cmbdf, new.coords = "spherical")
df2

## Example 2: Create CMBDataFrames for first 10 Healpix centers

df <- data.frame(I=rnorm(10))
df
cmbdf <- as.CMBDataFrame(df,ordering= "ring", nside=2, spix=1:10)
summary(cmbdf)
pix(cmbdf)




