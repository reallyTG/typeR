library(htmltools)


### Name: htmlDependencies
### Title: HTML dependency metadata
### Aliases: htmlDependencies htmlDependencies<- attachDependencies

### ** Examples

# Create a JavaScript dependency
dep <- htmlDependency("jqueryui", "1.11.4", c(href="shared/jqueryui"),
                      script = "jquery-ui.min.js")

# A CSS dependency
htmlDependency(
  "font-awesome", "4.5.0", c(href="shared/font-awesome"),
  stylesheet = "css/font-awesome.min.css"
)

# A few different ways to add the dependency to tag objects:
# Inline as a child of the div()
div("Code here", dep)
# Inline in a tagList
tagList(div("Code here"), dep)
# With attachDependencies
attachDependencies(div("Code here"), dep)




