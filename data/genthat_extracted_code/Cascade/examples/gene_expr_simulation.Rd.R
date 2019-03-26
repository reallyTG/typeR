library(Cascade)


### Name: gene_expr_simulation
### Title: Simulates microarray data based on a given network.
### Aliases: gene_expr_simulation gene_expr_simulation-methods
###   gene_expr_simulation,network-method

### ** Examples

data(simul)
set.seed(1)

#We simulate gene expression according to the network Net
Msim<-gene_expr_simulation(
	network=Net,
	time_label=rep(1:4,each=25),
	subject=5,
	level_peak=200)
head(Msim)



