library(AMCTestmakeR)


### Name: AMCcreateelements
### Title: Generate AMC LaTeX question group ("element") codes
### Aliases: AMCcreateelements

### ** Examples

#To output a message (not visible in documentation)
AMCcreateelements(c(1:4))

#To output a list
AMCcreateelements(c(1:4), output = "list")

#Duplicates are automatically removed
AMCcreateelements(rep(1:3, 5), output = "list")

#To cancel shuffling
AMCcreateelements(c(1:4), output = "list", shufflequestions = FALSE)

#To remove sections at each element
AMCcreateelements(c(1:4), sections = FALSE, output = "list")

#To add sections for only last element
AMCcreateelements(c(1:4),
sections = c(FALSE,FALSE,FALSE,TRUE),
output = "list")



