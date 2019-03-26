library(affy)


### Name: expressoWidget
### Title: A widget for users to pick correction methods
### Aliases: expressoWidget
### Keywords: interface

### ** Examples

if(interactive()){
  require(widgetTools)
  expressoWidget(c("mas", "none", "rma"), c("constant", "quantiles"),
c("mas", "pmonly"), c("liwong", "playerout"))
}



