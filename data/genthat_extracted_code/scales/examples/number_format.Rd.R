library(scales)


### Name: number_format
### Title: Number formatters
### Aliases: number_format number comma_format comma percent_format percent
###   unit_format

### ** Examples

# number()
v <- c(12.3, 4, 12345.789, 0.0002)
number(v)
number(v, big.mark = ",")
number(v, accuracy = .001)
number(v, accuracy = .001, decimal.mark = ",")
number(v, accuracy = .5)

# number_format()
my_format <- number_format(big.mark = "'", decimal.mark = ",")
my_format(v)

# comma() and comma_format()
comma_format()(c(1, 1e3, 2000, 1e6))
comma_format(accuracy = .01)(c(1, 1e3, 2000, 1e6))
comma(c(1, 1e3, 2000, 1e6))

# percent() and percent_format()
percent_format()(runif(10))
percent(runif(10))

per_mille <- percent_format(
  scale = 1000,
  suffix = "\u2030",
  accuracy = .1
)
per_mille(.1234)

french_percent <- percent_format(
  decimal.mark = ",",
  suffix = " %"
)
french_percent(runif(10))

# unit_format()
# labels in kilometer when the raw data are in meter
km <- unit_format(unit = "km", scale = 1e-3, digits = 2)
km(runif(10) * 1e3)

# labels in hectares, raw data in square meters
ha <- unit_format(unit = "ha", scale = 1e-4)
km(runif(10) * 1e5)




