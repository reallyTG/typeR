library(rcosmo)


### Name: summary.CMBDataFrame
### Title: Summarise a 'CMBDataFrame'
### Aliases: summary.CMBDataFrame

### ** Examples

## First download the map
# downloadCMBMap(foreground = "smica", nside = 1024)
# df <- CMBDataFrame("CMB_map_smica1024.fits")
# df.sample <- CMBDataFrame(df, sample.size = 800000)
# summary(df.sample)

ns <- 16
df <- CMBDataFrame(I = rnorm(12*ns^2), nside = ns,
                   ordering = "nested")

win1 <- CMBWindow(x=0,y=3/5,z=4/5,r=0.8)
df.sample1 <- window(df, new.window = win1)
summary(df)




