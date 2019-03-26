library(seminr)


### Name: relationships
### Title: Structural specification functions for seminr package
### Aliases: relationships paths

### ** Examples

mobi_sm <- relationships(
             paths(from = "Image",        to = c("Expectation", "Satisfaction", "Loyalty")),
             paths(from = "Expectation",  to = c("Quality", "Value", "Satisfaction")),
             paths(from = "Quality",      to = c("Value", "Satisfaction")),
             paths(from = "Value",        to = c("Satisfaction")),
             paths(from = "Satisfaction", to = c("Complaints", "Loyalty")),
             paths(from = "Complaints",   to = "Loyalty")
           )




