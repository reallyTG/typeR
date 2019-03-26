library(aire.zmvm)


### Name: convert_to_imeca
### Title: Convert pollution values to IMECA
### Aliases: convert_to_imeca

### ** Examples

## IMECA is a dimensionless scale that allows for the comparison of
## different pollutants
convert_to_imeca(157, "O3")
convert_to_imeca(c(450, 350, 250), rep("NO2", 3))
## Since this is PM10 the 80 is supposed to be the 24 hour average
convert_to_imeca(80, "PM10")

## warning about recycling elements in a vector
convert_to_imeca(c(157, 200), "O3")

convert_to_imeca(67, "O3")
convert_to_imeca(77, "O3")
convert_to_imeca(205, "O3")
convert_to_imeca(72, "O3")
convert_to_imeca(98, "O3")




