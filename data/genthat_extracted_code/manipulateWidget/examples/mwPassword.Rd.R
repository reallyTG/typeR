library(manipulateWidget)


### Name: mwPassword
### Title: Add a password to a manipulateWidget gadget
### Aliases: mwPassword

### ** Examples

if (require(plotly)) {
  manipulateWidget(
    {
      if (passwd != 'abc123') {
        plot_ly(type = "scatter", mode="markers") %>%
          layout(title = "Wrong password. True password is 'abc123'")
      } else {
        plot_ly(data.frame(x = 1:10, y = rnorm(10)), x=~x, y=~y, type = "scatter", mode = "markers")
      }
    },
    user = mwText(label = "Username"),
    passwd = mwPassword(label = "Password")
  )
}




