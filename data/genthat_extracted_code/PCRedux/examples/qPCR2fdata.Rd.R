library(PCRedux)


### Name: qPCR2fdata
### Title: A helper function to convert amplification curve data to the
###   fdata format.
### Aliases: qPCR2fdata
### Keywords: fdata

### ** Examples


# Calculate slope and intercept on noise (negative) amplification curve data
# for the last eight cycles.
# Load additional packages for data and pipes.
library(qpcR)
library(fda.usc)
library(magrittr)

# Convert the qPCR data set to the fdata format
res_fdata <- qPCR2fdata(testdat)

# Extract column names and create rainbow color to label the data
res_fdata_colnames <- testdat[-1] %>% colnames()
data_colors <- rainbow(length(res_fdata_colnames), alpha=0.5)

# Plot the converted qPCR data
par(mfrow=c(1,2))
res_fdata %>% plot(., xlab="cycles", ylab="RFU", main="testdat", type="l",
                   lty=1, lwd=2, col=data_colors)
legend("topleft", as.character(res_fdata_colnames), pch=19,
         col=data_colors, bty="n", ncol=2)

# Calculate the Hausdorff distance (fda.usc) package and plot the distances
# as clustered data.

res_fdata_hclust <- metric.hausdorff(res_fdata)
plot(hclust(as.dist(res_fdata_hclust)), main="Clusters of the amplification\n
   curves as calculated by the Hausdorff distance")




