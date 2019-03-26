library(GROAN)


### Name: noiseInjector.unif
### Title: Inject Uniform Noise
### Aliases: noiseInjector.unif

### ** Examples

#a sinusoid signal
phenos = sin(seq(0,5, 0.1))
plot(phenos, type='p', pch = 16, main='Original (black) vs. Injected (red), 100% affected')

#adding normal noise to all samples
phenos.noise = noiseInjector.unif(phenos, min=0.1, max=0.3)
points(phenos.noise, type='p', col='red')

#adding noise only to 30% of the samples
plot(phenos, type='p', pch = 16, main='Original (black) vs. Injected (red), 30% affected')
phenos.noise.subset = noiseInjector.unif(phenos, min=0.1, max=0.3, subset = 0.3)
points(phenos.noise.subset, type='p', col='red')



