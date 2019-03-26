library(VGAM)


### Name: lvplot.rrvglm
### Title: Latent Variable Plot for RR-VGLMs
### Aliases: lvplot.rrvglm biplot.rrvglm
### Keywords: models regression graphs

### ** Examples

nn <- nrow(pneumo)  # x1, x2 and x3 are some unrelated covariates
pneumo <- transform(pneumo, slet = scale(log(exposure.time)),
                              x1 = rnorm(nn), x2 = rnorm(nn), x3 = rnorm(nn))
fit <- rrvglm(cbind(normal, mild, severe) ~ slet + x1 + x2 + x3,
              multinomial, data = pneumo, Rank = 2,
              Corner = FALSE, Uncorrel = TRUE)
## Not run: 
##D lvplot(fit, chull = TRUE, scores = TRUE, clty = 2, ccol = "blue",
##D        scol = "red", Ccol = "darkgreen", Clwd = 2, Ccex = 2,
##D        main = "Biplot of some fictitional data") 
## End(Not run)



