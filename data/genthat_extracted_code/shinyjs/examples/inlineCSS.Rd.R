library(shinyjs)


### Name: inlineCSS
### Title: Add inline CSS
### Aliases: inlineCSS

### ** Examples

if (interactive()) {
  library(shiny)

  # Method 1 - passing a string of valid CSS
  shinyApp(
    ui = fluidPage(
      inlineCSS("#big { font-size:30px; }
                 .red { color: red; border: 1px solid black;}"),
      p(id = "big", "This will be big"),
      p(class = "red", "This will be red and bordered")
    ),
    server = function(input, output) {}
  )

  # Method 2 - passing a list of CSS selectors/declarations
  # where each declaration is a full declaration block
  shinyApp(
    ui = fluidPage(
      inlineCSS(list(
        "#big" = "font-size:30px",
        ".red" = "color: red; border: 1px solid black;"
      )),
      p(id = "big", "This will be big"),
      p(class = "red", "This will be red and bordered")
    ),
    server = function(input, output) {}
  )

  # Method 3 - passing a list of CSS selectors/declarations
  # where each declaration is a vector of declarations
  shinyApp(
    ui = fluidPage(
      inlineCSS(list(
        "#big" = "font-size:30px",
        ".red" = c("color: red", "border: 1px solid black")
      )),
      p(id = "big", "This will be big"),
      p(class = "red", "This will be red and bordered")
    ),
    server = function(input, output) {}
  )
}



