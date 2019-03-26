library(marelac)


### Name: convert_T
### Title: Conversion Between Different Temperature Units
### Aliases: convert_T
### Keywords: misc

### ** Examples

convert_T(0, "K")
convert_T(0, "C")
convert_T(0, "F")

convert_T(273.15, "K")
convert_T(-273.15, "C")
convert_T(c(-459.67, 0, 32), "F")

convert_T(32, "F")$C # 0 degrees C




