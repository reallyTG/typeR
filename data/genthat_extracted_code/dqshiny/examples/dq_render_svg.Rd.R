library(dqshiny)


### Name: dq_render_svg
### Title: Render ggplot2 figure as svg
### Aliases: dq_render_svg

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
shinyApp(
  ui = fluidPage(
    selectInput("select","Number of bars", choices=c(4,5,6)),
    br(),
    imageOutput("plot")
  ),
  server = function(input, output) {
    gf <- reactive({L <- as.integer(input$select)
                    gg <- ggplot2::ggplot(data=data.frame(x=seq(L), y=seq(L)),
                      ggplot2::aes(x=x, y=y)) + ggplot2::geom_bar(stat = "identity")
    })
    output$plot <- dq_render_svg(gf)
  }
)

}



