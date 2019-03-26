library(cheddar)


### Name: Omnivory
### Title: Omnivory
### Aliases: IsOmnivore Omnivores FractionOmnivorous Omnivory
### Keywords: utilities

### ** Examples

data(TL84)

IsOmnivore(TL84)
Omnivores(TL84)
Omnivory(TL84)

# Omnivory values found using PreyAveragedTrophicLevel and 
# ChainAveragedTrophicLevel differ for ChesapeakeBay
data(ChesapeakeBay)
Omnivory(ChesapeakeBay)
Omnivory(ChesapeakeBay, level=ChainAveragedTrophicLevel)



