library(lidR)


### Name: catalog_options_tools
### Title: Get or set LAScatalog processing engine options
### Aliases: catalog_options_tools opt_chunk_buffer opt_chunk_buffer<-
###   opt_chunk_size opt_chunk_size<- opt_chunk_alignment
###   opt_chunk_alignment<- opt_cores opt_cores<- opt_progress
###   opt_progress<- opt_stop_early opt_stop_early<- opt_wall_to_wall
###   opt_wall_to_wall<- opt_output_files opt_output_files<-
###   opt_laz_compression opt_laz_compression<- opt_select opt_select<-
###   opt_filter opt_filter<-

### ** Examples

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
ctg = catalog(LASfile)

plot(ctg, chunk_pattern = TRUE)

opt_chunk_size(ctg) <- 150
plot(ctg, chunk_pattern = TRUE)

opt_chunk_buffer(ctg) <- 10
plot(ctg, chunk_pattern = TRUE)

opt_chunk_alignment(ctg) <- c(270,250)
plot(ctg, chunk_pattern = TRUE)

summary(ctg)

opt_output_files(ctg) <- "/path/to/folder/templated_filename_{XBOTTOM}_{ID}"
summary(ctg)



