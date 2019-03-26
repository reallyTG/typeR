library(nlgeocoder)


### Name: nl_geocode
### Title: Geocode adresses
### Aliases: nl_geocode nl_geocode_rd nl_geocode_df

### ** Examples

data("addresses")

r <- nl_geocode(addresses$Address)
r["weergavenaam"]
names(r)



