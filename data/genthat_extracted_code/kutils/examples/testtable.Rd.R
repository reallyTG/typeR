library(kutils)


### Name: testtable
### Title: Test viewer for tex tables
### Aliases: testtable

### ** Examples

## No test: 
require(lavaan)
tempdir <- tempdir()
HS.model <- ' visual  =~ x1 + x2 + x3
              textual =~ x4 + x5 + x6
              speed   =~ x7 + x8 + x9'
fit1 <- cfa(HS.model, data = HolzingerSwineford1939,
            std.lv = TRUE, meanstructure = TRUE)
fit1.t <- semTable(fit1, fits = c("chisq", "rmsea"),
               columns = c("estsestars", "rsquare"),
               columnLabels = c("estsestars" = "Est(SE)"),
               file = file.path(tempdir, "fit1.t"))
if (interactive()) testtable("fit1.t", tempdir)
## End(No test)



