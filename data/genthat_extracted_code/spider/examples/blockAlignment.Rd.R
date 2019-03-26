library(spider)


### Name: blockAlignment
### Title: Make all sequences the same length
### Aliases: blockAlignment
### Keywords: Data Protocol Quality

### ** Examples


data(salticidae)
salticidae
blockAlignment(salticidae)
blockAlignment(salticidae, mode = "longest")
blockAlignment(salticidae, mode = NULL, range = c(200, 600))

graphics::image(blockAlignment(salticidae))
graphics::image(blockAlignment(salticidae, mode = "longest"))
graphics::image(blockAlignment(salticidae, mode = NULL, range = c(200, 600)))




