library(epiphy)


### Name: power_law
### Title: Taylor's and binary power laws.
### Aliases: power_law

### ** Examples

require(magrittr)
my_data <- do.call(c, lapply(citrus_ctv, function(citrus_field) {
   incidence(citrus_field) %>%
       clump(unit_size = c(x = 3, y = 3)) %>%
       split(by = "t")
}))
# my_data is a list of incidence object, each one corresponding to a given
# time at a given location.
my_power_law <- power_law(my_data)
my_power_law
summary(my_power_law)
plot(my_power_law) # Same as: plot(my_power_law, scale = "log")
plot(my_power_law, scale = "lin")




