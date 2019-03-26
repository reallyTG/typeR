library(rchallenge)


### Name: icon
### Title: HTML code for icons. Currently only supports Font Awesome icons.
### Aliases: icon

### ** Examples

rmd <- '
```{r}
library(rchallenge)
```
<link rel="stylesheet" 
 href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
`r icon("fa-user")`
`r icon("fa-user fa-lg")`
`r icon("fa-user fa-2x")`
`r icon("fa-user fa-3x")`
`r icon("fa-user fa-3x fa-border")`
'
file <- tempfile()
cat(rmd, file=file)
writeLines(readLines(file))
rmarkdown::render(file)



