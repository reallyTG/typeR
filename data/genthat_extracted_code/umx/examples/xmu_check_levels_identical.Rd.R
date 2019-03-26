library(umx)


### Name: xmu_check_levels_identical
### Title: xmu_check_levels_identical
### Aliases: xmu_check_levels_identical

### ** Examples

require(umx)
data(twinData)
baseNames = c("bmi")
selDVs = umx_paste_names(baseNames, "", 1:2)
tmp = twinData[, selDVs]
tmp$bmi1[tmp$bmi1 <= 22] = 22
tmp$bmi2[tmp$bmi2 <= 22] = 22
xmu_check_levels_identical(umxFactor(tmp, sep = ""), selDVs = baseNames, sep = "")
## Not run: 
##D xmu_check_levels_identical(umxFactor(tmp), selDVs = baseNames, sep = "")
## End(Not run)



