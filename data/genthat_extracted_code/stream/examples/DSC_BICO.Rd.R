library(stream)


### Name: DSC_BICO
### Title: BICO - Fast computation of k-means coresets in a data stream
### Aliases: DSC_BICO BICO bico

### ** Examples

stream <- DSD_Gaussians(k = 3, d = 2)

BICO <- DSC_BICO(k = 3, p = 10, space = 100, iterations = 10)
update(BICO, stream, n = 500)

plot(BICO,stream, type = "both")



