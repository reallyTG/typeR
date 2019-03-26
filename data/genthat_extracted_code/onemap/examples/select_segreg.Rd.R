library(onemap)


### Name: select_segreg
### Title: Show markers with/without segregation distortion
### Aliases: select_segreg

### ** Examples

# Loads a fake backcross dataset installed with onemap
data(mapmaker_example_bc)
# Performs the chi-square test for all markers
Chi <- test_segregation(mapmaker_example_bc)
# To show non-distorted markers
select_segreg(Chi)
# To show markers with segregation distortion
select_segreg(Chi, distorted=TRUE)
# To show the numbers of the markers with segregation distortion
select_segreg(Chi, distorted=TRUE, numbers=TRUE)




