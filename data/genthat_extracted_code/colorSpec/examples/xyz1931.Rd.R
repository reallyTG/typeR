library(colorSpec)


### Name: xyz1931
### Title: CIE Color Matching Functions - 2-degree (1931)
### Aliases: xyz1931.1nm xyz1931.5nm xyz1931
### Keywords: datasets eyes

### ** Examples

summary(xyz1931.1nm)
white.point = product( D65.1nm, xyz1931.1nm, wave='auto' )



