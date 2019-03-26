## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, message = FALSE)

## ---- echo = FALSE, message=FALSE, warning=FALSE-------------------------
dir.create("assets/pptx", recursive = TRUE, showWarnings = FALSE)
office_doc_link <- function(url){
  stopifnot(requireNamespace("htmltools", quietly = TRUE))
  htmltools::tags$p(  htmltools::tags$span("Download file "),
    htmltools::tags$a(basename(url), href = url), 
    htmltools::tags$span(" - view with"),
    htmltools::tags$a("office web viewer", target="_blank", 
      href = paste0("https://view.officeapps.live.com/op/view.aspx?src=", url)
      ), 
    style="text-align:center;font-style:italic;color:gray;"
    )
}

## ------------------------------------------------------------------------
library(officer)
# Package `magrittr` makes officer usage easier.
library(magrittr)

## ------------------------------------------------------------------------
my_pres <- read_pptx() 

## ------------------------------------------------------------------------
my_pres <- my_pres %>% 
  add_slide(layout = "Title and Content", master = "Office Theme")

## ------------------------------------------------------------------------
layout_summary(my_pres)

## ------------------------------------------------------------------------
my_pres <- my_pres %>% 
  ph_with(value = "Hello world", location = ph_location_type(type = "title")) %>%
  ph_with(value = "A footer", location = ph_location_type(type = "ftr")) %>%
  ph_with(value = format(Sys.Date()), location = ph_location_type(type = "dt")) %>%
  ph_with(value = "slide 1", location = ph_location_type(type = "sldNum")) %>%
  ph_with(value = mtcars, location = ph_location_type(type = "body")) 

## ------------------------------------------------------------------------
print(my_pres, target = "assets/pptx/first_example.pptx") 

## ----echo=FALSE----------------------------------------------------------
office_doc_link( url = paste0( "https://davidgohel.github.io/officer/articles/", "assets/pptx/first_example.pptx" ) )

## ------------------------------------------------------------------------
my_pres <- read_pptx() %>% 
  add_slide(layout = "Two Content", master = "Office Theme") %>% 
  add_slide(layout = "Title and Content", master = "Office Theme") %>% 
  add_slide(layout = "Title Only", master = "Office Theme")
length(my_pres)

## ------------------------------------------------------------------------
my_pres <- my_pres %>% remove_slide(index = 1)
length(my_pres)

## ------------------------------------------------------------------------
my_pres <- my_pres %>% on_slide(index = 1)

## ------------------------------------------------------------------------
doc <- read_pptx() %>%
  add_slide(layout = "Title and Content", master = "Office Theme") %>%
  ph_with("Hello world", location = ph_location_type(type = "body") ) 

print(doc, target = "assets/pptx/ph_with_location_type.pptx") 

## ----echo=FALSE----------------------------------------------------------
office_doc_link( url = paste0( "https://davidgohel.github.io/officer/articles/", "assets/pptx/ph_with_location_type.pptx" ) )

## ------------------------------------------------------------------------
mypres <- read_pptx() %>%
  add_slide(layout = "Title and Content", master = "Office Theme") 
layout_properties ( x = mypres, layout = "Title and Content", master = "Office Theme" )
ph_with(mypres, head(iris), 
        location = ph_location_label(ph_label = "Content Placeholder 2") )

print(mypres, target = "assets/pptx/ph_with_location_label.pptx") 

## ----echo=FALSE----------------------------------------------------------
office_doc_link( url = paste0( "https://davidgohel.github.io/officer/articles/", "assets/pptx/ph_with_location_label.pptx" ) )

## ------------------------------------------------------------------------
doc <- read_pptx() %>%
  add_slide(layout = "Two Content", master = "Office Theme") %>%
  ph_with(value = "A first text", location = ph_location_left()) %>%
  ph_with(value = "A second text", location = ph_location_right()) 

print(doc, target = "assets/pptx/ph_with_location_left_right.pptx") 

## ----echo=FALSE----------------------------------------------------------
office_doc_link( url = paste0( "https://davidgohel.github.io/officer/articles/", "assets/pptx/ph_with_location_left_right.pptx" ) )

## ------------------------------------------------------------------------
doc <- read_pptx()

# add a "Two Content" slide and then content ----
doc <- add_slide(doc, layout = "Two Content", master = "Office Theme")
doc <- ph_with(x = doc, value = pi, location = ph_location_type(type = "title") )
doc <- ph_with(x = doc, value = as.factor(letters[1:2]), location = ph_location_type(type = "ftr") )
doc <- ph_with(x = doc, value = c("Un titre", "Deux titre"), location = ph_location_left() )
doc <- ph_with(x = doc, value = iris[1:4, 3:5], location = ph_location_right() )

# add a "Title and Content" slide and then a ggplot object ----
if( require("ggplot2") ){
  doc <- add_slide(doc, layout = "Title and Content",
                   master = "Office Theme")
  gg_plot <- ggplot(data = iris ) +
    geom_point(mapping = aes(Sepal.Length, Petal.Length),
               size = 3) + theme_minimal()
  doc <- ph_with(x = doc, value = gg_plot, location = ph_location_fullsize() )
}

# add an image ----
doc <- add_slide(doc, layout = "Title and Content", master = "Office Theme")
img.file <- file.path( R.home("doc"), "html", "logo.jpg" )
doc <- ph_with(x = doc, external_img(img.file, 100/72, 76/72), 
  location = ph_location_type(type = "body") )

# add an unordered_list at a specific location ----
ul <- unordered_list(
  level_list = c(1, 2, 2, 3, 3, 1),
  str_list = c("Level1", "Level2", "Level2", "Level3", "Level3", "Level1"),
  style = fp_text(color = "red", font.size = 0) )

