library(shinymaterial)


### Name: material_file_input
### Title: Create a shinymaterial file input
### Aliases: material_file_input

### ** Examples

if (interactive()) {
  
  ui <- 
  material_page(
    material_row(
      material_column(
        width = 12,
        material_file_input(
          input_id = "file_1", 
          label = "file"
        )
      )
    ),
    material_row(
      material_column(
        width = 12,
        tableOutput("contents")
      )
    )
  )
  
  server <- function(input, output) {
    output$contents <- renderTable({
      # input$file_1 will be NULL initially. After the user selects
      # and uploads a file, it will be a data frame with 'name',
      # 'size', 'type', and 'datapath' columns. The 'datapath'
      # column will contain the local filenames where the data can
      # be found.
      in_file <- input$file_1
      
      if (is.null(in_file))
        return(NULL)
      
      read.csv(in_file$datapath)
    })
  }
  
  shinyApp(ui, server)
  
}



