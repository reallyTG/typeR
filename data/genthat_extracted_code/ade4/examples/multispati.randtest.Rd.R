library(ade4)


### Name: multispati.randtest
### Title: Multivariate spatial autocorrelation test (in C)
### Aliases: multispati.randtest
### Keywords: multivariate spatial nonparametric

### ** Examples

if (requireNamespace("spdep", quietly = TRUE)) {
    data(mafragh)
    maf.listw <- spdep::nb2listw(neig2nb(mafragh$neig))
    maf.pca <- dudi.pca(mafragh$env, scannf = FALSE)
    multispati.randtest(maf.pca, maf.listw)
    maf.pca.ms <- multispati(maf.pca, maf.listw, scannf = FALSE)
    plot(maf.pca.ms)
}



