library(cofeatureR)


### Name: plot_cofeature_mat
### Title: Plot a Cofeature Matrix
### Aliases: plot_cofeature_mat

### ** Examples

## Not run: 
##D v1 <- c("RCOR1", "NCOR1", "LCOR", "RCOR1", "RCOR1", "RCOR1", "RCOR1")
##D v2 <- c("sampleA", "sampleC", "sampleB", "sampleC", "sampleA", "sampleC", "sampleC")
##D v3 <- c("Deletion", "Deletion", "SNV", "Rearrangement", "SNV", "Rearrangement", "SNV")
##D v4 <- c(0.05, 0.5, 0.25, 0.01, 0.03, 0.24, 0.89)
##D v5 <- c(1, 2, 1, 1, 2, 2, 1)
##D feature.order <- c("RCOR1", "NCOR1", "LCOR")
##D sample.id.order <- c("sampleA", "sampleB", "sampleC")
##D in.df <- dplyr::data_frame(feature = v1, sampleID = v2, type = v3, 
##D   p_value = -log10(v4), dir_flag = v5)
##D fill.colors <- c("Deletion" = "Blue", "Rearrangement" = "Green", "SNV" = "Red")
##D  
##D plot_cofeature_mat(in.df)
##D 
##D # With black tile color
##D plot_cofeature_mat(in.df, tile.col = "black")
##D 
##D # Fill in missing values with a lightgrey color
##D plot_cofeature_mat(in.df, tile.col = "black", missing.fill.col = "lightgrey")
##D 
##D # Rotate x-axes labels by 90 degrees
##D plot_cofeature_mat(in.df, rotate.x.labels = 90)
##D 
##D # Specify order of features, samples, and colors
##D plot_cofeature_mat(in.df, feature.order, sample.id.order, 
##D    fill.colors = fill.colors)
##D 
##D # Specify each cell can only have one "feature type"
##D plot_cofeature_mat(in.df, feature.order, sample.id.order, fill.colors = fill.colors,
##D   type.display.mode = "single")
##D 
##D # Specify the specific priority of the "feature type" for cells with
##D # multiple features
##D plot_cofeature_mat(in.df, feature.order, sample.id.order, fill.colors = fill.colors,
##D   type.display.mode = "single", type.order = c("Rearrangement", "SNV", "Deletion"))
##D 
##D # Add dots to tiles for an additional layer of information
##D plot_cofeature_mat(in.df, dot.size = "p_value")
##D 
##D # Only display dots
##D plot_cofeature_mat(in.df, dot.flag = TRUE, dot.size = "p_value", 
##D   tile.flag = FALSE)
##D 
##D # Samples will not be dropped
##D sample.id.order.new <- c("sampleA", "sampleB", "sampleC", "sampleD")
##D plot_cofeature_mat(in.df, tile.col = "black", 
##D   sample.id.order = sample.id.order.new)
##D 
##D # Samples can be dropped by setting drop.x = TRUE
##D plot_cofeature_mat(in.df, tile.col = "black", 
##D   sample.id.order = sample.id.order.new, drop.x = TRUE)
## End(Not run)



