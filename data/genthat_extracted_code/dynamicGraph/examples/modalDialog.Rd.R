library(dynamicGraph)


### Name: modalDialog
### Title: Modal dialog window for returning a text string
### Aliases: modalDialog
### Keywords: dynamic

### ** Examples

Menus <- 
 list(MainUser = 
      list(label = "Test of user drag down menu - Position of \"vertices\"",
           command = function(object, ...) 
             print(Positions(list(...)$Arguments$vertexList))),
      MainUser = 
      list(label = "Test of user drag down menu - modalDialog",
           command = function(object, ...) {
             Args <- list(...)$Arguments
             ReturnVal <- modalDialog("Test modalDialog Entry", "Enter name",
                                      Args$control$title, 
                                      graphWindow = Args$graphWindow)
             print(ReturnVal)
             if (ReturnVal == "ID_CANCEL")
               return() } )
     )



