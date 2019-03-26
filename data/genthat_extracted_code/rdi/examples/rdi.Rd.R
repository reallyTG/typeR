library(rdi)


### Name: rdi
### Title: Calculate RDI dissimilarity matrix
### Aliases: rdi

### ** Examples


#create genes
genes = sample(letters, 10000, replace=TRUE)

#create sequence annotations
seqAnnot = data.frame(donor = sample(1:4, 10000, replace=TRUE),
                      visit = sample(c("V1","V2","V3"), 10000, replace=TRUE),
                      cellType = sample(c("B","T"), 10000, replace=TRUE)
                     )
                     
#parameters
params = list(
  countParams = list(
    select = list(
      visit = c("V1","V3"),
      cellType = "B"
    ),
    combine = list(
      visit = "V[13]"
    ),
    simplifyNames = FALSE
  ),
  distParams = list(
    constScale=FALSE
  )
)

##calculate RDI
d = rdi(genes, seqAnnot, params)

##plot using hierarchical clustering
plot(hclust(d))




