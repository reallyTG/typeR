library(ftsspec)


### Name: SpecMA
### Title: 'Spectral density operator of a MA vector process' Object
### Aliases: SpecMA

### ** Examples

ma.scale1=c(-1.4,2.3,-2)
a1=Generate_filterMA(6, 6, MA.len=3, ma.scale=ma.scale1)
a1.spec=SpecMA(a1, nfreq=512, noise.type='wiener')
plot(a1.spec)
rm(a1, a1.spec)



