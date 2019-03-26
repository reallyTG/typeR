library(svGUI)


### Name: setUI
### Title: Set a property in the UI (User Interface), or start an action.
### Aliases: setUI setUI.gui startUI startUI.gui
### Keywords: misc

### ** Examples

# Imagine you implement a new input box
# In your function, you have this code:
myInput <- function(default = "an answer", gui = .GUI) {

  # Start a GUI action... or by-pass it!
  if (gui$startUI("myInput", call = match.call(), default = default,
    msg = "Displaying an input dialog box",
    msg.no.ask = "An input dialog box was by-passed")) {

    # Here the input dialog box is displayed and R waits for user feedback
    # ... [your code here]
    res <- "some results" # Imagine this is the text typed in the box

    # When the input dialog box is closed, the function should do:
    setUI(res = res, status = NULL)
  }
  invisible(gui)
}



