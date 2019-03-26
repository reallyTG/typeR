library(lazyWeave)


### Name: lazy.text.format
### Title: Format Text
### Aliases: lazy.text.format

### ** Examples

lazy.text.format("This is the text")
lazy.text.format("This is the text", italic=TRUE)
lazy.text.format("This is the text", bold=TRUE)
lazy.text.format("This is the text", italic=TRUE, bold=TRUE)

lazy.text("The percentage of defective lightbulbs in this sample was ", 
          lazy.text.format("30%", italic=TRUE),
          ". Clearly, this is unacceptable.")




