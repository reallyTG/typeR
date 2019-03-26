library(shiny)


### Name: tag
### Title: HTML Tag Object
### Aliases: tag tagAppendAttributes tagAppendChild tagAppendChildren
###   tagList tagSetChildren

### ** Examples

tagList(tags$h1("Title"),
        tags$h2("Header text"),
        tags$p("Text here"))

# Can also convert a regular list to a tagList (internal data structure isn't
# exactly the same, but when rendered to HTML, the output is the same).
x <- list(tags$h1("Title"),
          tags$h2("Header text"),
          tags$p("Text here"))
tagList(x)



