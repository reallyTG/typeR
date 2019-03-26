library(naniar)


### Name: shadow_long
### Title: Reshape shadow data into a long format
### Aliases: shadow_long

### ** Examples


aq_shadow <- bind_shadow(airquality)

shadow_long(aq_shadow)

# then filter only on Ozone
shadow_long(aq_shadow, Ozone)

shadow_long(aq_shadow, Ozone, Solar.R)





