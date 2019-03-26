library(biotic)


### Name: calcindex
### Title: Calculate biotic indices for invertebrate samples
### Aliases: calcindex

### ** Examples

# use the built-in River Almond dataset, numeric abundances

# calculate the BMWP index for this dataset
# 'index' and 'type' do not have to specified as defaults are used
# ("BMWP" and "num")

calcindex(almond)

# calculate the PSI index for this dataset
# type does not have to specified as default is used ("num")

calcindex(almond, "PSI")

# calculate the WHPT abundance-weighted index for this dataset

calcindex(almond, "WHPT_AB")

# example of processing data in alphabetic log abundance categories
# using the 'type' argument

# 'braidburn' dataset contains alphabetic log category data
# see ?braidburn for details

# calculate the Whalley revised BMWP index (including N-taxa and ASPT)

calcindex(braidburn, "Whalley", "alpha")

# example of processing data in numeric log abundance categories
# using the 'type' argument

# 'greenburn' dataset contains numeric log category data
# see ?greenburn for details

# calculate the LIFE index for this dataset

calcindex(greenburn, "LIFE", "log")




