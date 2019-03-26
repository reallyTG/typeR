library(ACSNMineR)


### Name: represent_enrichment
### Title: Graphic representation of enrichment
### Aliases: represent_enrichment

### ** Examples

represent_enrichment(enrichment = enrichment_test,scale = "reverselog",
                    sample_name = "test",plot = "bar")

represent_enrichment(enrichment = list(SampleA = enrichment_test, 
                                     SampleB = enrichment_test[1:3,]), 
                     plot = "heatmap", scale = "log")



