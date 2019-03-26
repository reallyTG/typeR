library(raptr)


### Name: print
### Title: Print objects
### Aliases: print print.AttributeSpace print.AttributeSpaces
###   print.GurobiOpts print.ManualOpts print.RapData print.RapReliableOpts
###   print.RapResults print.RapUnreliableOpts print.RapUnsolved
###   print.RapSolved

### ** Examples

# load data
data(sim_ru, sim_rs)

# print GurobiOpts object
print(GurobiOpts())

# print RapReliableOpts object
print(RapReliableOpts())

# print RapUnreliableOpts object
print(RapUnreliableOpts())

# print RapData object
print(sim_ru@data)

# print RapUnsolved object
print(sim_ru)

# print RapResults object
print(sim_rs@results)

# print RapSolved object
print(sim_rs)



