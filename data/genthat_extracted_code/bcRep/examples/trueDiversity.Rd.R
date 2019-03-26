library(bcRep)


### Name: trueDiversity
### Title: True diversity of sequences
### Aliases: trueDiversity plotTrueDiversity
### Keywords: multivariate

### ** Examples

data(aaseqtab)
trueDiv<-trueDiversity(sequences = aaseqtab$CDR3_IMGT, order = 1)
## Not run: plotTrueDiversity(trueDiversity.tab=trueDiv,color="red", PDF="Example")



