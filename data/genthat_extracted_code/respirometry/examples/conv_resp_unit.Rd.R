library(respirometry)


### Name: conv_resp_unit
### Title: Convert units related to respirometry
### Aliases: conv_resp_unit

### ** Examples

# I read that an animal's MO2 is 1.92 ml O2/kg/min. What is this MO2 in umol O2/g/h?
conv_resp_unit(value = 1.92, from = "ml_O2 / kg / min", to = "umol_O2 / g / hr")

# Krogh's diffusion coefficient for oxygen through gills can be expressed as ml O2 / mm2 (gill
# surface area) / um (gill thickness) / torr (seawater pO2 - blood pO2) / minute at a given
# temperature.
# To convert to another unit:
conv_resp_unit(value = 1e-6, from = "ml_O2 / mm2 / um / torr / min",
to = "umol_O2 / cm2 / um / kPa / hr", temp = 20)

# Now, with a knowledge of gill morphometrics, seawater pO2, and blood pO2, I can compare
# gill diffusion with whole animal MO2.




