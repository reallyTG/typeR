library(shinyhelper)


### Name: helper
### Title: Augment a shiny.tag with a question mark helper button
### Aliases: helper

### ** Examples

helper(shiny::actionButton("go", "click me!"),
       icon = "exclamation",
       colour = "red",
       type = "markdown",
       content = "ClickHelp")  # looks for 'helpfiles/ClickHelp.md'
       



