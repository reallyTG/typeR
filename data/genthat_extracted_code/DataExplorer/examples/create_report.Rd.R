library(DataExplorer)


### Name: create_report
### Title: create_report Function
### Aliases: create_report
### Keywords: create_report

### ** Examples

## Not run: 
##D #############################
##D ## Default config file     ##
##D ## Copy and edit if needed ##
##D #############################
##D config <- list(
##D   "introduce" = list(),
##D   "plot_str" = list(
##D     "type" = "diagonal",
##D     "fontSize" = 35,
##D     "width" = 1000,
##D     "margin" = list("left" = 350, "right" = 250)
##D   ),
##D   "plot_missing" = list(),
##D   "plot_histogram" = list(),
##D   "plot_qq" = list(sampled_rows = 1000L),
##D   "plot_bar" = list(),
##D   "plot_correlation" = list("cor_args" = list("use" = "pairwise.complete.obs")),
##D   "plot_prcomp" = list(),
##D   "plot_boxplot" = list(),
##D   "plot_scatterplot" = list(sampled_rows = 1000L)
##D )
##D 
##D # Create report
##D create_report(iris)
##D create_report(airquality, y = "Ozone")
##D 
##D # Load library
##D library(ggplot2)
##D library(data.table)
##D library(rmarkdown)
##D 
##D # Set some missing values
##D diamonds2 <- data.table(diamonds)
##D for (j in 5:ncol(diamonds2)) {
##D   set(diamonds2,
##D       i = sample.int(nrow(diamonds2), sample.int(nrow(diamonds2), 1)),
##D       j,
##D       value = NA_integer_)
##D }
##D 
##D # Create customized report for diamonds2 dataset
##D create_report(
##D   data = diamonds2,
##D   output_file = "report.html",
##D   output_dir = getwd(),
##D   y = "price",
##D   config = list(
##D     "introduce" = list(),
##D     "plot_missing" = list(),
##D     "plot_histogram" = list(),
##D     "plot_qq" = list("by" = "cut", sampled_rows = 1000L),
##D     "plot_bar" = list("with" = "carat"),
##D     "plot_correlation" = list("cor_args" = list("use" = "pairwise.complete.obs")),
##D     "plot_prcomp" = list(),
##D     "plot_boxplot" = list("by" = "cut")
##D   ),
##D   html_document(toc = TRUE, toc_depth = 6, theme = "flatly")
##D )
## End(Not run)



