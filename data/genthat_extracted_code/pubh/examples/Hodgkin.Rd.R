library(pubh)


### Name: Hodgkin
### Title: T-cell counts from Hodgkin's disease patients.
### Aliases: Hodgkin
### Keywords: datasets

### ** Examples

data(Hodgkin)
Hodgkin$Ratio <- Hodgkin$CD4/Hodgkin$CD8
estat(~ Ratio|Group, data = Hodgkin, label = "CD4+/CD8+ T-cells")
qq_plot(~ Ratio|Group, data = Hodgkin, ylab = "CD4+/CD8+ T-cells", aspect = 1)



