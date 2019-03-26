library(envirem)


### Name: embergerQ
### Title: Emberger's pluviometric quotient
### Aliases: embergerQ

### ** Examples

# Find example rasters
rasterFiles <- list.files(system.file('extdata', package='envirem'), full.names=TRUE)
env <- stack(rasterFiles)

embergerQ(env[['bio_12']], env[['bio_5']], env[['bio_6']], tempScale = 10)



