library(grove)


### Name: GenerateSyntheticAnova
### Title: Generate synthetic functional ANOVA dataset
### Aliases: GenerateSyntheticAnova

### ** Examples

data <- GenerateSyntheticAnova(st.dev = 5, n.replicates = 10)
ix <- 1
plot(data$clean.Y[ix, ], type = "l", col = "red", ylab = "")
lines(data$noisy.Y[ix, ], col = "blue")



