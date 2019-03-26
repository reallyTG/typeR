library(acs)


### Name: geo.make
### Title: Create a new geo.set object for use with the acs package.
### Aliases: geo.make

### ** Examples


# some single-state geo.sets
washington=geo.make(state=53)
alabama=geo.make(state="Alab")

# a county match
yakima=geo.make(state="WA", county="Yakima")
yakima

# a multiple-county geo.set
psrc=geo.make(state="WA", county=c(33,35,53,61))
psrc

# combine geo.sets
north.mercer.island=geo.make(state=53, county=33, tract=c(24300,24400))
optional.tract=geo.make(state=53, county=33, tract=24500)
# add in one more tract to create new, larger geo
north.mercer.island.plus=north.mercer.island + optional.tract

# using wildcards

# all unified school districts in Kansas
geo.make(state="KS", school.district.unified="*")

# all state house districts in Alaska
geo.make(state="AK", state.legislative.district.lower="*")

# all tracts in Kings County, NY
geo.make(state="NY", county="King", tract="*")




