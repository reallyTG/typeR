library(pixiedust)


### Name: pixieply
### Title: Apply Functions Over 'dust_list' Objects
### Aliases: pixieply pixiemap

### ** Examples

## Not run: 
##D #* This example will only display the last table 
##D #* in the viewer pane.  To see the full output,
##D #* run this example in an Rmarkdown document.
##D x <- split(mtcars, list(mtcars$am, mtcars$vs))
##D dust(x) %>%
##D   sprinkle_print_method("html") %>%
##D   pixieply(medley_bw)
## End(Not run)

## Not run: 
##D #* This is the full text of an RMarkdown script 
##D #* for the previous example.
##D ---
##D title: "Pixieply"
##D output: html_document
##D ---
##D 
##D ```{r}
##D library(pixiedust)
##D x <- dplyr::group_by(mtcars, am, vs)
##D dust(x, ungroup = FALSE) %>%
##D   sprinkle_print_method("html") %>%
##D     pixieply(medley_bw)
##D ```
## End(Not run)




