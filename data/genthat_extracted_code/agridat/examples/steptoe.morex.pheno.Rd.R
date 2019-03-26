library(agridat)


### Name: steptoe.morex.pheno
### Title: Multi-environment trial of barley, phenotypic and genotypic data
###   for a population of Steptoe x Morex
### Aliases: steptoe.morex.pheno steptoe.morex.geno
### Keywords: datasets

### ** Examples


data(steptoe.morex.pheno)
dat <- steptoe.morex.pheno

## Not run: 
##D   # Visualize GxE of traits
##D   require(lattice)
##D   redblue <- colorRampPalette(c("firebrick", "lightgray", "#375997"))
##D   levelplot(amylase~env*gen, data=dat, col.regions=redblue,
##D             scales=list(x=list(rot=90)), main="amylase")
##D   levelplot(diapow~env*gen, data=dat, col.regions=redblue,
##D             scales=list(x=list(rot=90)), main="diapow")
##D   levelplot(hddate~env*gen, data=dat, col.regions=redblue,
##D             scales=list(x=list(rot=90)), main="hddate")
##D   levelplot(lodging~env*gen, data=dat, col.regions=redblue,
##D             scales=list(x=list(rot=90)), main="lodging")
##D   levelplot(malt~env*gen, data=dat, col.regions=redblue,
##D             scales=list(x=list(rot=90)), main="malt")
##D   levelplot(height~env*gen, data=dat, col.regions=redblue,
##D             scales=list(x=list(rot=90)), main="height")
##D   levelplot(protein~env*gen, data=dat, col.regions=redblue,
##D             scales=list(x=list(rot=90)), main="protein")
##D   levelplot(yield~env*gen, data=dat, col.regions=redblue,
##D             scales=list(x=list(rot=90)), main="yield")
## End(Not run)

# ----------------------------------------------------------------------------

# Calculate avg yield for each loc as in Romagosa 1996, table 3
t(t(round(tapply(dat$yield, dat$env, FUN=mean),2)))
# SKo92,SKg92 means in table 3 are switched.  Who is right, him or me?

# ----------------------------------------------------------------------------

# Draw marker map
if(require(qtl)){
  data(steptoe.morex.geno)
  datg <- steptoe.morex.geno
  plot.map(datg, main="steptoe.morex.pheno")  # or just use plot()
}

# ----------------------------------------------------------------------------

## Not run: 
##D   # This is a very rudimentary example.
##D   # Fit a simple multi-environment mixed model
##D   # asreml3
##D   require(asreml)
##D   m1 <- asreml(yield ~ env, data=dat, random=~gen)
##D   
##D   require(wgaim)
##D   qtl::plotMissing(datg)
##D   link.map(datg)
##D   # Create an interval object for wgaim
##D   class(datg)[1] <- "bc"
##D   dati <- cross2int(datg, id="gen")
##D   
##D   # Whole genome qtl
##D   assign("dat", dat, 1) # Needed for wgaim in script mode
##D   q1 <- wgaim(m1, dat, dati, merge.by="gen", na.method.X='include')
##D   link.map(q1, dati) # Visualize
##D   out.stat(q1, dati) # outlier statistic
##D   summary(q1, dati)  # Table of important intervals
##D   # Chrom Left Marker dist(cM) Right Marker dist(cM)   Size Pvalue ##D 
##D   #     3      ABG399     52.6       BCD828     56.1  0.254  0.000  45.0
##D   #     5      MWG912      148      ABG387A    151.2  0.092  0.001   5.9
##D   #     6     ABC169B     64.8       CDO497     67.5 -0.089  0.001   5.6
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   # This is a very rudimentary example.
##D 
##D   # Fit a simple multi-environment mixed model
##D   ## require(asreml4)
##D   ## m1 <- asreml(yield ~ env, data=dat, random=~gen)
##D   
##D   ## require(wgaim)
##D   ## plotMissing(datg)
##D   ## link.map(datg)
##D   ## # Create an interval object for wgaim
##D   ## class(datg)[1] <- "bc"
##D   ## dati <- cross2int(datg, id="gen")
##D   
##D   ## # Whole genome qtl
##D   ## assign("dat", dat, 1) # Needed for wgaim in script mode
##D   ## q1 <- wgaim(m1, dat, dati, merge.by="gen", na.method.X='include')
##D   ## link.map(q1, dati) # Visualize
##D   ## out.stat(q1, dati) # outlier statistic
##D   ## summary(q1, dati)  # Table of important intervals
##D   ## # Chrom Left Marker dist(cM) Right Marker dist(cM)   Size Pvalue ##D 
##D   ## #     3      ABG399     52.6       BCD828     56.1  0.254  0.000  45.0
##D   ## #     5      MWG912      148      ABG387A    151.2  0.092  0.001   5.9
##D   ## #     6     ABC169B     64.8       CDO497     67.5 -0.089  0.001   5.6
##D 
## End(Not run)

# ----------------------------------------------------------------------------




