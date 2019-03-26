library(jsmodule)


### Name: GEEModuleLogistic
### Title: GEEModuleLogistic: shiny modulde server for binomial gaussian
###   generalized estimating equation(GEE) using reactive data.
### Aliases: GEEModuleLogistic

### ** Examples

library(shiny);library(DT);library(data.table);library(jstable)
ui <- fluidPage(
   sidebarLayout(
   sidebarPanel(
     GEEModuleUI("logistic")
   ),
   mainPanel(
     DTOutput("logistictable")
   )
 )
)

server <- function(input, output, session) {

  data <- reactive(mtcars)
  data.label <- reactive(jstable::mk.lev(mtcars))
  id.gee <- reactive("mpg")

  out_logistic <- callModule(GEEModuleLogistic, "logistic", data = data, data_label = data.label,
                             data_varStruct = NULL, id.gee = id.gee)

  output$logistictable <- renderDT({
    hide = which(colnames(out_logistic()$table) == "sig")
    datatable(out_logistic()$table, rownames=T, extension= "Buttons",
              caption = out_logistic()$caption,
              options = c(opt.tbreg(out_logistic()$caption),
                          list(columnDefs = list(list(visible=FALSE, targets =hide))
                          ),
                          list(scrollX = TRUE)
              )
    ) %>% formatStyle("sig", target = 'row',backgroundColor = styleEqual("**", 'yellow'))
  })
}



