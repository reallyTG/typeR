library(NormalGamma)


### Name: Intensities
### Title: Regular and Negative probes from one Illumina microarray
### Aliases: Intensities
### Keywords: datasets

### ** Examples


data(RegNegIntensities_Example)
X = Intensities$Regular
N = Intensities$Negative

par(mfrow=c(2,1))

HX = histogram (X, type='irregular', verbose=FALSE, plot=FALSE)
plot(HX, xlim=c(0,500))
hist(N, 30)







