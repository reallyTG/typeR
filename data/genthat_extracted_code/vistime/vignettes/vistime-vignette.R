## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE----------------------------------------------------------
#  install.packages("vistime")

## ------------------------------------------------------------------------
if(!require("devtools")) install.packages("devtools")
devtools::install_github("shosaco/vistime")

## ----eval=FALSE----------------------------------------------------------
#  library(vistime)

## ----eval=FALSE----------------------------------------------------------
#  vistime(data, start = "start", end = "end", groups = "group", events = "event", colors = "color",
#                fontcolors = "fontcolor", tooltips = "tooltip", linewidth = NULL,
#                title = NULL, showLabels = TRUE, background_lines = 11)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(
tibble::tribble(~parameter,  ~`optional?`, ~`data type`, ~explanation,
"data", "mandatory", "data.frame", "data.frame that contains the data to be visualised",
"start", "optional", "character", "the column name in data that contains start dates. Default: *start*",
"end", "optional", "character", "the column name in data that contains end dates. Default: *end*",
"groups", "optional", "character", "the column name in data to be used for grouping. Default: *group*",
"events", "optional", "character", "the column name in data that contains event names. Default: *event*",
"colors", "optional", "character", "the column name in data that contains colors for events. Default: *color*, if not present, colors are chosen via RColorBrewer.",
"fontcolors", "optional", "character", "the column name in data that contains the font color for event labels. Default: *fontcolor*, if not present, color will be black.",
"tooltips", "optional", "character", "the column name in data that contains the mouseover tooltips for the events. Default: *tooltip*, if not present, then tooltips are concatenated from event name and date. [Basic HTML](https://help.plot.ly/adding-HTML-and-links-to-charts/#step-2-the-essentials) is allowed.",
"linewidth", "optional", "numeric", "override the calculated linewidth for events. Default: heuristic value.",
"title", "optional", "character", "the title to be shown on top of the timeline. Default: empty.",
"showLabels", "optional", "logical", "choose whether or not event labels shall be visible. Default: `TRUE`.",
"background_lines", "optional", "integer", "the number of vertical lines to draw in the background to demonstrate structure. Default: 10."))

## ----eval=FALSE----------------------------------------------------------
#  pres <- data.frame(Position = rep(c("President", "Vice"), each = 3),
#                     Name = c("Washington", rep(c("Adams", "Jefferson"), 2), "Burr"),
#                     start = c("1789-03-29", "1797-02-03", "1801-02-03"),
#                     end = c("1797-02-03", "1801-02-03", "1809-02-03"),
#                     color = c('#cbb69d', '#603913', '#c69c6e'),
#                     fontcolor = c("black", "white", "black"))
#  
#  vistime(pres, events="Position", groups="Name", title="Presidents of the USA")

## ----echo=FALSE, out.width = "100%"--------------------------------------
knitr::include_graphics("../inst/img/ex2.png")

## ----eval=FALSE----------------------------------------------------------
#  data <- read.csv(text="event,group,start,end,color
#                         Phase 1,Project,2016-12-22,2016-12-23,#c8e6c9
#                         Phase 2,Project,2016-12-23,2016-12-29,#a5d6a7
#                         Phase 3,Project,2016-12-29,2017-01-06,#fb8c00
#                         Phase 4,Project,2017-01-06,2017-02-02,#DD4B39
#                         Room 334,Team 1,2016-12-22,2016-12-28,#DEEBF7
#                         Room 335,Team 1,2016-12-28,2017-01-05,#C6DBEF
#                         Room 335,Team 1,2017-01-05,2017-01-23,#9ECAE1
#                         Group 1,Team 2,2016-12-22,2016-12-28,#E5F5E0
#                         Group 2,Team 2,2016-12-28,2017-01-23,#C7E9C0
#                         1-217.0,category 2,2016-12-27,2016-12-27,#90caf9
#                         3-200,category 1,2016-12-25,2016-12-25,#1565c0
#                         3-330,category 1,2016-12-25,2016-12-25,#1565c0
#                         3-223,category 1,2016-12-28,2016-12-28,#1565c0
#                         3-225,category 1,2016-12-28,2016-12-28,#1565c0
#                         3-226,category 1,2016-12-28,2016-12-28,#1565c0
#                         3-226,category 1,2017-01-19,2017-01-19,#1565c0
#                         3-330,category 1,2017-01-19,2017-01-19,#1565c0
#                         4-399.7,moon rising,2017-01-13,2017-01-13,#f44336
#                         8-831.0,sundowner drink,2017-01-17,2017-01-17,#8d6e63
#                         9-984.1,birthday party,2016-12-22,2016-12-22,#90a4ae
#                         F01.9,Meetings,2016-12-26,2016-12-26,#e8a735
#                         Z71,Meetings,2017-01-12,2017-01-12,#e8a735
#                         B95.7,Meetings,2017-01-15,2017-01-15,#e8a735
#                         T82.7,Meetings,2017-01-15,2017-01-15,#e8a735")
#  
#  vistime(data)

