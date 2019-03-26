library(VGAM)


### Name: lvplot.qrrvglm
### Title: Latent Variable Plot for QO models
### Aliases: lvplot.qrrvglm
### Keywords: models regression graphs

### ** Examples

set.seed(123); nn <- 200
cdata <- data.frame(x2 = rnorm(nn),  # Has mean 0 (needed when I.tol=TRUE)
                    x3 = rnorm(nn),  # Has mean 0 (needed when I.tol=TRUE)
                    x4 = rnorm(nn))  # Has mean 0 (needed when I.tol=TRUE)
cdata <- transform(cdata, latvar1 =  x2 + x3 - 2*x4,
                          latvar2 = -x2 + x3 + 0*x4)
# Nb. latvar2 is weakly correlated with latvar1
cdata <- transform(cdata,
            lambda1 = exp(6 - 0.5 * (latvar1-0)^2 - 0.5 * (latvar2-0)^2),
            lambda2 = exp(5 - 0.5 * (latvar1-1)^2 - 0.5 * (latvar2-1)^2),
            lambda3 = exp(5 - 0.5 * (latvar1+2)^2 - 0.5 * (latvar2-0)^2))
cdata <- transform(cdata,
            spp1 = rpois(nn, lambda1),
            spp2 = rpois(nn, lambda2),
            spp3 = rpois(nn, lambda3))
set.seed(111)
## Not run: 
##D p2 <- cqo(cbind(spp1, spp2, spp3) ~ x2 + x3 + x4, poissonff,
##D           data = cdata, Rank = 2, I.tolerances = TRUE,
##D           Crow1positive = c(TRUE, FALSE))  # deviance = 505.81
##D if (deviance(p2) > 506) stop("suboptimal fit obtained")
##D sort(deviance(p2, history = TRUE))  # A history of all the iterations
##D Coef(p2)
## End(Not run)

## Not run: 
##D lvplot(p2, sites = TRUE, spch = "*", scol = "darkgreen", scex = 1.5,
##D        chull = TRUE, label = TRUE, Absolute = TRUE, ellipse = 140,
##D        adj = -0.5, pcol = "blue", pcex = 1.3, las = 1, Ccol = "orange",
##D        C = TRUE, Cadj = c(-0.3, -0.3, 1), Clwd = 2, Ccex = 1.4,
##D        main = paste("Contours at Abundance = 140 with",
##D                   "convex hull of the site scores")) 
## End(Not run)
## Not run: 
##D var(latvar(p2))  # A diagonal matrix, i.e., uncorrelated latent vars
##D var(latvar(p2, varI.latvar = TRUE))  # Identity matrix
##D Tol(p2)[, , 1:2]  # Identity matrix
##D Tol(p2, varI.latvar = TRUE)[, , 1:2]  # A diagonal matrix
## End(Not run)



