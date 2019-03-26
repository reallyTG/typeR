library(rcosmo)


### Name: sampleCMB
### Title: Take a simple random sample from a 'CMBDataFrame'
### Aliases: sampleCMB

### ** Examples

## Download the map first
# downloadCMBMap(foreground = "smica", nside = 1024)
# df <- CMBDataFrame("CMB_map_smica1024.fits")
# plot(sampleCMB(df, sample.size = 800000))

df <- CMBDataFrame(nside = 16, I = rnorm(12 * 16 ^ 2), ordering = "nested")
df.sample <- sampleCMB(df, sample.size = 100)
df.sample




