library(sperrorest)


### Name: partition_tiles
### Title: Partition the study area into rectangular tiles
### Aliases: partition_tiles

### ** Examples

data(ecuador)
parti <- partition_tiles(ecuador, nsplit = c(4, 3), reassign = FALSE)
# plot(parti,ecuador)
summary(parti) # tile A4 has only 55 samples
# same partitioning, but now merge tiles with less than 100 samples to
# adjacent tiles:
parti2 <- partition_tiles(ecuador, nsplit = c(4,3), reassign = TRUE,
min_n = 100)
# plot(parti2,ecuador)
summary(parti2)
# tile B4 (in 'parti') was smaller than A3, therefore A4 was merged with B4,
# not with A3
# now with random rotation and offset, and tiles of 2000 m length:
parti3 <- partition_tiles(ecuador, dsplit = 2000, offset = 'random',
rotation = 'random', reassign = TRUE, min_n = 100)
# plot(parti3, ecuador)
summary(parti3)



