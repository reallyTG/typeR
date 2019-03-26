library(netmeta)


### Name: treats
### Title: Abbreviate treatment names
### Aliases: treats

### ** Examples

data(Senn2013)
#
net1 <- netmeta(TE, seTE, treat1, treat2,
                studlab, data=Senn2013)

# Use matrix with fixed effect treatment estimates to create unique
# treatment names
#
# Four characters
#
treats(net1$TE.fixed, nchar.trts = 4)

# Two characters
#
treats(net1$TE.fixed, nchar.trts = 2)

# One character
#
treats(net1$TE.fixed, nchar.trts = 1)



