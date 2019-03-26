library(clue)


### Name: cl_pam
### Title: K-Medoids Partitions of Clusterings
### Aliases: cl_pam
### Keywords: cluster

### ** Examples

data("Kinship82")
party <- cl_pam(Kinship82, 3, "symdiff")
## Compare results with tables 5 and 6 in Gordon & Vichi (1998).
party
lapply(cl_prototypes(party), cl_classes)
table(cl_class_ids(party))



