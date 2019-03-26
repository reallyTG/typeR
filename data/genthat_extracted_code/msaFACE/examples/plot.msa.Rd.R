library(msaFACE)


### Name: plot.MSA_coef
### Title: Plot function for moving subset analysis
### Aliases: plot.MSA_coef
### Keywords: utilities

### ** Examples

data(GiFACE)

### Perform Moving Subset Analysis
msa_data <- moving_subset_analysis(GiFACE$data, "CO2A_Mean", "BYT", 30, group = GiFACE$year)

## Plot all final plots
plot(msa_data)

## Not run: 
##D ## Example to produce similar plots as in article
##D pdf("Plot_NCC_1.pdf", width = 15, height = 20)
##D par(mfcol = c(9,4), mar = c(4,4,1,4), las = 0)
##D for(i in 1:4){
##D   plot(msa_data, i_var = i, ylim = list(c(0,2.5), c(200,350)), 
##D        legend = i == 1)
##D   plot(msa_data, i_var = i, main_plot = F, i_acc = 1:8)
##D }
##D dev.off()
## End(Not run)

## Not run: 
##D ## Example to adjust axis and label parameters
##D par(mar = c(3.2,3.5,1,3), mfrow = c(2,1))
##D ## Plot default for comparison
##D plot(msa_data, i_var = 2)     
##D 
##D ## Change default axis (all parameters are passed to internal function "axis")
##D ## Define x-axis specifications
##D xaxt_spec  <- list(tck = -0.02, padj = -0.3, cex.axis = 1.5, lwd = 2)
##D ## Define 1st y-axis specifications 
##D yaxt1_spec <- list(at = c(0,1,2), tck = -0.02, padj = 0.5, cex.axis = 1.5, lwd = 2)
##D ## Define 2nd y-axis specifications 
##D yaxt2_spec <- list(tck = -0.02, padj = -0.3, col = "gray50", col.axis = "gray50",
##D                    cex.axis = 1.5, lwd = 2)
##D 
##D ## Change default labeling (all parameters are passed to internal function "mtext")
##D ## Define x-axis label specifications 
##D xlab_spec <- list(side = 1, line = 2, cex = 1.5)
##D ## Define 1st y-axis label specifications
##D ylab1_spec <- list(side = 2, line = 2, cex = 1.5)
##D ## Define 2nd y-axis label specifications 
##D ylab2_spec <- list(side = 4, line = 2, cex = 1.5, col = "gray50")
##D                    
##D                    
##D ## Define variable to be plotted, y-axis limits
##D plot(msa_data, i_var = 2, ylim = list(c(0,2.5), c(200,350)),                                     
##D      axis.param = list(xaxt_spec, yaxt1_spec, yaxt2_spec),
##D      label.param = list(xlab_spec, ylab1_spec, ylab2_spec),
##D      ## Define line width for horizontal lines (1) and the dependent variable (2)
##D      lwd = c(1,2),       
##D      ## Define point symbol
##D      pch = 20)                                                                                   
##D dev.off()
## End(Not run)



