library(ss3sim)


### Name: case_comp
### Title: Write a case file for length- or age-composition data
### Aliases: case_comp

### ** Examples

case_comp(fleets = 1:2, case = 30, spp = "cod",
  Nsamp = list(rep(10, 40), rep(10, 25)),
  years = list(61:100, 76:100), cpar = 2:1, type = "agecomp")
done <- file.remove("agecomp30-cod.txt")



