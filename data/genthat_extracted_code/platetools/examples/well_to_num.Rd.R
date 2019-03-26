library(platetools)


### Name: well_to_num
### Title: Converts well labels to numbers
### Aliases: well_to_num

### ** Examples

well_to_num("A01")

well_to_num("P12", plate = 384)

well_to_num("P12", plate = 384, style = "snake")

wells <- c("A01", "A02", "A03")
well_to_num(wells)



