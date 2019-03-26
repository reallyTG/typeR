library(chicane)


### Name: test.enrichment
### Title: test.enrichment
### Aliases: test.enrichment

### ** Examples

## No test: 
data(bre80);
ctcf.bed <- system.file('extdata', 'T47D_chr2_CTCF.bed.gz', package = 'chicane');

results <- chicane(interactions = bre80);
test.enrichment(results, ctcf.bed, significance.cutoff = 0.25);
## End(No test)




