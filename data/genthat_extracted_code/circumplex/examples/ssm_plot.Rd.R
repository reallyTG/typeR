library(circumplex)


### Name: ssm_plot
### Title: Create a figure from SSM results
### Aliases: ssm_plot

### ** Examples

## No test: 
# Load example data
data("jz2017")

# Plot profile results
res <- ssm_analyze(jz2017, scales = PA:NO, angles = octants(),
  measures = c(NARPD, ASPD))
p <- ssm_plot(res)

# Plot contrast results
res <- ssm_analyze(jz2017, scales = PA:NO, angles = octants(),
  measures = c(NARPD, ASPD), contrast = "test")
p <- ssm_plot(res)
## End(No test)



