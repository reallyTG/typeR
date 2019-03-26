library(RJaCGH)


### Name: genomePlot
### Title: Plot of the genome with probabilities of alteration.
### Aliases: genomePlot
### Keywords: models

### ** Examples

## Not run: 
##D data(snijders)
##D y <- gm13330$LogRatio[!is.na(gm13330$LogRatio)]
##D Pos <- gm13330$PosBase[!is.na(gm13330$LogRatio)]
##D Chrom <- gm13330$Chromosome[!is.na(gm13330$LogRatio)]
##D 
##D ## Sort positions
##D 
##D for (i in unique(Chrom)) {
##D if(any(diff(Pos[Chrom==i]) < 0)) {
##D id <- order(Pos[Chrom==i])
##D y[Chrom==i] <- y[Chrom==i][id]
##D Pos[Chrom==i] <- Pos[Chrom==i][id]
##D }
##D }
##D 
##D jp <- list(sigma.tau.mu=rep(0.05, 4), sigma.tau.sigma.2=rep(0.03, 4),
##D            sigma.tau.beta=rep(0.07, 4), tau.split.mu=0.1, tau.split.beta=0.1)
##D fit.genome <- RJaCGH(y=y, Pos=Pos, Chrom=Chrom, model="Genome",
##D burnin=1000, TOT=1000, jump.parameters=jp, k.max = 4)
##D genomePlot(fit.genome)
##D genomePlot(fit.genome, col=c(3, 1, 2), breakpoints=c(-0.5, 0.5))
## End(Not run)



