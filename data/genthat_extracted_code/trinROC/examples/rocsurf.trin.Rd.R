library(trinROC)


### Name: rocsurf.trin
### Title: Trinormal ROC surface plot
### Aliases: rocsurf.trin

### ** Examples

data(cancer)
x1 <- with(cancer, cancer[trueClass=="healthy", 8])
y1 <- with(cancer, cancer[trueClass=="intermediate", 8])
z1 <- with(cancer, cancer[trueClass=="diseased", 8])

rocsurf.trin(x1, y1, z1)