## ----echo=FALSE, out.width = "100%"--------------------------------------
knitr::include_graphics("../inst/img/ex3.png")

## ----eval=FALSE----------------------------------------------------------
#  chart <- vistime(pres, events="Position")
#  export(chart, file = "presidents.pdf")

## ----eval=FALSE----------------------------------------------------------
#  library(shiny)
#  library(plotly)
#  library(vistime)
#  
#  pres <- data.frame(Position = rep(c("President", "Vice"), each = 3),
#                     Name = c("Washington", rep(c("Adams", "Jefferson"), 2), "Burr"),
#                     start = c("1789-03-29", "1797-02-03", "1801-02-03"),
#                     end = c("1797-02-03", "1801-02-03", "1809-02-03"),
#                     color = c('#cbb69d', '#603913', '#c69c6e'),
#                     fontcolor = c("black", "white", "black"))
#  
#  shinyApp(
#    ui = plotlyOutput("myVistime"),
#    server = function(input, output) {
#      output$myVistime <- renderPlotly({
#        vistime(pres, events="Position", groups="Name")
#      })
#    }
#  )

## ----eval=FALSE----------------------------------------------------------
#  pres <- data.frame(Position = rep(c("President", "Vice"), each = 3),
#                     Name = c("Washington", rep(c("Adams", "Jefferson"), 2), "Burr"),
#                     start = c("1789-03-29", "1797-02-03", "1801-02-03"),
#                     end = c("1797-02-03", "1801-02-03", "1809-02-03"),
#                     color = c('#cbb69d', '#603913', '#c69c6e'),
#                     fontcolor = c("black", "white", "black"))
#  
#  p <- vistime(pres, events="Position", groups="Name", title="Presidents of the USA")
#  
#  # step 1: transform into a list
#  pp <- plotly_build(p)
#  
#  # step 2: change the font size
#  pp$x$layout$xaxis$tickfont <- list(size = 28)
#  
#  pp

## ----echo=FALSE, out.width = "50%"---------------------------------------
knitr::include_graphics("../inst//img/ex2-tickfontsize.png")

## ----eval=FALSE----------------------------------------------------------
#  # loop through the yaxes and change the font size for each element:
#  for(i in grep("yaxis*", names(pp$x$layout))){
#       pp$x$layout[[i]]$tickfont <- list(size = 28)
#  }
#  
#  pp

## ----echo=FALSE, out.width = "50%"---------------------------------------
knitr::include_graphics("../inst//img/ex2-yfontsize.png")

## ----eval=FALSE----------------------------------------------------------
#  pres <- data.frame(Position = rep(c("President", "Vice"), each = 3),
#                      Name = c("Washington", rep(c("Adams", "Jefferson"), 2), "Burr"),
#                      start = c("1789-03-29", "1797-02-03", "1801-02-03"),
#                      end = c("1797-02-03", "1801-02-03", "1809-02-03"),
#                      color = c('#cbb69d', '#603913', '#c69c6e'),
#                      fontcolor = c("black", "white", "black"))
#  
#  p <- vistime(pres, events="Position", groups="Name", title="Presidents of the USA")
#  
#  # step 1: transform into a list
#  pp <- plotly_build(p)
#  
#  # step 2: loop over pp$x$data, and change the font size of all text elements to 28
#  for(i in 1:length(pp$x$data)){
#      if(pp$x$data[[i]]$mode == "text") pp$x$data[[i]]$textfont$size <- 28
#  }
#  
#  pp

## ----echo=FALSE, out.width = "50%"---------------------------------------
knitr::include_graphics("../inst//img/ex2-eventfontsize.png")

## ----eval=FALSE----------------------------------------------------------
#  dat <- data.frame(event = 1:4, start = c(Sys.Date(), Sys.Date() + 10))
#  
#  p <- vistime(dat)
#  
#  # step 1: transform into a list
#  pp <- plotly_build(p)
#  
#  # step 2: loop over pp$x$data, and change the marker size of all text elements to 50px
#  for(i in 1:length(pp$x$data)){
#      if(pp$x$data[[i]]$mode == "markers") pp$x$data[[i]]$marker$size <- 10
#  }
#  
#  pp

## ----echo=FALSE, out.width = "50%"---------------------------------------
knitr::include_graphics("../inst//img/ex3-markersize.png")

