library(shinyHeatmaply)


### Name: html2tagList
### Title: html2tagList
### Aliases: html2tagList
### Keywords: internal

### ** Examples

## No test: 
x<-'<h1>Title</h1>
   <h2>Header text</h2>
   <p>Text here</p>
   <h1>Title</h1>
   <h2>Header text</h2>
   <p>Text here</p>'
   
 html2tagList(x)  

require(xtable)
htmlIn<-print(xtable::xtable(mtcars),type = 'html',print.results = F)
htmlIn
tagL<-html2tagList(htmlIn)
class(tagL)
tagL
if(interactive()) htmltools::browsable(tagL)
## End(No test)



