library(munsell)


### Name: mnsl
### Title: Converts a Munsell colour to hex
### Aliases: mnsl mnsl2hex

### ** Examples

mnsl2hex("5PB 5/10")
# use a munsell colour in a plot
plot.new()
rect(0, 0, 1 ,1 , col = mnsl("5R 5/10"))



