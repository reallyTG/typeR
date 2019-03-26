library(mudata2)


### Name: biplot.mudata
### Title: Biplot a mudata object
### Aliases: biplot.mudata autobiplot.mudata

### ** Examples

kvtemp <- kentvillegreenwood %>% select_params(contains("temp"))

# use base plotting for regular biplot function
biplot(kvtemp)

# use ggplot and facet_grid to biplot
autobiplot(kvtemp, col = "location")




