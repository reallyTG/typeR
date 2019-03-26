library(spectacles)


### Name: mutate
### Title: Mutate a Spectra* object by transforming the spectra values,
###   and/or adding new or replacing existing attributes.
### Aliases: mutate mutate.Spectra mutate,Spectra-method

### ** Examples


# Loading example data
data(australia)
spectra(australia) <- sr_no ~ ... ~ 350:2500

# Modifying spectra
m <- mutate(australia, nir = log1p(1/nir))
plot(m)

# Modifying and creating attributes
m <- mutate(australia, sqrt_carbon = sqrt(carbon), foo = clay + ph, nir = log1p(1/nir))
plot(m)



