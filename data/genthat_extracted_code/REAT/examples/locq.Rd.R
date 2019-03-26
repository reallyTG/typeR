library(REAT)


### Name: locq
### Title: Location quotient
### Aliases: locq

### ** Examples

# Example from Farhauer/Kroell (2013):
locq (1714, 79006, 879213, 15593224)
# returns the location quotient (0.3847623)

# Location quotients for Goettingen 2017:
data(Goettingen)
locq (Goettingen$Goettingen2017[2:16], Goettingen$Goettingen2017[1], 
Goettingen$BRD2017[2:16], Goettingen$BRD2017[1])



