library(DEVis)


### Name: plot_gene
### Title: Visualize the expression of a specific gene with regard to
###   metadata grouping.
### Aliases: plot_gene
### Keywords: DE boxplot expression gene visualization

### ** Examples

## Not run: 
##D 
##D #Plot the CAPS12 gene for each time point.
##D plot_gene(filename="CAPS12_time_plot.pdf", gene_name="CAPS12",
##D            groupBy="Time", theme=1, returnData=FALSE)
##D 
##D #Plot the METTL25 gene for each "response" group.  Store the long-form data table.
##D mettl25_dat <- plot_gene(filename="METTL25_time_plot.pdf", gene_name="METTL25",
##D                           groupBy="response", theme=2, returnData=TRUE)
##D 
## End(Not run)



