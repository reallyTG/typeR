library(medfate)


### Name: soil
### Title: Soil initialization
### Aliases: soil print.soil

### ** Examples

# Initializes soil
s = soil(defaultSoilParams())

# Prints soil characteristics according to Saxton's water retention curve
print(s, model="SX")

# Prints soil characteristics according to Van Genuchten's water retention curve
print(s, model="VG")




