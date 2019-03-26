library(formattable)


### Name: as.htmlwidget.formattable
### Title: Convert formattable to an htmlwidget
### Aliases: as.htmlwidget.formattable

### ** Examples

## Not run: 
##D library(formattable)
##D # mtcars (mpg background in gradient: the higher, the redder)
##D as.htmlwidget(
##D   formattable(mtcars, list(mpg = formatter("span",
##D    style = x ~ style(display = "block",
##D    "border-radius" = "4px",
##D    "padding-right" = "4px",
##D    color = "white",
##D    "background-color" = rgb(x/max(x), 0, 0))))
##D   )
##D )
##D 
##D # since an htmlwidget, composes well with other tags
##D library(htmltools)
##D 
##D browsable(
##D   tagList(
##D     tags$div( class="jumbotron"
##D               ,tags$h1( class = "text-center"
##D                         ,tags$span(class = "glyphicon glyphicon-fire")
##D                         ,"experimental as.htmlwidget at work"
##D               )
##D     )
##D     ,tags$div( class = "row"
##D                ,tags$div( class = "col-sm-2"
##D                           ,tags$p(class="bg-primary", "Hi, I am formattable htmlwidget.")
##D                )
##D                ,tags$div( class = "col-sm-6"
##D                           ,as.htmlwidget( formattable( mtcars ) )
##D                )
##D     )
##D   )
##D )
## End(Not run)



