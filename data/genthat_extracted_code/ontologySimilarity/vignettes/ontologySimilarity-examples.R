## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(dev="svg", fig.width=7, fig.height=5, fig.align="center", dev="svg")

## ------------------------------------------------------------------------
library(ontologyIndex)
library(ontologySimilarity)
data(hpo)
set.seed(1)

information_content <- descendants_IC(hpo)

term_sets <- replicate(simplify=FALSE, n=7, expr=minimal_set(hpo, sample(hpo$id, size=8)))

sim_mat <- get_sim_grid(ontology=hpo, term_sets=term_sets)
sim_mat

## ------------------------------------------------------------------------
dist_mat <- max(sim_mat) - sim_mat
plot(hclust(as.dist(dist_mat)))

## ------------------------------------------------------------------------
collection <- replicate(simplify=FALSE, n=100, expr=minimal_set(hpo, sample(hpo$id, size=8)))

#lets measure the group similarity of objects 1-10
group <- 1:10

get_sim_p_from_ontology(
	ontology=hpo, 
	information_content=information_content,
	term_sets=collection,
	group=group)

sim_mat <- get_sim_grid(ontology=hpo, term_sets=collection)

#p-value by "matrix" method
get_sim_p(
	sim_mat,
	group=group)


## ------------------------------------------------------------------------
data(go)

genes <- replicate(simplify=FALSE, n=100, expr=minimal_set(go, sample(go$id, size=8)))
names(genes) <- paste("gene", 1:length(genes))
genes[1:3]

go_profile <- as.character(go$id[grep(x=go$name, pattern="golgi apparatus", ignore.case=TRUE)])
go$name[go_profile]

profile_sims <- get_profile_sims(ontology=go, term_sets=genes, profile=go_profile)
profile_sims

#Note that you can pass character vectors to get_sim_p
get_sim_p(profile_sims, c("gene 1", "gene 2", "gene 3"))

## ------------------------------------------------------------------------
group_sim <- get_sim(sim_mat, group=group)

samples <- sample_group_sim(sim_mat, group_size=length(group))
hist(samples)
abline(v=group_sim, col="red")

