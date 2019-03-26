library(RSurvey)


### Name: GetBitmapImage
### Title: Create Icon Bitmap Image
### Aliases: GetBitmapImage
### Keywords: misc

### ** Examples

## Not run: 
##D   types <- c("left", "right", "up", "down", "top", "bottom", "upleft", "upright",
##D              "downleft", "downright", "next", "previous", "copy", "paste", "find",
##D              "delete", "view", "info", "plus", "minus", "print", "histogram")
##D   Fun <- function(k) print(types[k])
##D   tt <- tcltk::tktoplevel(padx = 50, pady = 50)
##D   i <- 0
##D   j <- 0
##D   d <- 5
##D   for (k in seq_along(types)) {
##D     img <- paste("img", k, sep = ".")
##D     but <- paste("but", k, sep = ".")
##D     assign(img, GetBitmapImage(types[k]))
##D     assign(but, tcltk::ttkbutton(tt, width = 2, image = get(img),
##D                                  command = local({k <- k; function() Fun(k)})))
##D     tcltk::tkgrid(get(but), row = i, column = j, padx = 5, pady = 5)
##D     i <- k %/% d
##D     j <- ifelse(j < d - 1, j + 1, 0)
##D   }
## End(Not run)




