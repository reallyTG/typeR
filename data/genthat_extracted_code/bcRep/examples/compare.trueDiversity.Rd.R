library(bcRep)


### Name: compare.trueDiversity
### Title: Compare richness or diversity of different samples
### Aliases: compare.trueDiversity plotCompareTrueDiversity

### ** Examples

data(aaseqtab)
data(aaseqtab2)

trueDiv.comp<-compare.trueDiversity(sequence.list = list(aaseqtab$CDR3_IMGT, 
     aaseqtab2$CDR3_IMGT), names = c("IndA", "IndB"), order = 1, nrCores = 1)
## Not run: 
##D plotCompareTrueDiversity(comp.tab = trueDiv.comp, PDF = "Example")
## End(Not run)



