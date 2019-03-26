library(helminthR)


### Name: findHost
### Title: Find parasite occurrence data for given host.
### Aliases: findHost

### ** Examples


## No test: 
gorillaParasites <- helminthR::findHost("Gorilla", "gorilla")
## End(No test)

# An example of how to query multiple hosts when you have a 
# vector of host species names

hosts <- c("Gorilla gorilla", "Peromyscus leucopus")
## No test: 
plyr::ldply(hosts, function(x)
    {helminthR::findHost(unlist(strsplit(x, " "))[1], unlist(strsplit(x," "))[2])})
## End(No test)




