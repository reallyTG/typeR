library(acs)


### Name: flatten.geo.set
### Title: Convenience function to "flatten" a nested geo.set object.
### Aliases: flatten.geo.set

### ** Examples


# a multiple-county geo.set
psrc=geo.make(state="WA", county=c(33,35,53,61))

# combine geo.sets
north.mercer.island=geo.make(state=53, county=33, tract=c(24300,24400))
optional.tract=geo.make(state=53, county=33, tract=24500)
# add in one more tract to create new, larger geo
north.mercer.island.plus=north.mercer.island + optional.tract

# created a nested geo.set
 my.nested.geo.set=c(north.mercer.island.plus, psrc)
str(my.nested.geo.set)
length(my.nested.geo.set)

# .. and flatten in out
#    note difference in structure and length
my.flat.geo.set=flatten.geo.set(my.nested.geo.set)
str(my.flat.geo.set)
length(my.flat.geo.set)



