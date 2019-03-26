library(EngrExpt)


### Name: sarea
### Title: Surface area of silica
### Aliases: sarea
### Keywords: datasets

### ** Examples

str(sarea)
xtabs(sarea ~ batch + tech, sarea)
dotplot(reorder(tech, sarea) ~ sarea, sarea,
        groups = batch, type = c("p","a"), aspect = "xy",
        ylab = "Technician",
        xlab = expression("Measured surface area " * (m^2/g) *
                          " of silica batches"),
        auto.key = list(columns = 3, lines = TRUE)
)



