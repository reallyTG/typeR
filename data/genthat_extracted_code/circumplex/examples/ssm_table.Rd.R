library(circumplex)


### Name: ssm_table
### Title: Create HTML table from SSM results or contrasts
### Aliases: ssm_table

### ** Examples

## No test: 
# Load example data
data("jz2017")

# Create table of profile results
res <- ssm_analyze(jz2017, scales = PA:NO, angles = octants(),
  measures = c(NARPD, ASPD))
ssm_table(res)

# Create table of contrast results
res <- ssm_analyze(jz2017, scales = PA:NO, angles = octants(),
  measures = c(NARPD, ASPD), contrast = "test")
ssm_table(res)
## End(No test)



