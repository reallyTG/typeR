library(naniar)


### Name: is_shade
### Title: Detect if this is a shade
### Aliases: is_shade are_shade any_shade

### ** Examples


xs <- shade(c(NA, 1, 2, "3"))

is_shade(xs)
are_shade(xs)
any_shade(xs)

aq_s <- as_shadow(airquality)

is_shade(aq_s)
are_shade(aq_s)
any_shade(aq_s)
any_shade(airquality)





