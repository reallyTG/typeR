library(knitr)


### Name: knit2html
### Title: Convert markdown to HTML using knit() and markdownToHTML()
### Aliases: knit2html

### ** Examples

# a minimal example
writeLines(c("# hello markdown", "```{r hello-random, echo=TRUE}", "rnorm(5)", "```"), 
    "test.Rmd")
knit2html("test.Rmd")
if (interactive()) browseURL("test.html")



