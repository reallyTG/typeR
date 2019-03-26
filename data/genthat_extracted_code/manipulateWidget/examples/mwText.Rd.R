library(manipulateWidget)


### Name: mwText
### Title: Add a text input to a manipulateWidget gadget
### Aliases: mwText

### ** Examples

if (require(plotly)) {
  mydata <- data.frame(x = 1:100, y = rnorm(100))
  manipulateWidget({
      plot_ly(mydata, x=~x, y=~y, type = "scatter", mode = "markers") %>%
        layout(title = mytitle)
    },
    mytitle = mwText("Awesome title !")
  )
}




