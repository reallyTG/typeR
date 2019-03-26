library(descr)


### Name: CrossTable
### Title: Cross tabulation with tests for factor independence
### Aliases: CrossTable

### ** Examples

# Simple cross tabulation of education versus prior induced
# abortions using infertility data
data(warpbreaks, package = "datasets")
ct <- CrossTable(warpbreaks$wool, warpbreaks$tension,
                 dnn = c("Wool", "Tension"))
data(esoph, package = "datasets")
ct <- CrossTable(esoph$alcgp, esoph$agegp, expected = TRUE,
                 chisq = FALSE, prop.chisq = FALSE,
                 dnn = c("Alcohol consumption", "Tobacco consumption"))
plot(ct, inv.y = TRUE)
print(ct)

# While printing the object, you can replace some (but not all)
# arguments previously passed to CrossTable
print(ct, format = "SPSS", cell.layout = FALSE, row.labels = TRUE)

# For better examples, including the use of xtable,
# see the documentation of crosstab().



