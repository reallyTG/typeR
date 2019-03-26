library(drLumi)


### Name: lum_import
### Title: Import Luminex data
### Aliases: lum_import

### ** Examples

imp_path <-  system.file(c("inst","extdata"),"plate1.csv",
package="drLumi")
imp <- lum_import(imp_path)
imp



