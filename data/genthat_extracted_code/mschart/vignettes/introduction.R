## ----'setup', echo = FALSE, message=FALSE, warning=FALSE-----------------
dir.create("assets/pptx", recursive = TRUE, showWarnings = FALSE)
dir.create("assets/docx", recursive = TRUE, showWarnings = FALSE)
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
library(mschart)
library(officer)
library(magrittr)

## ------------------------------------------------------------------------
my_barchart <- ms_barchart(data = browser_data, 
  x = "browser", y = "value", group = "serie")

## ----results='hide'------------------------------------------------------
library(officer)
doc <- read_pptx()
doc <- add_slide(doc, layout = "Title and Content", master = "Office Theme")
doc <- ph_with_chart(doc, chart = my_barchart)
print(doc, target = "assets/pptx/barchart_01_stacked.pptx")

## ----echo=FALSE----------------------------------------------------------
office_doc_link( url = paste0( "https://ardata-fr.github.io/mschart/articles/", "assets/pptx/barchart_01_stacked.pptx" ) )

## ----results='hide'------------------------------------------------------
doc <- read_docx()
doc <- body_add_chart(doc, chart = my_barchart, style = "Normal")
print(doc, target = "assets/docx/barchart_01_stacked.docx")

## ----echo=FALSE----------------------------------------------------------
office_doc_link( url = paste0( "https://ardata-fr.github.io/mschart/articles/", "assets/docx/barchart_01_stacked.docx" ) )

## ------------------------------------------------------------------------
my_barchart <- chart_settings( my_barchart, grouping = "stacked", gap_width = 50, overlap = 100 )

## ------------------------------------------------------------------------
my_barchart <- chart_ax_x(my_barchart, cross_between = 'between', 
  major_tick_mark = "in", minor_tick_mark = "none")
my_barchart <- chart_ax_y(my_barchart, num_fmt = "0.00", rotation = -90)

## ------------------------------------------------------------------------
my_barchart <- chart_labels(my_barchart, title = "A main title", 
  xlab = "x axis title", ylab = "y axis title")

## ------------------------------------------------------------------------
my_barchart <- chart_data_fill(my_barchart,
  values = c(serie1 = "#003C63", serie2 = "#ED1F24", serie3 = "#F2AA00") )
my_barchart <- chart_data_stroke(my_barchart, values = "transparent" )

