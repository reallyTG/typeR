library(vcd)


### Name: OvaryCancer
### Title: Ovary Cancer Data
### Aliases: OvaryCancer
### Keywords: datasets

### ** Examples

data("OvaryCancer")
tab <- xtabs(Freq ~ xray + survival + stage + operation, data = OvaryCancer)
ftable(tab, col.vars = "survival", row.vars = c("stage", "operation", "xray"))

## model: ~ xray * operation * stage + survival * stage
## interpretation: treat xray, operation, stage as fixed margins,
##   the survival depends on stage, but not xray and operation.
doubledecker(survival ~ stage + operation + xray, data = tab)
mosaic(~ stage + operation + xray + survival,
  split = c(FALSE, TRUE, TRUE, FALSE), data = tab, keep = FALSE,
  gp = gpar(fill = rev(grey.colors(2))))
mosaic(~ stage + operation + xray + survival,
  split = c(FALSE, TRUE, TRUE, FALSE), data = tab, keep = FALSE,
  expected = ~ xray * operation * stage + survival*stage)



