library(vcd)


### Name: agreementplot
### Title: Bangdiwala's Observer Agreement Chart
### Aliases: agreementplot agreementplot.default agreementplot.formula
### Keywords: category hplot

### ** Examples

data("SexualFun")
agreementplot(t(SexualFun))

data("MSPatients")
## Not run: 
##D ## best visualized using a resized device, e.g. using:
##D ## get(getOption("device"))(width = 12)
##D pushViewport(viewport(layout = grid.layout(ncol = 2)))
##D pushViewport(viewport(layout.pos.col = 1))
##D agreementplot(t(MSPatients[,,1]), main = "Winnipeg Patients",
##D               newpage = FALSE)
##D popViewport()
##D pushViewport(viewport(layout.pos.col = 2))
##D agreementplot(t(MSPatients[,,2]), main = "New Orleans Patients",
##D               newpage = FALSE)
##D popViewport(2)
##D dev.off()
## End(Not run)

## alternatively, use cotabplot:
cotabplot(MSPatients, panel = cotab_agreementplot)



