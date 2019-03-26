library(seleniumPipes)


### Name: switchToFrame
### Title: Change focus to another frame on the page.
### Aliases: switchToFrame

### ** Examples

## Not run: 
##D   remDr <- remoteDr()
##D   remDr %>% getWindowHandle() # The current window handle
##D   remDr %>% getWindowHandles() # All windows in the session
##D 
##D   # Get the window position
##D   remDr %>% getWindowPosition
##D 
##D   # Some browsers are still using the old JSON wire end points
##D   remDr %>% getWindowPositionOld
##D 
##D   # Get the size of the window
##D   remDr %>% getWindowSize
##D 
##D   # Some browsers are still using the old JSON wire end points
##D   # remDr %>% getWindowSizeOld
##D 
##D   # Set the window size
##D   remDr %>% setWindowSize(500, 500)
##D 
##D   # Some browsers are still using the old JSON wire end points
##D   remDr %>% setWindowSizeOld(500, 500)
##D 
##D   # Set the position of the window
##D   remDr %>% setWindowPositionOld(400, 100)
##D 
##D   # Some browsers are still using the old JSON wire end points
##D   # remDr %>% setWindowPositionOld(400, 100)
##D 
##D   # Maximise the window
##D   remDr %>% maximizeWindow
##D   # Some browsers are still using the old JSON wire end points
##D   # remDr %>% maximizeWindowold()
##D 
##D   remDr %>% go("http://www.google.com/ncr")
##D   # search for the "R project"
##D 
##D   remDr %>% findElement("name", "q") %>% elementSendKeys("R project", key = "enter")
##D 
##D   webElem <- remDr %>% findElement("css", "h3.r a")
##D 
##D   remDr %>% deleteSession
## End(Not run)



