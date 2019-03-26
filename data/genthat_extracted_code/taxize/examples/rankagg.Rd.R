library(taxize)


### Name: rankagg
### Title: Aggregate data by given taxonomic rank
### Aliases: rankagg

### ** Examples

library("vegan")
data(dune.taxon, package='vegan')
dat <- dune.taxon
set.seed(1234)
dat$abundance <- round(rlnorm(n=nrow(dat),meanlog=5,sdlog=2),0)
rankagg(data=dat, datacol="abundance", rank="Genus")
rankagg(data=dat, "abundance", rank="Family")
rankagg(data=dat, "abundance", rank="Genus", fxn="mean")
rankagg(data=dat, "abundance", rank="Subclass")
rankagg(data=dat, "abundance", rank="Subclass", fxn="sd")



