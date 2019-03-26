library(VGAM)


### Name: deermice
### Title: Captures of Peromyscus maniculatus (Also Known as Deer Mice).
### Aliases: deermice
### Keywords: datasets

### ** Examples

head(deermice)
## Not run: 
##D fit1 <- vglm(cbind(y1, y2, y3, y4, y5, y6) ~ sex + age,
##D              posbernoulli.t(parallel.t = TRUE), data = deermice, trace = TRUE)
##D coef(fit1)
##D coef(fit1, matrix = TRUE)
## End(Not run)



