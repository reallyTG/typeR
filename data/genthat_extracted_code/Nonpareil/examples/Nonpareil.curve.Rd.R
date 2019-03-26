library(Nonpareil)


### Name: Nonpareil.curve
### Title: Generates a Nonpareil curve from an .npo file
### Aliases: Nonpareil.curve

### ** Examples

# Generate a Nonpareil plot
file <- system.file("extdata", "LakeLanier.npo", package="Nonpareil")
np <- Nonpareil.curve(file)

# Show the estimated values
print(np)

# Predict coverage for 20Gbp
predict(np, 20e9)

# Obtain the Nd diversity index
np$diversity



