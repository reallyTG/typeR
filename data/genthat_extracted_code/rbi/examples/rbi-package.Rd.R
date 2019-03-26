library(rbi)


### Name: rbi-package
### Title: RBi - R interface for 'libbi'
### Aliases: rbi-package rbi RBi
### Keywords: package

### ** Examples


example_output_file <- system.file(package="rbi", "example_output.nc")
bi_file_summary(example_output_file)
mu_sigma <- bi_read(example_output_file, c("mu", "sigma"))
bi_write("mu_sigma.nc", mu_sigma)

## examples for running libbi from rbi (will take a few minutes)
## Not run: demo(PZ_generate_dataset)
## Not run: demo(PZ_PMMH)
## Not run: demo(PZ_SMC2)
## Not run: demo(PZ_filtering)




