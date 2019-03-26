library(DataVisualizations)


### Name: PDEplot
### Title: PDE plot
### Aliases: PDEplot

### ** Examples

x <- rnorm(1000, mean = 0.5, sd = 0.5)
y <- rnorm(750, mean = -0.5, sd = 0.75)
## No test: 
plt <- PDEplot(x, color = "red")$ggPlot
plt <- PDEplot(y, color = "blue", ggPlot = plt)$ggPlot
## End(No test)
# Second Example
#  ggplotObj=ggplot()
#  for(i in 1:length(Variables))
#     ggplotObj=PDEplot(Data[,i],ggPlot = ggplotObj)$ggPlot



