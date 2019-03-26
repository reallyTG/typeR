library(astrochron)


### Name: hilbert
### Title: Hilbert transform of stratigraphic series
### Aliases: hilbert

### ** Examples

# generate example series with 3 precession terms and noise
ex <- cycles(noisevar=.0004,dt=5)
# bandpass precession terms using cosine-tapered window 
res_ex <- bandpass(ex,flow=0.038,fhigh=0.057,win=2,p=.4)
# hilbert transform
hil_ex <- hilbert(res_ex)



