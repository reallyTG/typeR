library(raptr)


### Name: make.RapData
### Title: Make data for RAP using minimal inputs
### Aliases: make.RapData

### ** Examples

# load data
data(cs_pus, cs_spp, cs_space)
## No test: 
# make RapData object using the first 10 planning units in the dat
x <- make.RapData(cs_pus[1:10,], cs_spp, cs_space,
                  include.geographic.space = TRUE)
# print object
print(x)
## End(No test)




