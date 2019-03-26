library(manipulateWidget)


### Name: combineWidgets
### Title: Combine several interactive plots
### Aliases: combineWidgets

### ** Examples

if (require(plotly)) {
  data(iris)

  combineWidgets(title = "The Iris dataset",
    plot_ly(iris, x = ~Sepal.Length, type = "histogram", nbinsx = 20),
    plot_ly(iris, x = ~Sepal.Width, type = "histogram", nbinsx = 20),
    plot_ly(iris, x = ~Petal.Length, type = "histogram", nbinsx = 20),
    plot_ly(iris, x = ~Petal.Width, type = "histogram", nbinsx = 20)
  )

  # Create a more complex layout by nesting combinedWidgets
  combineWidgets(title = "The iris data set: sepals", ncol = 2, colsize = c(2,1),
    plot_ly(iris, x = ~Sepal.Length, y = ~Sepal.Width, type = "scatter",
            mode = "markers", color = ~Species),
    combineWidgets(
      plot_ly(iris, x = ~Sepal.Length, type = "histogram", nbinsx = 20),
      plot_ly(iris, x = ~Sepal.Width, type = "histogram", nbinsx = 20)
    )
  )

  # combineWidgets can also be used on a single widget to easily add to it a
  # title and a footer.
  require(shiny)
  comments <- tags$div(
    "Wow this plot is so ",
    tags$span("amazing!!", style = "color:red;font-size:36px")
  )

  combineWidgets(
    plot_ly(iris, x = ~Sepal.Length, type = "histogram", nbinsx = 20),
    title = "Distribution of Sepal Length",
    footer = comments
  )

  # It is also possible to combine htmlwidgets with text or other html elements
  myComment <- tags$div(
    style="height:100%;background-color:#eee;padding:10px;box-sizing:border-box",
    tags$h2("Comment"),
    tags$hr(),
    "Here is a very clever comment about the awesome graphics you just saw."
  )
  combineWidgets(
    plot_ly(iris, x = ~Sepal.Length, type = "histogram", nbinsx = 20),
    plot_ly(iris, x = ~Sepal.Width, type = "histogram", nbinsx = 20),
    plot_ly(iris, x = ~Petal.Length, type = "histogram", nbinsx = 20),
    myComment
  )

  # Updating individual widgets.
  myWidget <- combineWidgets(
    plot_ly(iris, x = ~Sepal.Length, type = "histogram", nbinsx = 20),
    plot_ly(iris, x = ~Sepal.Width, type = "histogram", nbinsx = 20),
    ncol = 2
  )
  myWidget


  myWidget$widgets[[1]] <- myWidget$widgets[[1]] %>%
    layout(title = "Histogram of Sepal Length")

  myWidget$widgets[[2]] <- myWidget$widgets[[2]] %>%
    layout(title = "Histogram of Sepal Width")

  myWidget


  # Instead of passing directly htmlwidgets to the function, one can pass
  # a list containing htmlwidgets. This is especially useful when the widgets
  # are generated using a loop function like "lapply" or "replicate".
  #
  # The following code generates a list of 12 histograms and use combineWidgets
  # to display them.
  samples <- replicate(12, plot_ly(x = rnorm(100), type = "histogram", nbinsx = 20),
                       simplify = FALSE)
  combineWidgets(list = samples, title = "12 samples of the same distribution")
}




