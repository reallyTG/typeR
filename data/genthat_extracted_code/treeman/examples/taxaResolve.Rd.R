library(treeman)


### Name: taxaResolve
### Title: Resolve taxonmic names online
### Aliases: taxaResolve

### ** Examples

my_lovely_names <- c ('Gallus gallus', 'Pongo pingu', 'Homo sapiens',
                      'Arabidopsis thaliana', 'Macaca thibetana', 'Bacillus subtilis')
res <- taxaResolve (nms=my_lovely_names)
length(colnames(res))  # 10 different metadata for returned names including original search name
# let's look at the lineages
lineages <- strsplit(as.vector(res$lineage), '\\|')
print(lineages[[6]])  # the bacteria has far fewer taxonomic levels



