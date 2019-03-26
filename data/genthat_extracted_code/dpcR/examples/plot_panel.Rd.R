library(dpcR)


### Name: plot_panel
### Title: Plot Panel
### Aliases: plot_panel
### Keywords: hplot

### ** Examples


# Create a sample dPCR experiment with 765 elements (~> virtual compartments)   
# of target molecule copies per compartment as integer numbers (0,1,2)
ttest <- sim_adpcr(m = 400, n = 765, times = 20, pos_sums = FALSE, 
                   n_panels = 1)
# Plot the dPCR experiment results with default settings
plot_panel(ttest)

# Apply a two color code for number of copies per compartment
plot_panel(ttest, col = c("blue", "red"))

# plot few panels
ttest2 <- sim_adpcr(m = 400, n = 765, times = 40, pos_sums = FALSE, 
                    n_panels = 4)
par(mfcol = c(2, 2))
four_panels <- lapply(1:ncol(ttest2), function(i) 
       plot_panel(extract_run(ttest2, i), legend = FALSE, 
         main = paste("Panel", LETTERS[i], sep = " ")))
par(mfcol = c(1, 1))

# two different channels 
plot_panel(extract_run(ttest2, 1), legend = FALSE, 
           half = "left")
par(new = TRUE)
plot_panel(extract_run(ttest2, 2), col = "blue", 
           legend = FALSE, half = "right")

# plot two panels with every well as only the half of the rectangle
ttest3 <- sim_adpcr(m = 400, n = 765, times = 40, pos_sums = FALSE, 
                    n_panels = 2)
par(mfcol = c(1, 2))
two_panels <- lapply(1:ncol(ttest3), function(i) 
       plot_panel(extract_run(ttest3, i), legend = FALSE, 
         main = paste("Panel", LETTERS[i], sep = " ")))
par(mfcol = c(1, 1))




