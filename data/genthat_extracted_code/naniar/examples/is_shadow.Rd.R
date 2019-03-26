library(naniar)


### Name: is_shadow
### Title: Test if input is or are shadow variables
### Aliases: is_shadow is_nabular

### ** Examples


aq_sh <- as_shadow(airquality)
aq_bind <- bind_shadow(airquality)

is_shadow(aq_sh)
is_shadow(airquality)
is_shadow(aq_bind)
is_nabular(aq_bind)




