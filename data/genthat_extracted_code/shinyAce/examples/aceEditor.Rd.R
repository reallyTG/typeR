library(shinyAce)


### Name: aceEditor
### Title: Render Ace
### Aliases: aceEditor

### ** Examples

## Not run: 
##D  aceEditor(
##D    outputId = "myEditor", 
##D    value = "Initial text for editor here", 
##D    mode = "r", 
##D    theme = "ambiance"
##D  )
##D    
##D  aceEditor(
##D    outputId = "myCodeEditor", 
##D    value = "# Enter code", 
##D    mode = "r",
##D    hotkeys = list(
##D      helpKey = "F1",
##D      runKey = list(
##D        win = "Ctrl-R|Ctrl-Shift-Enter",
##D        mac = "CMD-ENTER|CMD-SHIFT-ENTER"
##D      )
##D    ),
##D    wordWrap = TRUE, debounce = 10
##D  ) 
##D    
##D  aceEditor(
##D    outputId = "mySmartEditor", 
##D    value = "plot(wt ~ mpg, data = mtcars)", 
##D    mode = "r",
##D    autoComplete = "live",
##D    autoCompleteList = list(mtcars = colnames(mtcars))
##D  )
## End(Not run) 




