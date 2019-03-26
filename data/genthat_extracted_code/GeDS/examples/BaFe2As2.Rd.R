library(GeDS)


### Name: BaFe2As2
### Title: Barium-Ferrum-Arsenide powder diffraction data
### Aliases: BaFe2As2

### ** Examples

## Not run: 
##D # to load the data
##D data('BaFe2As2')
##D 
##D # fit a GeDS regression and produce a simple plot of the result. See ?NGeDS
##D # c.f. Kaishev et al. (2016), section 4.2
##D (Gmod <- NGeDS(intensity ~ f(angle), data = BaFe2As2, beta = 0.6, phi = 0.99,
##D                q = 3, show.iters = T))
##D plot(Gmod)
## End(Not run)




