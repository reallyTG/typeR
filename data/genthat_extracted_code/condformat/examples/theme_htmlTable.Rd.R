library(condformat)


### Name: theme_htmlTable
### Title: Customizes appearance of condformat object
### Aliases: theme_htmlTable

### ** Examples

data(iris)
condformat(head(iris)) %>% theme_htmlTable(caption="Table 1: My iris table", rnames=FALSE)



