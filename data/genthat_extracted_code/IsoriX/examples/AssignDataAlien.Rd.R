library(IsoriX)


### Name: AssignDataAlien
### Title: Simulated assignment dataset
### Aliases: AssignDataAlien
### Keywords: datasets

### ** Examples


head(AssignDataAlien)
str(AssignDataAlien)

## The examples below will only be run if sufficient time is allowed
## You can change that by typing e.g. options_IsoriX(example_maxtime = XX)
## if you want to allow for examples taking up to ca. XX seconds to run
## (so don't write XX but put a number instead!)

if(getOption_IsoriX("example_maxtime") > 30) {

## The following describes how we created such dataset

### We prepare the precipitation data
GNIPDataDEagg <- prepsources(data = GNIPDataDE)

### We fit the models for Germany
GermanFit <- isofit(data = GNIPDataDEagg)

### We build the isoscape
GermanScape <- isoscape(raster = ElevRasterDE, isofit = GermanFit)

### We create a simulated dataset with 1 site and 10 observations
set.seed(1L)
Aliens <- create_aliens(calib_fn = list(intercept = 3, slope = 0.5, resid_var = 5),
                        isoscape = GermanScape,
                        raster = ElevRasterDE,
                        coordinates = data.frame(site_ID = "Berlin",
                                                 long   = 13.52134,
                                                 lat    = 52.50598),
                        n_sites = 1,
                        min_n_samples = 10,
                        max_n_samples = 10)
AssignDataAlien <- Aliens[, c("sample_ID", "sample_value")]

### Uncomment the following to store the file as we did
#save(AssignDataAlien, file = "AssignDataAlien.rda", compress = "xz")

}




