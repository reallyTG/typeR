library(PreKnitPostHTMLRender)


### Name: preknit_knit_render_postrender
### Title: First Pre-knitting Processing, then knitr::knit, then
###   rmarkdown::render, then Post HTML-rendering Processing
### Aliases: preknit_knit_render_postrender

### ** Examples

## No test: 
oldwd <- getwd()
setwd(tempdir())

#pandoc.exe is required to run this code
samplermd <- tempfile('test', getwd(), '.Rmd')
addhtml <- 'test__test.html'

#generate the test Rmd file
writeLines(c('---',
'title: "Example Usage"',
'output: html_document',
'---',
'',
'This document is used for various similar reports.',
'',
'@@@',
"cat(paste('#Dynamic Header1', rnorm(1)))",
'@@@',
'',
'`%%% writeLines(readLines("test__test.html"))`',
'',
'@@@',
'cat(paste("##Dynamic Header2", rnorm(1)))',
'@@@',
'',
'Some content is invariant across different reports.'), samplermd)

#generate test html file
writeLines(c('<ul>',
'<li>Item 1</li>',
'<li>Item 2</li>',
'<li>Item 3</li>',
'</ul>'), addhtml)

#Pre-knit processing and post HTML render processing
preknit_knit_render_postrender(samplermd, "sample__html.html")

#output 'sample__html.html' is in tempdir()

setwd(oldwd)
## End(No test)




