library(qpcR)


### Name: Cy0
### Title: Cy0 alternative to threshold cycles as in Guescini et al. (2008)
### Aliases: Cy0
### Keywords: models nonlinear

### ** Examples

## Single curve with plot.
m1 <- pcrfit(reps, 1, 2, l5)
Cy0(m1, plot = TRUE)

## Add to 'efficiency' plot.
efficiency(m1)
Cy0(m1, add = TRUE)

## Compare s.d. of replicates between
## Cy0 and cpD2 method. cpD2 wins!
ml1 <- modlist(reps, model = l4)
cy0 <- sapply(ml1, function(x) Cy0(x))
cpd2 <- sapply(ml1, function(x) efficiency(x, plot = FALSE)$cpD2)
tapply(cy0, gl(7, 4), function(x) sd(x))
tapply(cpd2, gl(7, 4), function(x) sd(x)) 



