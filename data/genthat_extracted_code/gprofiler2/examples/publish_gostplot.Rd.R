library(gprofiler2)


### Name: publish_gostplot
### Title: Create and save an annotated Manhattan plot of enrichment
###   results.
### Aliases: publish_gostplot

### ** Examples

 gostres <- gost(c("Klf4", "Pax5", "Sox2", "Nanog"), organism = "mmusculus")
 p <- gostplot(gostres, interactive = FALSE)
 publish_gostplot(p, highlight_terms = c("GO:0001010", "WP:WP1763"))



