library(pixels)


### Name: shiny_pixels_output
### Title: Shiny Widget Output
### Aliases: shiny_pixels_output

### ** Examples

library(shiny)

ui <- fluidPage(
  tags$head(
    tags$style(HTML("
      #pixels {
        height: 270px !important;
        margin-top: 10px;
      }
    "))
  ),
  titlePanel("Digit Capture Application"),
  textOutput("prompt"),
  shiny_pixels_output("pixels"),
  actionButton("captureDigit", "Capture")
)

server <- function(input, output) {
  output$pixels <- shiny_render_pixels(
    show_pixels()
  )

  digit <- reactiveVal(floor(runif(1, 1, 10)))
  output$prompt <- renderText(paste0("Please draw number ", digit(), ":"))

  observeEvent(input$captureDigit, {
    digit_path <- file.path("digits", digit())
    if (!dir.exists(digit_path)) dir.create(digit_path, recursive = TRUE)
    saveRDS(input$pixels, paste0(digit_path, "/", as.numeric(Sys.time()), ".rds"))
 
    digit(floor(runif(1, 1, 10)))
    output$pixels <- shiny_render_pixels(
      show_pixels()
    )
  })
}

if (interactive()) {
  shinyApp(ui = ui, server = server)
}




