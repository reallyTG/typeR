library(rfigshare)


### Name: plot_to_filename
### Title: Convienence function to save a ggplot2 plot, and return its
###   filename.
### Aliases: plot_to_filename

### ** Examples

## Not run: 
##D # include in your fs_upload call
##D library(ggplot2)
##D p <- qplot(mpg, wt, data=mtcars)
##D plott <- fs_create(title="my title", description="some description", type="figure")
##D fs_add_categories(plott, "Ecology")
##D fs_upload(plott, plot_to_filename(p, "myfilename", "~"))
## End(Not run)



