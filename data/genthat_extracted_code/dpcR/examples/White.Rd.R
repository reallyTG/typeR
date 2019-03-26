library(dpcR)


### Name: White
### Title: Digitalized Data from a Fluidigm Array
### Aliases: White
### Keywords: datasets

### ** Examples


str(White)
par(mfrow = c(3,3))


White_data <- sapply(unique(White[["Image_position"]]), function(i)
	     White[White[["Image_position"]] == i, "Mean"])

assays <- sapply(unique(White[["Image_position"]]), function(i)
	 unique(White[White[["Image_position"]] == i, "Sample"]))

White_adpcr <- create_dpcr(White_data > 115, n = 765, assay = assays, 
		   type = "np", adpcr = TRUE)

White_k <- colSums(White_data > 115)

sapply(2:4, function(i) {
   plot_panel(extract_run(White_adpcr, i))

   # Create the ECDF of the image scan data to define
   # a cut-off for positive and negative partitions
   # Plot the ECDF of the image scan data an define a cut-off
   plot(ecdf(White_data[, i]), main = paste0("ECDF of Image Scan Data\n", assays[i]),
xlab = "Grey value", ylab = "Density of Grey values")
   abline(v = 115, col = 2, cex = 2)
   text(80, 0.5, "User defined cut-off", col = 2, cex = 1.5)

   # Plot the density of the dPCR experiment
   dpcr_density(k = White_k[i], n = 765, bars = TRUE)
}
)

par(mfrow = c(1,1))




