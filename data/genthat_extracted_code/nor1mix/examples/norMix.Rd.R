library(nor1mix)


### Name: norMix
### Title: Mixtures of Univariate Normal Distributions
### Aliases: norMix [.norMix is.norMix m.norMix mean.norMix var.norMix
###   print.norMix
### Keywords: distribution

### ** Examples

ex <- norMix(mu = c(1,2,5))# defaults: sigma = 1, equal proportions ('w')
ex
plot(ex, p.comp = TRUE)# looks like a mixture of only 2; 'p.comp' plots components

## The 2nd Marron-Wand example, see also  ?MW.nm2
ex2 <- norMix(name = "#2 Skewed",
                mu = c(0, .5, 13/12),
	     sigma = c(1, 2/3, 5/9),
		 w = c(.2, .2, .6))

m.norMix  (ex2)
mean      (ex2)
var.norMix(ex2)
(e23 <- ex2[2:3,]) # (with re-normalized weights)
stopifnot(is.norMix(e23),
          all.equal(var.norMix(ex2),     719/1080, tol=1e-14),
          all.equal(var.norMix(ex ),      35/9,    tol=1e-14),
          all.equal(var.norMix(ex[2:3,]), 13/4,    tol=1e-14),
          all.equal(var.norMix(e23), 53^2/(12^3*4),tol=1e-14)
)

plot(ex2, log = "y")# maybe "revealing"



