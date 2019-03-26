library(REAT)


### Name: williamson
### Title: Williamson index
### Aliases: williamson

### ** Examples

data(GoettingenHealth2)
# districts with healthcare providers and population size

williamson((GoettingenHealth2$phys_gen/GoettingenHealth2$pop), 
GoettingenHealth2$pop)



