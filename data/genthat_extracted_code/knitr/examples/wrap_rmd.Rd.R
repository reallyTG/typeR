library(knitr)


### Name: wrap_rmd
### Title: Wrap long lines in Rmd files
### Aliases: wrap_rmd

### ** Examples

wrap_rmd(text = c("```", "1+1", "```", "- a list item", "> a quote", "", 
    paste(rep("this is a normal paragraph", 5), collapse = " ")))



