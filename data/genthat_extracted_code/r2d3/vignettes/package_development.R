## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(eval = FALSE)

## ------------------------------------------------------------------------
#  d3_barchart <- function(data, color = "orange", width = NULL, height = NULL) {
#    r2d3::r2d3(
#      data = data,
#      script = system.file("d3/barchart/barchart.js", package = "d3barchart"),
#      width = width,
#      height = height
#    )
#  }

## ------------------------------------------------------------------------
#  htmlwidgets::createWidget(
#    "mywidget",
#    x,
#    width = width,
#    height = height,
#    package = "mypackage",
#    dependencies = r2d3::html_dependencies_d3(version = "4")
#  )

## ------------------------------------------------------------------------
#  htmlwidgets::createWidget(
#    "mywidget",
#    x,
#    width = width,
#    height = height,
#    package = "mypackage",
#    dependencies = r2d3::html_dependencies_d3(version = "4",
#                                              extensions = "d3-jetpack")
#  )

