library(EngrExpt)


### Name: surfarea
### Title: Surface area of silica
### Aliases: surfarea
### Keywords: datasets

### ** Examples

str(surfarea)
with(surfarea, summary(area))
qqmath(~ area, surfarea, aspect = 1, type = c("g", "p"),
       xlab = "Standard normal quantiles",
       ylab = expression("Surface area " * (m^2/g) *
           " of batches of silica"))
print(qqmath(~ area, surfarea, aspect = 1, type = c("g", "p"),
             xlab = "Standard normal quantiles",
             ylab = expression("Surface area " * (m^2/g))),
      pos = c(0,0,0.33,1), more = TRUE)
print(densityplot(~ area, surfarea,
                  xlab = expression("Surface area "*(m^2/g)*
                      " of batches of silica")),
      pos = c(0.3,0,1,1))



