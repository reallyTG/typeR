library(iptools)


### Name: ip_in_any
### Title: check if IP address falls within any of the ranges specified
### Aliases: ip_in_any

### ** Examples

## Not run: 
##D north_america <- unlist(country_ranges(countries=c("US", "CA", "MX")))
##D germany <- unlist(country_ranges("DE"))
##D 
##D set.seed(1492)
##D targets <- ip_random(1000)
##D 
##D for_sure <- range_generate(sample(north_america, 1))
##D all(ip_in_any(for_sure, north_america)) # shld be TRUE
##D ## [1] TRUE
##D 
##D absolutely_not <- range_generate(sample(germany, 1))
##D any(ip_in_any(absolutely_not, north_america)) # shld be FALSE
##D ## [1] FALSE
##D 
##D who_knows_na <- ip_in_any(targets, north_america)
##D who_knows_de <- ip_in_any(targets, germany)
##D 
##D sum(who_knows_na)
##D ## [1] 464
##D 
##D sum(who_knows_de)
##D ## [1] 43
## End(Not run)



