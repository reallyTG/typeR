library(circumplex)


### Name: ssm_analyze
### Title: Perform analyses using the Structural Summary Method
### Aliases: ssm_analyze

### ** Examples

# Load example data
data("jz2017")

# Single-group mean-based SSM
ssm_analyze(jz2017, scales = PA:NO, angles = octants())

# Single-group correlation-based SSM
ssm_analyze(jz2017, scales = PA:NO, angles = octants(),
  measures = c(NARPD, ASPD))

## No test: 
# Multiple-group mean-based SSM
ssm_analyze(jz2017, scales = PA:NO, angles = octants(), grouping = Gender)

# Multiple-group mean-based SSM with contrast
ssm_analyze(jz2017, scales = PA:NO, angles = octants(), grouping = Gender,
  contrast = "model")

# Single-group correlation-based SSM with contrast
ssm_analyze(jz2017, scales = PA:NO, angles = octants(),
  measures = c(NARPD, ASPD), contrast = "test")

# Multiple-group correlation-based SSM
ssm_analyze(jz2017, scales = PA:NO, angles = octants(), measures = NARPD,
  grouping = Gender)

# Multiple-group correlation-based SSM with contrast
ssm_analyze(jz2017, scales = PA:NO, angles = octants(), measures = NARPD,
  grouping = Gender, contrast = "test")
## End(No test)



