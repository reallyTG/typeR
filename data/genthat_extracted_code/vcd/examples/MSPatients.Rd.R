library(vcd)


### Name: MSPatients
### Title: Diagnosis of Multiple Sclerosis
### Aliases: MSPatients
### Keywords: datasets

### ** Examples

data("MSPatients")
## Not run: 
##D ## best visualized using a resized device, e.g. using:
##D ## get(getOption("device"))(width = 12)
##D pushViewport(viewport(layout = grid.layout(ncol = 2)))
##D pushViewport(viewport(layout.pos.col = 1))
##D popViewport()
##D pushViewport(viewport(layout.pos.col = 2))
##D popViewport(2)
##D dev.off()
## End(Not run)

## alternative, more convenient way
mplot(
  agreementplot(t(MSPatients[,,1]), return_grob = TRUE,
    main = "Winnipeg Patients"),
  agreementplot(t(MSPatients[,,2]), return_grob = TRUE,
    main = "New Orleans Patients")
)

## alternatively, use cotabplot:
cotabplot(MSPatients, panel = cotab_agreementplot)



