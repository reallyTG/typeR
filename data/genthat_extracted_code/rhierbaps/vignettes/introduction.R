## ----global_options, include=FALSE---------------------------------------
knitr::opts_chunk$set(fig.width=12, fig.height=8,
                      echo=TRUE, warning=FALSE, message=FALSE,
                      tidy=TRUE)

## ------------------------------------------------------------------------
library(rhierbaps)
library(ggtree)
library(phytools)
library(ape)

set.seed(1234)

## ------------------------------------------------------------------------
fasta.file.name <- system.file("extdata", "seqs.fa", package = "rhierbaps")
snp.matrix <- load_fasta(fasta.file.name)

## ------------------------------------------------------------------------
data(woodmouse)
woodmouse.snp.matrix <- load_fasta(woodmouse)

## ------------------------------------------------------------------------
hb.results <- hierBAPS(snp.matrix, max.depth=2, n.pops=20, quiet = TRUE)
head(hb.results$partition.df)

## ---- eval=FALSE---------------------------------------------------------
#  hb.results <- hierBAPS(snp.matrix, max.depth=2, n.pops=20, n.extra.rounds = Inf,
#                         quiet = TRUE)

## ------------------------------------------------------------------------
system.time(hierBAPS(snp.matrix, max.depth=2, n.pops=20, quiet = TRUE))

## ------------------------------------------------------------------------
newick.file.name <- system.file("extdata", "seqs.fa.treefile", package = "rhierbaps")
iqtree <- phytools::read.newick(newick.file.name)

## ------------------------------------------------------------------------
gg <- ggtree(iqtree, layout="circular")
gg <- gg %<+% hb.results$partition.df
gg <- gg + geom_tippoint(aes(color=factor(`level 1`)))
gg

## ------------------------------------------------------------------------
gg <- ggtree(iqtree, layout="circular", branch.length = "none")
gg <- gg %<+% hb.results$partition.df
gg <- gg + geom_tippoint(aes(color=factor(`level 1`)))
gg <- gg + theme(legend.position="right")
gg <- gg + geom_tiplab(aes(label = `level 2`), size = 1, offset = 1)
gg

## ------------------------------------------------------------------------
plot_sub_cluster(hb.results, iqtree, level = 1, sub.cluster = 9)

## ------------------------------------------------------------------------
hb.results$lml.list

## ------------------------------------------------------------------------
hb.results.woodmouse <- hierBAPS(woodmouse.snp.matrix, max.depth=2, n.extra.rounds = Inf,
                                 quiet = TRUE, assignment.probs = TRUE)
head(hb.results.woodmouse$cluster.assignment.prob[[1]])

## ---- eval=FALSE---------------------------------------------------------
#  write.csv(hb.results$partition.df, file=file.path(tempdir(), "hierbaps_partition.csv"),
#            col.names = TRUE, row.names = FALSE)
#  
#  save_lml_logs(hb.results,  file.path(tempdir(), "hierbaps_logML.txt"))

## ------------------------------------------------------------------------
sessionInfo()

