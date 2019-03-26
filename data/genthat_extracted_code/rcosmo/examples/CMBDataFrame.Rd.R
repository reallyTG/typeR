library(rcosmo)


### Name: CMBDataFrame
### Title: CMBDataFrame class
### Aliases: CMBDataFrame

### ** Examples

## Method 1: Read the data while constructing the CMBDataFrame
## download a FITS file and use real data
# downloadCMBMap()
# df <- CMBDataFrame("CMB_map_smica1024.fits")
df <- CMBDataFrame(nside = 16, I = rnorm(12 * 16 ^ 2),
                   ordering = "nested")

# Specify a sample size for a random sample
df.sample <- CMBDataFrame(df, sample.size = 80)
plot(df.sample)

# Specify a vector of pixel indices using spix
df.subset <- CMBDataFrame(df, spix = c(2,4,6))

# Take a look at the summary
summary(df)

# Access HEALPix pixel indices using pix function
# (these are stored in the row.names attribute)
pix(df.subset)






