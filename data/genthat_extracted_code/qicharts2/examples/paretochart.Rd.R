library(qicharts2)


### Name: paretochart
### Title: Paretochart
### Aliases: paretochart

### ** Examples

# Generate categorical vector
x <- rep(LETTERS[1:9], c(256, 128, 64, 32, 16, 8, 4, 2, 1))

# Make paretochart
paretochart(x)

# Save paretochart object to variable
p <- paretochart(x)

# Print data frame
p$data




