library(vcd)


### Name: Arthritis
### Title: Arthritis Treatment Data
### Aliases: Arthritis
### Keywords: datasets

### ** Examples

data("Arthritis")
art <- xtabs(~ Treatment + Improved, data = Arthritis, subset = Sex == "Female")
art

mosaic(art, gp = shading_Friendly)
mosaic(art, gp = shading_max)



