library(evmix)


### Name: kernels
### Title: Kernel functions
### Aliases: kernels kdz kpz kdgaussian kduniform kdtriangular
###   kdepanechnikov kdbiweight kdtriweight kdtricube kdparzen kdcosine
###   kdoptcosine kpgaussian kpuniform kptriangular kpepanechnikov
###   kpbiweight kptriweight kptricube kpparzen kpcosine kpoptcosine
###   kdgaussian kernels kdz kpz kduniform kdtriangular kdepanechnikov
###   kdbiweight kdtriweight kdtricube kdparzen kdcosine kdoptcosine
###   kpgaussian kpuniform kptriangular kpepanechnikov kpbiweight
###   kptriweight kptricube kpparzen kpcosine kpoptcosine kduniform kernels
###   kdz kpz kdgaussian kdtriangular kdepanechnikov kdbiweight kdtriweight
###   kdtricube kdparzen kdcosine kdoptcosine kpgaussian kpuniform
###   kptriangular kpepanechnikov kpbiweight kptriweight kptricube kpparzen
###   kpcosine kpoptcosine kdtriangular kernels kdz kpz kdgaussian
###   kduniform kdepanechnikov kdbiweight kdtriweight kdtricube kdparzen
###   kdcosine kdoptcosine kpgaussian kpuniform kptriangular kpepanechnikov
###   kpbiweight kptriweight kptricube kpparzen kpcosine kpoptcosine
###   kdepanechnikov kernels kdz kpz kdgaussian kduniform kdtriangular
###   kdbiweight kdtriweight kdtricube kdparzen kdcosine kdoptcosine
###   kpgaussian kpuniform kptriangular kpepanechnikov kpbiweight
###   kptriweight kptricube kpparzen kpcosine kpoptcosine kdbiweight
###   kernels kdz kpz kdgaussian kduniform kdtriangular kdepanechnikov
###   kdtriweight kdtricube kdparzen kdcosine kdoptcosine kpgaussian
###   kpuniform kptriangular kpepanechnikov kpbiweight kptriweight
###   kptricube kpparzen kpcosine kpoptcosine kdtriweight kernels kdz kpz
###   kdgaussian kduniform kdtriangular kdepanechnikov kdbiweight kdtricube
###   kdparzen kdcosine kdoptcosine kpgaussian kpuniform kptriangular
###   kpepanechnikov kpbiweight kptriweight kptricube kpparzen kpcosine
###   kpoptcosine kdtricube kernels kdz kpz kdgaussian kduniform
###   kdtriangular kdepanechnikov kdbiweight kdtriweight kdparzen kdcosine
###   kdoptcosine kpgaussian kpuniform kptriangular kpepanechnikov
###   kpbiweight kptriweight kptricube kpparzen kpcosine kpoptcosine
###   kdparzen kernels kdz kpz kdgaussian kduniform kdtriangular
###   kdepanechnikov kdbiweight kdtriweight kdtricube kdcosine kdoptcosine
###   kpgaussian kpuniform kptriangular kpepanechnikov kpbiweight
###   kptriweight kptricube kpparzen kpcosine kpoptcosine kdcosine kernels
###   kdz kpz kdgaussian kduniform kdtriangular kdepanechnikov kdbiweight
###   kdtriweight kdtricube kdparzen kdoptcosine kpgaussian kpuniform
###   kptriangular kpepanechnikov kpbiweight kptriweight kptricube kpparzen
###   kpcosine kpoptcosine kdoptcosine kernels kdz kpz kdgaussian kduniform
###   kdtriangular kdepanechnikov kdbiweight kdtriweight kdtricube kdparzen
###   kdcosine kpgaussian kpuniform kptriangular kpepanechnikov kpbiweight
###   kptriweight kptricube kpparzen kpcosine kpoptcosine kpgaussian
###   kernels kdz kpz kdgaussian kduniform kdtriangular kdepanechnikov
###   kdbiweight kdtriweight kdtricube kdparzen kdcosine kdoptcosine
###   kpuniform kptriangular kpepanechnikov kpbiweight kptriweight
###   kptricube kpparzen kpcosine kpoptcosine kpuniform kernels kdz kpz
###   kdgaussian kduniform kdtriangular kdepanechnikov kdbiweight
###   kdtriweight kdtricube kdparzen kdcosine kdoptcosine kpgaussian
###   kptriangular kpepanechnikov kpbiweight kptriweight kptricube kpparzen
###   kpcosine kpoptcosine kptriangular kernels kdz kpz kdgaussian
###   kduniform kdtriangular kdepanechnikov kdbiweight kdtriweight
###   kdtricube kdparzen kdcosine kdoptcosine kpgaussian kpuniform
###   kpepanechnikov kpbiweight kptriweight kptricube kpparzen kpcosine
###   kpoptcosine kpepanechnikov kernels kdz kpz kdgaussian kduniform
###   kdtriangular kdepanechnikov kdbiweight kdtriweight kdtricube kdparzen
###   kdcosine kdoptcosine kpgaussian kpuniform kptriangular kpbiweight
###   kptriweight kptricube kpparzen kpcosine kpoptcosine kpbiweight
###   kernels kdz kpz kdgaussian kduniform kdtriangular kdepanechnikov
###   kdbiweight kdtriweight kdtricube kdparzen kdcosine kdoptcosine
###   kpgaussian kpuniform kptriangular kpepanechnikov kptriweight
###   kptricube kpparzen kpcosine kpoptcosine kptriweight kernels kdz kpz
###   kdgaussian kduniform kdtriangular kdepanechnikov kdbiweight
###   kdtriweight kdtricube kdparzen kdcosine kdoptcosine kpgaussian
###   kpuniform kptriangular kpepanechnikov kpbiweight kptricube kpparzen
###   kpcosine kpoptcosine kptricube kernels kdz kpz kdgaussian kduniform
###   kdtriangular kdepanechnikov kdbiweight kdtriweight kdtricube kdparzen
###   kdcosine kdoptcosine kpgaussian kpuniform kptriangular kpepanechnikov
###   kpbiweight kptriweight kpparzen kpcosine kpoptcosine kpparzen kernels
###   kdz kpz kdgaussian kduniform kdtriangular kdepanechnikov kdbiweight
###   kdtriweight kdtricube kdparzen kdcosine kdoptcosine kpgaussian
###   kpuniform kptriangular kpepanechnikov kpbiweight kptriweight
###   kptricube kpcosine kpoptcosine kpcosine kernels kdz kpz kdgaussian
###   kduniform kdtriangular kdepanechnikov kdbiweight kdtriweight
###   kdtricube kdparzen kdcosine kdoptcosine kpgaussian kpuniform
###   kptriangular kpepanechnikov kpbiweight kptriweight kptricube kpparzen
###   kpoptcosine kpoptcosine kernels kdz kpz kdgaussian kduniform
###   kdtriangular kdepanechnikov kdbiweight kdtriweight kdtricube kdparzen
###   kdcosine kdoptcosine kpgaussian kpuniform kptriangular kpepanechnikov
###   kpbiweight kptriweight kptricube kpparzen kpcosine kdz kernels kpz
###   kdgaussian kduniform kdtriangular kdepanechnikov kdbiweight
###   kdtriweight kdtricube kdparzen kdcosine kdoptcosine kpgaussian
###   kpuniform kptriangular kpepanechnikov kpbiweight kptriweight
###   kptricube kpparzen kpcosine kpoptcosine kpz kernels kdz kdgaussian
###   kduniform kdtriangular kdepanechnikov kdbiweight kdtriweight
###   kdtricube kdparzen kdcosine kdoptcosine kpgaussian kpuniform
###   kptriangular kpepanechnikov kpbiweight kptriweight kptricube kpparzen
###   kpcosine kpoptcosine

### ** Examples

xx = seq(-2, 2, 0.01)
plot(xx, kdgaussian(xx), type = "l", col = "black",ylim = c(0, 1.2))
lines(xx, kduniform(xx), col = "grey")
lines(xx, kdtriangular(xx), col = "blue")
lines(xx, kdepanechnikov(xx), col = "darkgreen")
lines(xx, kdbiweight(xx), col = "red")
lines(xx, kdtriweight(xx), col = "purple")
lines(xx, kdtricube(xx), col = "orange")
lines(xx, kdparzen(xx), col = "salmon")
lines(xx, kdcosine(xx), col = "cyan")
lines(xx, kdoptcosine(xx), col = "goldenrod")
legend("topright", c("Gaussian", "uniform", "triangular", "Epanechnikov",
"biweight", "triweight", "tricube", "Parzen", "cosine", "optcosine"), lty = 1,
col = c("black", "grey", "blue", "darkgreen", "red", "purple", "orange",
  "salmon", "cyan", "goldenrod"))




