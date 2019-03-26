library(dissever)


### Name: generate_ci
### Title: Confidence intervals using bootstraping
### Aliases: generate_ci generate_ci,list,RasterStack-method

### ** Examples

# Load the Edgeroi dataset (see ?edgeroi)
data(edgeroi)

# Create a dissever output
diss <- dissever(
  coarse = edgeroi$carbon,
  fine = edgeroi$predictors,
  method = "lm",
  min_iter = 5, max_iter = 10,
  p = 0.05
)

# Generate the confidence intervals
## Not run: 
##D ci <- generate_ci(diss, edgeroi$predictors, n = 5)
##D 
##D plot(ci)
## End(Not run)



