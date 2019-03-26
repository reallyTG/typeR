library(manipulateWidget)


### Name: mwCheckbox
### Title: Add a checkbox to a manipulateWidget gadget
### Aliases: mwCheckbox

### ** Examples


if(require(plotly)) {
 manipulateWidget(
   {
       plot_ly(iris, x = ~Sepal.Length, y = ~Sepal.Width,
               color = ~Species, type = "scatter", mode = "markers") %>%
         layout(showlegend = legend)
   },
   legend = mwCheckbox(TRUE, "Show legend")
 )
}




