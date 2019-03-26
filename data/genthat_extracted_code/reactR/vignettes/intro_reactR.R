## ------------------------------------------------------------------------
library(reactR)
library(htmltools)

attachDependencies(
  tags$script(
  "
    ReactDOM.render(
      React.createElement(
        'h1',
        null,
        'Powered by React'
      ),
      document.getElementById('react-heading-here')
    )
  "
  ),
  html_dependency_react()
)

