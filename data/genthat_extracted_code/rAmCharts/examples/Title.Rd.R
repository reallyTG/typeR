library(rAmCharts)


### Name: initialize,Title-method
### Title: Initializes A Title
### Aliases: initialize,Title-method title amTitle
###   setText,Title,character-method setSize setSize,Title,numeric-method

### ** Examples

new("Title", size = 10)
rAmCharts:::title(text = "Main", size = 10)
rAmCharts:::title(text = "Main", bold = TRUE)
amTitle(text = "Main", size = 10)
amTitle(text = "Main", bold = TRUE)
setText(.Object = amTitle(), text = "Bonjour")
setSize(amTitle(), 16)



