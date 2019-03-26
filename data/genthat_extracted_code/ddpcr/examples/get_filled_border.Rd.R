library(ddpcr)


### Name: get_filled_border
### Title: Get border of filled droplets in PNPP experiment
### Aliases: get_filled_border
### Keywords: internal

### ** Examples

file <- system.file("sample_data", "small", "analyzed_pnpp.rds", package = "ddpcr")
plate <- load_plate(file)
get_filled_border(plate, "A05")
get_filled_border(plate, "F05")



