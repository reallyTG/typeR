library(DeclareDesign)


### Name: declare_step
### Title: Declare a custom step
### Aliases: declare_step

### ** Examples


population <- declare_population(N = 5, noise = rnorm(N))
manipulate <- declare_step(fabricate, noise_squared = noise^2, zero = 0)

design <- population + manipulate
draw_data(design)




