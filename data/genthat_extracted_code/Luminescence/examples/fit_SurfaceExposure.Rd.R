library(Luminescence)


### Name: fit_SurfaceExposure
### Title: Nonlinear Least Squares Fit for OSL surface exposure data
### Aliases: fit_SurfaceExposure
### Keywords: datagen

### ** Examples


## Load example data
data("ExampleData.SurfaceExposure")

## Example 1 - Single sample
# Known parameters: 10000 a, mu = 0.9, sigmaphi = 5e-10
sample_1 <- ExampleData.SurfaceExposure$sample_1
head(sample_1)
results <- fit_SurfaceExposure(sample_1, mu = 0.9, sigmaphi = 5e-10)
get_RLum(results)


## Example 2 - Single sample and considering dose rate
# Known parameters: 10000 a, mu = 0.9, sigmaphi = 5e-10, 
# dose rate = 2.5 Gy/ka, D0 = 40 Gy
sample_2 <- ExampleData.SurfaceExposure$sample_2
head(sample_2)
results <- fit_SurfaceExposure(sample_2, mu = 0.9, sigmaphi = 5e-10, 
                               Ddot = 2.5, D0 = 40)
get_RLum(results)


## Example 3 - Multiple samples (global fit) to better constrain 'mu'
# Known parameters: ages = 1e3, 1e4, 1e5, 1e6 a, mu = 0.9, sigmaphi = 5e-10
set_1 <- ExampleData.SurfaceExposure$set_1
str(set_1, max.level = 2)
results <- fit_SurfaceExposure(set_1, age = c(1e3, 1e4, 1e5, 1e6), 
                               sigmaphi = 5e-10)
get_RLum(results)


## Example 4 - Multiple samples (global fit) and considering dose rate
# Known parameters: ages = 1e2, 1e3, 1e4, 1e5, 1e6 a, mu = 0.9, sigmaphi = 5e-10,
# dose rate = 1.0 Ga/ka, D0 = 40 Gy
set_2 <- ExampleData.SurfaceExposure$set_2
str(set_2, max.level = 2)
results <- fit_SurfaceExposure(set_2, age = c(1e2, 1e3, 1e4, 1e5, 1e6), 
                               sigmaphi = 5e-10, Ddot = 1, D0 = 40)
get_RLum(results)




