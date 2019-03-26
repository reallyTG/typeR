library(semPlot)


### Name: semMatrixAlgebra
### Title: Extract or calculate with model matrices
### Aliases: semMatrixAlgebra

### ** Examples

## Mplus user guide SEM example:
outfile <- tempfile(fileext=".out")
download.file("http://www.statmodel.com/usersguide/chap5/ex5.11.out",outfile)

# Plot model:
semPaths(outfile,intercepts=FALSE)

# Obtain latent regressions (mplus)
semMatrixAlgebra(outfile, Beta)

# mplus model implied covariance:
mat1 <- semMatrixAlgebra(outfile, 
  Lambda %*% Imin(Beta, TRUE) %*% Psi %*% t(Imin(Beta, TRUE)) %*% t(Lambda) + Theta)

# Lisrel model implied covariance:
mat2 <- semMatrixAlgebra(outfile, 
  LY %*% Imin(BE, TRUE) %*% PS %*% t(Imin(BE, TRUE)) %*% t(LY) + TE, endoOnly = TRUE)

# RAM model implied covariance:
mat3 <- semMatrixAlgebra(outfile, 
                 F %*% Imin(A,TRUE) %*% S %*% t(Imin(A, TRUE)) %*% t(F))

## Not run: 
##D # Plot:
##D library("qgraph")
##D 
##D pdf("Models.pdf",width=15,height=5)
##D layout(t(1:3))
##D qgraph(round(cov2cor(mat1),5), maximum=1, edge.labels=TRUE, layout = "spring", 
##D   cut = 0.4, minimum = 0.1)
##D title("Mplus model")
##D qgraph(round(cov2cor(mat2),5), maximum=1, edge.labels=TRUE, layout = "spring", 
##D   cut = 0.4, minimum = 0.1)
##D title("LISREL model")
##D qgraph(round(cov2cor(mat3),5), maximum=1, edge.labels=TRUE, layout = "spring", 
##D   cut = 0.4, minimum = 0.1)
##D title("RAM model")
##D dev.off()
## End(Not run)
# They are the same.



