library(mosaic)


### Name: value
### Title: Extract value from an object
### Aliases: value value.integrate value.default

### ** Examples

integrate(sin, 0, 1) %>% value()
nlm(cos, p = 0) %>% value()
uniroot(cos, c(0, 2)) %>% value()



