library(KANT)


### Name: plot_up
### Title: Function to plot the results of expression_up
### Aliases: plot_up

### ** Examples



## The function is currently defined as
function (N, eset_up, cells_type, fontsize) 
{
    probes <- 1:N
    plot(as.numeric(as.character(pData(featureData(eset_up))[probes, 
        "Numbre_up"])), as.numeric(as.character(pData(featureData(eset_up))[probes, 
        "Delta_median_up"])), 
        cex = (1/(0.1 + as.numeric(as.character(pData(featureData(eset_up))[probes, 
        "IQR_up"])))), pch = 21, main = c("Over-expression in  :", 
        cells_type), xlab = "Number of samples in the sub-population over-expressing the gene", 
        ylab = "Delta")
    text(as.numeric(as.character(pData(featureData(eset_up))[probes, 
        "Numbre_up"])), as.numeric(as.character(pData(featureData(eset_up))[probes, 
        "Delta_median_up"])), as.character(pData(featureData(eset_up))[probes, 
        "Gene.Symbol"]), pos = 2, cex = fontsize)
  }



