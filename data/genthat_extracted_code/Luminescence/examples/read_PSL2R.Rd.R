library(Luminescence)


### Name: read_PSL2R
### Title: Import PSL files to R
### Aliases: read_PSL2R
### Keywords: IO

### ** Examples


# (1) Import PSL file to R

file <- system.file("extdata", "DorNie_0016.psl", package = "Luminescence")
psl <- read_PSL2R(file, drop_bg = FALSE, as_decay_curve = TRUE, smooth = TRUE, merge = FALSE)
print(str(psl, max.level = 3))
plot(psl, combine = TRUE)




