library(selectMeta)


### Name: DearBegg
### Title: Compute the nonparametric weight function from Dear and Begg
###   (1992)
### Aliases: DearBegg DearBeggMonotone DearBeggLoglik DearBeggToMinimize
###   Hij
### Keywords: nonparametric

### ** Examples

## Not run: 
##D ##------------------------------------------
##D ## Analysis of Hedges & Olkin dataset
##D ## re-analyzed in Iyengar & Greenhouse, Dear & Begg
##D ##------------------------------------------
##D data(education)
##D t  <- education$t
##D q  <- education$q
##D N  <- education$N
##D y  <- education$theta 
##D u  <- sqrt(2 / N)
##D n  <- length(y)
##D k  <- 1 + floor(n / 2)
##D lam1 <- 2
##D 
##D ## compute p-values
##D p <- 2 * pnorm(-abs(t))
##D 
##D 
##D ##------------------------------------------
##D ## compute all weight functions available
##D ## in this package
##D ##------------------------------------------
##D 
##D ## weight functions from Iyengar & Greenhouse (1988)
##D res1 <- IyenGreenMLE(t, q, N, type = 1)
##D res2 <- IyenGreenMLE(t, q, N, type = 2)
##D 
##D ## weight function from Dear & Begg (1992)
##D res3 <- DearBegg(y, u, lam = lam1)
##D 
##D ## monotone version of Dear & Begg, as introduced in Rufibach (2011)
##D set.seed(1977)
##D res4 <- DearBeggMonotone(y, u, lam = lam1, maxiter = 1000, CR = 1)
##D 
##D ## plot
##D plot(0, 0, type = "n", xlim = c(0, 1), ylim = c(0, 1), xlab = "p-values", 
##D     ylab = "estimated weight function")
##D ps <- seq(0, 1, by = 0.01)
##D rug(p, lwd = 3)
##D lines(ps, IyenGreenWeight(-qnorm(ps / 2), b = res1$beta, q = 50, 
##D     type = 1, alpha = 0.05), lwd = 3, col = 2)
##D lines(ps, IyenGreenWeight(-qnorm(ps / 2), b = res2$beta, q = 50, 
##D     type = 2, alpha = 0.05), lwd = 3, col = 4)
##D weightLine(p, w = res3$w, col0 = 3, lwd0 = 3, lty0 = 2)  
##D weightLine(p, w = res4$w, col0 = 6, lwd0 = 2, lty0 = 1)  
##D 
##D legend("topright", c(expression("Iyengar & Greenhouse (1988) w"[1]), 
##D     expression("Iyengar & Greenhouse (1988) w"[2]), "Dear and Begg (1992)", 
##D     "Rufibach (2011)"), col = c(2, 4, 3, 6), lty = c(1, 1, 2, 1), 
##D     lwd = c(3, 3, 3, 2), bty = "n")
##D 
##D ## compute selection bias
##D eta <- sqrt(res4$sigma ^ 2 + res4$u ^ 2)
##D bias <- effectBias(res4$y, res4$u, res4$w, res4$theta, eta)
##D bias
##D 
##D 
##D ##------------------------------------------
##D ## Compute p-value to assess null hypothesis of no selection,
##D ## as described in Rufibach (2011, Section 6)
##D ## We use the package 'meta' to compute initial estimates for
##D ## theta and sigma
##D ##------------------------------------------
##D library(meta)
##D 
##D ## compute null parameters
##D meta.edu <- metagen(TE = y, seTE = u, sm = "MD", level = 0.95, 
##D     comb.fixed = TRUE, comb.random = TRUE)
##D theta0 <- meta.edu$TE.random
##D sigma0 <- meta.edu$tau
##D 
##D M <- 1000
##D res <- DearBeggMonotonePvalSelection(y, u, theta0, sigma0, lam = lam1, 
##D     M = M, maxiter = 1000)
##D 
##D ## plot all the computed monotone functions
##D plot(0, 0, xlim = c(0, 1), ylim = c(0, 1), type = "n", xlab = "p-values", 
##D     ylab = expression(w(p)))
##D abline(v = 0.05, lty = 3)
##D for (i in 1:M){weightLine(p, w = res$res.mono[1:k, i], col0 = grey(0.8), 
##D     lwd0 = 1, lty0 = 1)}
##D rug(p, lwd = 2)
##D weightLine(p, w = res$mono0, col0 = 2, lwd0 = 1, lty0 = 1)  
##D 
##D 
##D ## =======================================================================
##D 
##D 
##D ##------------------------------------------
##D ## Analysis second-hand tobacco smoke dataset
##D ## Rothstein et al (2005), Publication Bias in Meta-Analysis, Appendix A
##D ##------------------------------------------
##D data(passive_smoking)
##D u <- passive_smoking$selnRR
##D y <- passive_smoking$lnRR
##D n <- length(y)
##D k <- 1 + floor(n / 2)
##D lam1 <- 2
##D 
##D res2 <- DearBegg(y, u, lam = lam1)
##D set.seed(1)
##D res3 <- DearBeggMonotone(y = y, u = u, lam = lam1, maxiter = 2000, CR = 1)
##D 
##D plot(0, 0, type = "n", xlim = c(0, 1), ylim = c(0, 1), pch = 19, col = 1, 
##D     xlab = "p-values", ylab = "estimated weight function")
##D weightLine(rev(sort(res2$p)), w = res2$w, col0 = 2, lwd0 = 3, lty0 = 2)  
##D weightLine(rev(sort(res3$p)), w = res3$w, col0 = 4, lwd0 = 2, lty0 = 1)  
##D 
##D legend("bottomright", c("Dear and Begg (1992)", "Rufibach (2011)"), col = 
##D     c(2, 4), lty = c(2, 1), lwd = c(3, 2), bty = "n")
##D     
##D ## compute selection bias
##D eta <- sqrt(res3$sigma ^ 2 + res3$u ^ 2)
##D bias <- effectBias(res3$y, res3$u, res3$w, res3$theta, eta)
##D bias  
##D 
##D 
##D ##------------------------------------------
##D ## Compute p-value to assess null hypothesis of no selection
##D ##------------------------------------------
##D ## compute null parameters
##D meta.toba <- metagen(TE = y, seTE = u, sm = "MD", level = 0.95, 
##D     comb.fixed = TRUE, comb.random = TRUE)
##D theta0 <- meta.toba$TE.random
##D sigma0 <- meta.toba$tau
##D 
##D M <- 1000
##D res <- DearBeggMonotonePvalSelection(y, u, theta0, sigma0, lam = lam1, 
##D     M = M, maxiter = 2000)
##D 
##D ## plot all the computed monotone functions
##D plot(0, 0, xlim = c(0, 1), ylim = c(0, 1), type = "n", xlab = "p-values", 
##D     ylab = expression(w(p)))
##D abline(v = 0.05, lty = 3)
##D for (i in 1:M){weightLine(p, w = res$res.mono[1:k, i], col0 = grey(0.8), 
##D     lwd0 = 1, lty0 = 1)}
##D rug(p, lwd = 2)
##D weightLine(p, w = res$mono0, col0 = 2, lwd0 = 1, lty0 = 1)
## End(Not run)



