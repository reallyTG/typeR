library(reactR)


### Name: html_dependency_react
### Title: Dependencies for React
### Aliases: html_dependency_react

### ** Examples

library(reactR)
library(htmltools)

tagList(
  tags$script(
  "
    ReactDOM.render(
      React.createElement(
        'h1',
        null,
        'Powered by React'
      ),
      document.body
    )
  "
  ),
   #add core-js first to work in RStudio Viewer
  html_dependency_corejs(),
  html_dependency_react() #offline=FALSE for CDN
)



