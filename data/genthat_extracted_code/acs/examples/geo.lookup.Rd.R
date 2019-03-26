library(acs)


### Name: geo.lookup
### Title: Search Census geographies
### Aliases: geo.lookup

### ** Examples

geo.lookup(state="WA", county="Ska", county.subdivision="oo")
geo.lookup(state="WA", county="Kit", place="Ra")

# find all counties in WA or OR with capital M or B in name
geo.lookup(state=c("WA", "OR"), county=c("M","B"))

# find all unified school districts in Kansas with "Ma" in name
geo.lookup(state="KS", school.district.unified="Ma")

# find all american indian areas with "Hop" in name
geo.lookup(american.indian.area="Hop")



