library(tcgsaseq)


### Name: dsFDR
### Title: Estimating the False Discovery Rate
### Aliases: dsFDR

### ** Examples

## Not run: 
##D #rm(list=ls())
##D G <- 1000
##D nperm <- 500
##D G1 <- 0.3*G
##D G0 <- G-G1
##D gene_scores_perm <- matrix(rchisq(G*nperm, df=1), ncol=nperm, nrow=G)
##D gene_scores_obs <- c(rchisq(G1, df=1), rchisq(G0, df=1))
##D 
##D qvals <- dsFDR(gene_scores_perm, gene_scores_obs, use_median = FALSE, doPlot = TRUE)
##D summary(qvals)
##D 
##D qvals <- qvals[!is.na(qvals)]
##D eFDR_5pct <- sum(qvals[-(1:G1)]<0.05)/sum(qvals < 0.05)
##D eTDR_5pct <- sum(qvals[1:G1]<0.05)/sum(qvals < 0.05)
##D cat("FDR:", eFDR_5pct, " TDR:", eTDR_5pct, "\n")
##D plot(y = sapply(seq(0, 1, by=0.001), function(x){sum(qvals[-(1:G1)] < x)/sum(qvals < x)}),
##D     x = seq(0, 1, by=0.001),
##D     type = "l", xlab = "Nominal FDR level", ylab = "Empirical FDR", col = "red", lwd = 2,
##D     ylim = c(0,1))
##D abline(a = 0, b = 1, lty = 2)
##D 
##D res <- list()
##D G <- 1000
##D nperm <- 1000
##D G1 <- 0.3*G
##D G0 <- G-G1
##D for(i in 1:100){
##D cat(i, "/100\n", sep="")
##D gene_scores_obs <- c(rchisq(G1, df=1), rchisq(G0, df=1))
##D gene_scores_perm <- matrix(rchisq(G*nperm, df=1), ncol=nperm, nrow=G)
##D qvals <- dsFDR(gene_scores_perm, gene_scores_obs, use_median = TRUE, doPlot = FALSE)
##D res[[i]] <- sapply(seq(0, 1, by=0.01), function(x){sum(qvals < x)})
##D }
## End(Not run)



