## ---- eval=FALSE---------------------------------------------------------
#  useShinyFeedback()

## ---- eval=FALSE---------------------------------------------------------
#  library(shiny)
#  library(shinyFeedback)
#  
#  ui <- fluidPage(
#    useShinyFeedback(), # include shinyFeedback
#  
#    numericInput(
#      "warningInput",
#      "Warn if Negative",
#      value = 0
#    )
#  )
#  
#  server <- function(input, output) {
#    observeEvent(input$warningInput, {
#      feedbackWarning(
#        inputId = "warningInput",
#        condition = input$warningInput < 0
#      )
#    })
#  }
#  
#  shinyApp(ui, server)

## ----eval = FALSE--------------------------------------------------------
#  ?feedbackWarning

## ---- eval = FALSE-------------------------------------------------------
#  ui <- fluidPage(
#    useShinyFeedback(), # include shinyFeedback
#  
#    numericInput(
#      "multiFeedbacks",
#      "1 is scary 2 is dangerous",
#      value = 1
#    )
#  )
#  
#  server <- function(input, output) {
#    observeEvent(input$multiFeedbacks, {
#      feedbackWarning(
#        inputId = "multiFeedbacks",
#        condition = input$multiFeedbacks >= 1,
#        text = "Warning 1 is a lonely number"
#      )
#      feedbackDanger(
#        inputId = "multiFeedbacks",
#        condition = input$multiFeedbacks >= 2,
#        text = "2+ is danger"
#      )
#    })
#  }
#  
#  shinyApp(ui, server)

## ----modal_eg, eval = FALSE----------------------------------------------
#  ui <- fluidPage(
#    useShinyFeedback(), # include shinyFeedback
#    actionButton("show", "Show modal dialog")
#  )
#  
#  server <- function(input, output) {
#    observeEvent(input$show, {
#        showModal(modalDialog(
#          title = "Important message",
#          passwordInput(
#            "password",
#            "Password"
#          )
#        ))
#      })
#  
#  
#    observe({
#      input$show
#  
#      feedbackDanger(
#        inputId = "password",
#        condition = nchar(input$password) < 4,
#        text = "Password must be >= 4 characters"
#      )
#    })
#  }
#  
#  shinyApp(ui, server)

## ----snackbar_wrappers, eval = FALSE-------------------------------------
#  ui <- fluidPage(
#     useShinyFeedback(),
#     br(),
#  
#     actionButton(
#       "showSnackbarBtn",
#       "Show Snackbar"
#     ),
#  
#     snackbar(
#       id = "mySnackbar",
#       message = "You just did something!"
#     )
#  )
#  
#  server <- function(input, output) {
#    observeEvent(input$showSnackbarBtn, {
#      showSnackbar("mySnackbar")
#    })
#  }
#  
#  shinyApp(ui, server)

## ----snackbar, eval = FALSE----------------------------------------------
#  ui <- fluidPage(
#     useShinyFeedback(),
#     br(),
#  
#     actionButton(
#       "showSuccessSnackbar",
#       "Show Success Snack",
#       class = "btn-success"
#     ),
#     actionButton(
#       "showWarningSnackbar",
#       "Show Warning Snack",
#       class = "btn-warning"
#     ),
#     actionButton(
#       "showDangerSnackbar",
#       "Show Danger Snack",
#       class = "btn-danger"
#     ),
#  
#  
#     snackbarSuccess(
#       id = "successSnackbar",
#       message = "You just did something successfully!"
#     ),
#     snackbarWarning(
#       id = "warningSnackbar",
#       message = "You just did something that might be bad?"
#     ),
#     snackbarDanger(
#       id = "dangerSnackbar",
#       message = "You just did something bad!"
#     )
#  )
#  
#  server <- function(input, output) {
#    observeEvent(input$showSuccessSnackbar, {
#      showSnackbar("successSnackbar")
#    })
#  
#    observeEvent(input$showWarningSnackbar, {
#      showSnackbar("warningSnackbar")
#    })
#  
#    observeEvent(input$showDangerSnackbar, {
#      showSnackbar("dangerSnackbar")
#    })
#  }
#  
#  shinyApp(ui, server)