doc <- add_slide(doc, layout = "Title and Content", master = "Office Theme")
doc <- ph_with(x = doc, value = ul, 
               location = ph_location_type(type = "body") )

# add an block_list at a specific location ----
bl <- block_list(
  fpar(ftext("hello world", fp_text(bold = TRUE))),
  fpar(
    ftext("hello", fp_text(bold = TRUE, font.size = 30)),
    ftext(" world", prop = fp_text(color = "red", font.size = 30) )
  )
)

doc <- add_slide(doc, layout = "Title and Content", master = "Office Theme")
doc <- ph_with(x = doc, value = bl, 
               location = ph_location(label = "my_name",
                 left = 2, top = 3, width = 4, height = 4, 
                 bg = "wheat", rotation = 90) 
       )

print(doc, target = "assets/pptx/ph_with_demo.pptx")

## ----echo=FALSE----------------------------------------------------------
office_doc_link( url = paste0( "https://davidgohel.github.io/officer/articles/", "assets/pptx/ph_with_demo.pptx" ) )

## ------------------------------------------------------------------------
slide_summary(doc)

## ------------------------------------------------------------------------
doc <- ph_remove(x = doc, ph_label = "my_name")

## ------------------------------------------------------------------------
my_pres <- read_pptx() %>% 
  add_slide(layout = "Title and Content", master = "Office Theme") %>% 
  ph_empty(location = ph_location_right())
slide_summary(my_pres)

## ------------------------------------------------------------------------
text_prop <- fp_text(color = "red", font.size = 40)
my_pres <- my_pres %>% 
  ph_add_par(ph_label = "Content Placeholder 3") %>%
  ph_add_text(str = "This is a red text!", style = text_prop, ph_label = "Content Placeholder 3") %>% 
  ph_add_par(level = 2, ph_label = "Content Placeholder 3") %>%
  ph_add_text(str = "Level 2", ph_label = "Content Placeholder 3") %>% 
  ph_add_par(level = 3, ph_label = "Content Placeholder 3") %>%
  ph_add_text(str = "Level 3", ph_label = "Content Placeholder 3")

print(my_pres, target = "assets/pptx/ph_add_text_1.pptx")

## ----echo=FALSE----------------------------------------------------------
office_doc_link( url = paste0( "https://davidgohel.github.io/officer/articles/", "assets/pptx/ph_add_text_1.pptx" ) )

## ------------------------------------------------------------------------
my_pres <- read_pptx() %>% 
  add_slide(layout = "Title and Content", master = "Office Theme") %>% 
  ph_with(value = "A first text", location = ph_location_type(type = "body"))
slide_summary(my_pres)

## ------------------------------------------------------------------------
text_blue_prop <- update(text_prop, color = "blue" )
my_pres <- my_pres %>% 
  ph_add_text(str = "A small red text!", style = text_prop, ph_label = "Content Placeholder 2" ) %>% 
  ph_add_text(str = "Blue text first... ", pos = "before", style = text_blue_prop, ph_label = "Content Placeholder 2" ) %>% 
  ph_add_par(level = 2, ph_label = "Content Placeholder 2") %>%
  ph_add_text(str = "additional paragraph", ph_label = "Content Placeholder 2")

print(my_pres, target = "assets/pptx/ph_add_text_2.pptx") 

## ----echo=FALSE----------------------------------------------------------
office_doc_link( url = paste0( "https://davidgohel.github.io/officer/articles/", "assets/pptx/ph_add_text_2.pptx" ) )

## ------------------------------------------------------------------------
doc <- read_pptx() %>% 
  add_slide(layout = "Title and Content", master = "Office Theme") %>% 
  ph_with("Blah blah blah", location = ph_location_type(type = "body")) %>% 
  ph_hyperlink(ph_label = "Content Placeholder 2", href = "https://cran.r-project.org") 

print(doc, target = "assets/pptx/ph_hyperlink.pptx")

## ----echo=FALSE----------------------------------------------------------
office_doc_link( url = paste0( "https://davidgohel.github.io/officer/articles/", "assets/pptx/ph_hyperlink.pptx" ) )

## ------------------------------------------------------------------------
doc <- read_pptx() %>% 
  add_slide(layout = "Title and Content", master = "Office Theme") %>% 
  ph_with("Blah blah blah", location = ph_location_type(type = "body")) %>% 
  add_slide(layout = "Title and Content", master = "Office Theme") %>% 
  ph_with("placeholder target", location = ph_location_type(type = "title")) %>% 
  on_slide(index = 1 ) %>% 
  ph_slidelink(ph_label = "Content Placeholder 2", slide_index = 2)

print(doc, target = "assets/pptx/ph_slidelink.pptx")

## ----echo=FALSE----------------------------------------------------------
office_doc_link( url = paste0( "https://davidgohel.github.io/officer/articles/", "assets/pptx/ph_slidelink.pptx" ) )

## ------------------------------------------------------------------------
my_pres <- read_pptx() %>% 
  add_slide(layout = "Title and Content", master = "Office Theme") %>% 
  ph_with(value = "An ", location = ph_location_type(type = "body")) %>% 
  ph_add_text(str = "hyperlink", href = "https://cran.r-project.org", 
              ph_label = "Content Placeholder 2", )

print(my_pres, target = "assets/pptx/ph_add_text_3.pptx")

## ----echo=FALSE----------------------------------------------------------
office_doc_link( url = paste0( "https://davidgohel.github.io/officer/articles/", "assets/pptx/ph_add_text_3.pptx" ) )

