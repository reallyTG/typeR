library(svMisc)


### Name: progress
### Title: Display progression of a long calculation at the R console
###   and/or in a GUI
### Aliases: progress
### Keywords: utilities

### ** Examples

# 1) A simple progress indicator in percent
for (i in 0:101) {
  progress(i)
  Sys.sleep(0.01)
  if (i == 101) message("Done!")
}

# 2) A progress indicator with 'x on y'
for (i in 0:31) {
  progress(i, 30)
  Sys.sleep(0.02)
  if (i == 31) message("Done!")
}

# 3) A progress bar in percent
for (i in 0:101) {
  progress(i, progress.bar = TRUE)
  Sys.sleep(0.01)
  if (i == 101) message("Done!")
}

# 4) A progress indicator with 'x on y'
for (i in 0:21) {
  progress(i, 20, progress.bar = TRUE)
  Sys.sleep(0.03)
  if (i == 21) message("Done!")
}

# 5) A progression dialog box with Tcl/Tk
## Not run: 
##D if (require(tcltk)) {
##D   gui_progress <- function(value, max.value) {
##D     # Do we need to destroy the progression dialog box?
##D     if (value > max.value) {
##D       try(tkdestroy(get_temp("gui_progress_window")), silent = TRUE)
##D       delete_temp(c("gui_progress_state", "gui_progress_window",
##D         "gui_progress_cancel"))
##D       return(invisible(FALSE))
##D     } else if (exists_temp("gui_progress_window") &&
##D       !inherits(try(tkwm.deiconify(tt <- get_temp("gui_progress_window")),
##D         silent = TRUE), "try-error")) {
##D       # The progression dialog box exists
##D       # Focus on it and change progress value
##D       tkfocus(tt)
##D       state <- get_temp("gui_progress_state")
##D       tclvalue(state) <- value
##D     } else {
##D       # The progression dialog box must be (re)created
##D       # First, make sure there is no remaining "gui_progress_cancel"
##D       delete_temp("gui_progress_cancel")
##D       # Create a Tcl variable to hold current progression state
##D       state <- tclVar(value)
##D       assign_temp("gui_progress_state", state)
##D       # Create the progression dialog box
##D       tt <- tktoplevel()
##D       assign_temp("gui_progress_window", tt)
##D       tktitle(tt) <- "Waiting..."
##D       sc <- tkscale(tt, orient = "h", state = "disabled", to = max.value,
##D         label = "Progress:", length = 200, variable = state)
##D       tkpack(sc)
##D       but <- tkbutton(tt, text = "Cancel", command = function() {
##D         # Set a flag telling to stop running calculation
##D         assign_temp("gui_progress_cancel", TRUE) # Content is not important!
##D         tkdestroy(tt)
##D       })
##D       tkpack(but)
##D     }
##D     invisible(TRUE)
##D   }
##D   # Register it as function to use in progress()
##D   change_temp(".progress", "gui_progress", gui_progress,
##D     replace.existing = TRUE)
##D   rm(gui_progress) # Don't need this any more
##D   # Test it...
##D   for (i in 0:101) {
##D     progress(i) # Could also set console = FALSE for using the GUI only
##D     Sys.sleep(0.05)
##D     # The code to stop long calc when user presses "Cancel"
##D     if (exists_temp("gui_progress_cancel")) {
##D       progress(101, console = FALSE) # Make sure to clean up everything
##D       break
##D     }
##D     if (i == 101) message("Done!")
##D   }
##D   # Unregister the GUI for progress
##D   change_temp(".progress", "gui_progress", NULL)
##D }
## End(Not run)



