library(sizeMat)


### Name: plot.classify
### Title: Plot method for classify class
### Aliases: plot.classify

### ** Examples

data(crabdata)

classify_data = classify_mature(crabdata, varNames = c("carapace_width", "chela_heigth"),
varSex = "sex_category", selectSex = NULL, method = "ld")

## Showing different plots
plot(classify_data, xlab = "X")

plot(classify_data, xlab = "X", ylab = "Y", col = c(1, 2), pch = c(4, 5), cex = c(1, 3))

plot(classify_data, xlab = "Carapace width (mm.)", ylab = "Y", col = c(1, 2),
pch = c(4, 5), cex = c(1, 3), lwd_lines = c(1, 3))

plot(classify_data, xlab = "Carapace width (mm.)", ylab = "Y", col = c(1, 2),
pch = c(4, 5), cex = c(1, 3), lwd_lines = c(1, 3), main = "Classification")



