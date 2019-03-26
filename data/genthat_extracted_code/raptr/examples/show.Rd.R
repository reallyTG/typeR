library(raptr)


### Name: show
### Title: Show objects
### Aliases: show show,GurobiOpts-method show,ManualOpts-method
###   show,RapData-method show,RapReliableOpts-method
###   show,RapResults-method show,RapUnreliableOpts-method
###   show,RapUnsolved-method show,RapSolved-method

### ** Examples

# load data
data(sim_ru, sim_rs)

# show GurobiOpts object
GurobiOpts()

# show RapReliableOpts object
RapReliableOpts()

# show RapUnreliableOpts object
RapUnreliableOpts()

# show RapData object
sim_ru@data

# show RapUnsolved object
sim_ru

# show RapResults object
sim_rs@results

# show RapSolved object
sim_rs



