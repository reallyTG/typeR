library(shiny)


### Name: withTags
### Title: Evaluate an expression using 'tags'
### Aliases: withTags

### ** Examples

# Using tags$ each time
tags$div(class = "myclass",
  tags$h3("header"),
  tags$p("text")
)

# Equivalent to above, but using withTags
withTags(
  div(class = "myclass",
    h3("header"),
    p("text")
  )
)



