library(Bchron)


### Name: BchronDensityFast
### Title: Non-parametric phase model (faster version)
### Aliases: BchronDensityFast

### ** Examples

## No test: 
# Read in some data from Sluggan Moss
data(Sluggan)

# Run the model
SlugDensFast = BchronDensityFast(ages=Sluggan$ages,ageSds=Sluggan$ageSds,
                                 calCurves=Sluggan$calCurves)

# plot it
plot(SlugDensFast)
## End(No test)



