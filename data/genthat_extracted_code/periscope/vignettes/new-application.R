## ---- eval=F-------------------------------------------------------------
#  # Add a user action to the log
#  loginfo("Your Information Message with %s, %s parameters", parm1, parm2, logger = ss_userAction.Log)
#  
#  logwarn("Your Warning Message!", logger = ss_userAction.Log)

## ---- eval=F-------------------------------------------------------------
#  # Alert on Sidebar>Basic tab
#  createAlert(session, "sidebarBasicAlert",
#              style = "info",
#              content = "Basic Alert Text")
#  # Alert on Sidebar>Advanced tab
#  createAlert(session, "sidebarAdvancedAlert",
#              style = "danger",
#              content = "Advanced Alert Text")
#  # Alert in the Body Area
#  createAlert(session, "bodyAlert", style = "success",
#              content = "Body Alert Text", append = FALSE)

## ---- eval=F-------------------------------------------------------------
#  library(periscope)
#  
#  app_dir = tempdir()
#  create_new_application(name = 'mytestapp', location = app_dir, sampleapp = TRUE)

## ---- eval=F-------------------------------------------------------------
#  runApp('mytestapp', appDir = app_dir)

## ---- eval=F-------------------------------------------------------------
#  library(periscope)
#  
#  app_dir = tempdir()
#  create_new_application(name = 'mytestapp', location = app_dir)

## ---- eval=F-------------------------------------------------------------
#  runApp('mytestapp', appDir = app_dir)

## ---- eval=F-------------------------------------------------------------
#  # Plain text title
#  set_app_parameters(title = "My Application Title")
#  
#  # Application Title links to an external url
#  set_app_parameters(title = "My Application Title",
#                     titleinfo = "http://www.somelocation.com")
#  
#  # Application Title links to a modal window with HTML content
#  set_app_parameters(title = "My Application Title",
#                     titleinfo = HTML("<h3>This is information about this application</h3>",
#                                      "<p><b>Author: </b>Me</p>",
#                                      "<p><b>Date: </b>", Sys.Date(), "</p>"))

## ---- eval=F-------------------------------------------------------------
#  # -- Create UI sidebar Elements
#  s1 <- div( helpText(align = "center", "Sample UI Text"),
#                    selectInput("sample1", "A Select", c("A", "B", "C")) )
#  
#  s2 <- div( ui_tooltip("sample2_tt", "Pick An Option", "Popup Text"),
#                    radioButtons("sample2", NULL, c("A", "B", "C")) )
#  
#  # -- Register Basic Elements in the ORDER SHOWN in the UI
#  add_ui_sidebar_basic(list(s1, s2), append = FALSE)
#  
#  # -- Change the Label of the Basic Tab
#  add_ui_sidebar_basic(list(s1, s2), append = FALSE, tabname = "Options")

## ---- eval=F-------------------------------------------------------------
#  body1 <- box( id     = "bodyElement1",
#                title  = "Box 1",
#                width  = 8,          #2/3 of the width
#                status = "primary",  #colored bar at the top
#                collapsible = TRUE,
#                collapsed   = FALSE,
#                htmlOutput("example1") )
#  
#  body2 <- box( id     = "bodyElement2",
#                title  = "Box 2",
#                width  = 4,          #1/3 of the width
#                status = "danger",   #colored bar at the top
#                collapsible = FALSE,
#                p("Some great text in paragraph format"),
#                pre("A pre-formatted (eg code) block"),
#                actionButton("exButton", label = "Example") )
#  
#  add_ui_body(list(body1, body2))

## ---- eval=F-------------------------------------------------------------
#  source("program/fxn/makeplot.R")
#  
#  #build the deferred UI from ui_body.R
#  output$example1 <- renderUI({
#      list(downloadFileButton("ex_d1", c("csv"), "Download CSV"),
#           hr(),
#           p("Some great explanatory text in my application"))
#      })
#  
#  callModule(downloadFile, "ex_d1", ss_userAction.Log, "mydownload",
#             list(csv=get_ref_data))
#  
#  observeEvent(input$exButton, {
#      loginfo("exButton Pressed!", logger = ss_userAction.Log)
#      createAlert(session, "bodyAlert",
#                  style = "success",
#                  content = "Example Button Pressed!")
#  })

## ---- eval=F-------------------------------------------------------------
#  ref_data <- read.csv("program/data/mydata.csv")
#  
#  get_ref_data <- function() {
#      return(ref_data)
#  }

