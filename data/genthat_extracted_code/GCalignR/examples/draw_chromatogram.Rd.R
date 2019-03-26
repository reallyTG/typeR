library(GCalignR)


### Name: draw_chromatogram
### Title: Visualise peak lists as a pseudo-chromatogram
### Aliases: draw_chromatogram

### ** Examples

## load data
path <- (system.file("extdata", "simulated_peak_data.txt", package = "GCalignR"))
## run with defaults
x <- draw_chromatogram(data = path, rt_col_name = "rt")
## Customise and split samples in panels
x <- draw_chromatogram(data = path, rt_col_name = "rt", samples = c("A2","A4"),
 plot = FALSE, show_num = FALSE)
x[["ggplot"]] + ggplot2::facet_wrap(~ sample, nrow = 2)
## plot without numbers
x <- draw_chromatogram(data = path, show_num = FALSE, rt_col_name = "rt")



