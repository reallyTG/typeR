library(Bchron)


### Name: BchronDensity
### Title: Non-parametric phase model
### Aliases: BchronDensity

### ** Examples

## No test: 
# Read in some data from Sluggan Moss
data(Sluggan)

# Run the model
SlugDens = BchronDensity(ages=Sluggan$ages,ageSds=Sluggan$ageSds,
                         calCurves=Sluggan$calCurves)

# plot it
plot(SlugDens)
## End(No test)



