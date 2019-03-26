library(PTXQC)


### Name: plot_RatiosPG
### Title: Plot ratios of labeled data (e.g. SILAC) from proteinGroups.txt
### Aliases: plot_RatiosPG

### ** Examples


 x1 = seq(-3, 3, by = 0.1)
 y1 = dnorm(x1)
 x2 = seq(-5, 1, by = 0.1)
 y2 = dnorm(x2, mean = -1)
 data = data.frame( x = c(x1,x2),
                    y = c(y1,y2), 
                    col = c(rep("ok", length(x1)), rep("shifted", length(x2))), 
                    ltype = "dotted")
 plot_RatiosPG(data, range(data$x), "Ratio plot", "red", "group")




