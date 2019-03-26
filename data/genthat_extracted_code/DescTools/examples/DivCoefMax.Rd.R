library(DescTools)


### Name: DivCoefMax
### Title: Maximal value of Rao's diversity coefficient also called
###   quadratic entropy
### Aliases: DivCoefMax
### Keywords: multivariate

### ** Examples

## Not run: 
##D par.safe <- par()$mar
##D data(elec88)
##D par(mar = c(0.1, 0.1, 0.1, 0.1))
##D # Departments of France.
##D area.plot(elec88$area)
##D 
##D # Dissimilarity matrix.
##D d0 <- dist(elec88$xy)
##D 
##D # Frequency distribution maximizing spatial diversity in France
##D # according to Rao's quadratic entropy.
##D France.m <- DivCoefMax(d0)
##D w0 <- France.m$vectors$num
##D v0 <- France.m$value
##D (1:94) [w0 > 0]
##D 
##D # Smallest circle including all the 94 departments.
##D # The squared radius of that circle is the maximal value of the
##D # spatial diversity.
##D w1 = elec88$xy[c(6, 28, 66), ]
##D w.c = apply(w1 * w0[c(6, 28, 66)], 2, sum)
##D symbols(w.c[1], w.c[2], circles = sqrt(v0), inc = FALSE, add = TRUE)
##D s.value(elec88$xy, w0, add.plot = TRUE)
##D par(mar = par.safe)
##D 
##D 
##D # Maximisation of Rao's diversity coefficient
##D # with ultrametric dissimilarities.
##D data(microsatt)
##D mic.genet <- count2genet(microsatt$tab)
##D mic.dist <- dist.genet(mic.genet, 1)
##D mic.phylog <- hclust2phylog(hclust(mic.dist))
##D plot.phylog(mic.phylog)
##D mic.maxpond <- DivCoefMax(mic.phylog$Wdist)$vectors$num
##D dotchart.phylog(mic.phylog, mic.maxpond)
## End(Not run)



