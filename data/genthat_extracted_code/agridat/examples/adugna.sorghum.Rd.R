library(agridat)


### Name: adugna.sorghum
### Title: Multi-environment trial of sorghum at 3 locations across 5 years
### Aliases: adugna.sorghum
### Keywords: datasets

### ** Examples


data(adugna.sorghum)
dat <- adugna.sorghum

require(lattice)
redblue <- colorRampPalette(c("firebrick", "lightgray", "#375997"))
levelplot(yield ~ env*gen, data=dat, main="adugna.sorghum gxe heatmap",
          col.regions=redblue)

# Genotype means match Adugna
tapply(dat$yield, dat$gen, mean)

# CV for each genotype.  G1..G15 match, except for G2.
# The table in Adugna scrambles the means for G16..G28
if(require(reshape2)){
mat <- acast(dat, gen~env,  value.var='yield')
round(sqrt(apply(mat, 1, var, na.rm=TRUE)) / apply(mat, 1, mean, na.rm=TRUE) * 100,2)

# Shukla stability.  G1..G15 match Adugna.  Can't match G16..G28.
dat1 <- droplevels(subset(dat, trial=="T1"))
mat1 <- acast(dat1, gen~env,  value.var='yield')
w <- mat1; k=15; n=8  # k=p gen, n=q env
w <- sweep(w, 1, rowMeans(mat1, na.rm=TRUE))
w <- sweep(w, 2, colMeans(mat1, na.rm=TRUE))
w <- w + mean(mat1, na.rm=TRUE)
w <- rowSums(w^2, na.rm=TRUE)
sig2 <- k*w/((k-2)*(n-1)) - sum(w)/((k-1)*(k-2)*(n-1))
round(sig2/10000,1) # Genotypes in T1 are divided by 10000
}




