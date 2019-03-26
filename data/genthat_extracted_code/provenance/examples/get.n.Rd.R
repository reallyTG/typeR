library(provenance)


### Name: get.n
### Title: Calculate the number of grains required to achieve a desired
###   level of sampling resolution
### Aliases: get.n

### ** Examples

# number of grains required to be 99% that no fraction greater than 5% was missed:
print(get.n(0.01))
# number of grains required to be 90% that no fraction greater than 10% was missed:
print(get.n(p=0.1,f=0.1))



