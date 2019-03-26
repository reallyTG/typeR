library(geoBayes)


### Name: stackdata
### Title: Combine 'data.frame's
### Aliases: stackdata

### ** Examples

## Not run: 
##D d1 <- data.frame(w = 1:3, z = 4:6 + 0.1)
##D d2 <- data.frame(w = 3:7, x = 1:5, y = 6:10)
##D (d12a <- stackdata(d1, d2))
##D lapply(d12a, class)
##D (d12b <- stackdata(d1, d2, fillwith = c(x = NA, y = 0, z = -99)))
##D lapply(d12b, class)
##D (d12c <- stackdata(d1, d2, fillwith = c(x = NA, y = 0, z = -99),
##D                    keepclass = TRUE))
##D lapply(d12c, class)
##D (d12d <- stackdata(d1, d2, fillwith = c(x = NA, 0)))
##D 
##D data(rhizoctonia)
##D predgrid <- mkpredgrid2d(rhizoctonia[c("Xcoord", "Ycoord")],
##D                          par.x = 100, chull = TRUE, exf = 1.2)
##D rhizdata <- stackdata(rhizoctonia, predgrid$grid)
## End(Not run)



