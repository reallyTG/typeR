library(diffr)


### Name: diffrOutput
### Title: Wrapper functions for using diffr in shiny
### Aliases: diffrOutput renderDiffr

### ** Examples

## No test: 
library(diffr)
library(shiny)
file1 = tempfile()
writeLines("hello, world!\n", con = file1)
file2 = tempfile()
writeLines(paste0(
"hello world?\nI don't get it\n",
paste0(sample(letters, 65, replace = TRUE), collapse = "")), con = file2)

ui <- fluidPage(
  h1("A diffr demo"),
  checkboxInput("wordWrap", "Word Wrap",
     value = TRUE),
   diffrOutput("exdiff")
)

server <- function(input, output, session) {
  output$exdiff <- renderDiffr({
    diffr(file1, file2, wordWrap = input$wordWrap,
    before = "f1", after = "f2")
  })
}

shinyApp(ui, server)
## End(No test)



