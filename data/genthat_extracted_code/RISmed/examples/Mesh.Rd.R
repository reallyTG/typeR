library(RISmed)


### Name: Mesh
### Title: Extracts 'Mesh' headings from 'Medline' object.
### Aliases: Mesh

### ** Examples

res <- EUtilsSummary("myeloma[MeSh]",retmax=2,reldate=365)
summary(res)
fetch <- EUtilsGet(res)

Mesh(fetch)



