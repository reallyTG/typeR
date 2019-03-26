library(sdmpredictors)


### Name: layer_citations
### Title: Generate citations for all layers
### Aliases: layer_citations

### ** Examples

# print the citation for the Bio-ORACLE salinity layer
print(layer_citations("BO_salinity"))

# print the citation for a MARSPEC paleo layer
print(layer_citations("MS_biogeo02_aspect_NS_21kya"))

# print all citations as Bibtex
print(lapply(layer_citations(astext = FALSE), toBibtex))



