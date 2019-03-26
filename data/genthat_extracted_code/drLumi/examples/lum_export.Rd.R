library(drLumi)


### Name: lum_export
### Title: Extract and generates data.frame from lum_import object
### Aliases: lum_export

### ** Examples

# Read all data
imp_path <-  system.file(c("inst","extdata"),"plate1.csv",
package="drLumi")
imp <- lum_import(imp_path)
exp <- lum_export(imp)
names(exp)

# See variables
imp$well_vars

# Select only 2
imp$well_vars <- c("Median", "Net MFI")
exp <- lum_export(imp)
head(exp$well)



