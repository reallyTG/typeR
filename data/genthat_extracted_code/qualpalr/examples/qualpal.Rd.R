library(qualpalr)


### Name: qualpal
### Title: Generate qualitative color palettes
### Aliases: qualpal

### ** Examples

# Generate 3 distinct colors from the default color space
qualpal(3)

# Provide a custom color space
qualpal(n = 3, list(h = c(35, 360), s = c(0.5, 0.7), l = c(0, 0.45)))

qualpal(3, "pretty")

# Adapt palette to deuteranopia
qualpal(5, colorspace = "pretty_dark", cvd = "deutan", cvd_severity = 1)

# Adapt palette to protanomaly with severity 0.4
qualpal(8, colorspace = "pretty_dark", cvd = "protan", cvd_severity = 0.4)

## Not run: 
##D # The range of hue cannot exceed 360
##D qualpal(3, list(h = c(-20, 360), s = c(0.5, 0.7), l = c(0, 0.45)))
## End(Not run)




