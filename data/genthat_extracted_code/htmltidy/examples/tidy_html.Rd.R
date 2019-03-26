library(htmltidy)


### Name: tidy_html.response
### Title: Tidy or "Pretty Print" HTML/XHTML Documents
### Aliases: tidy_html.response tidy_html tidy_html.default
###   tidy_html.character tidy_html.raw tidy_html.xml_document
###   tidy_html.HTMLInternalDocument tidy_html.connection

### ** Examples

opts <- list(
  TidyDocType="html5",
  TidyMakeClean=TRUE,
  TidyHideComments=TRUE,
  TidyIndentContent=TRUE,
  TidyWrapLen=200
)

txt <- paste0(
  c("<html><head><style>p { color: red; }</style><body><!-- ===== body ====== -->",
"<p>Test</p></body><!--Default Zone --> <!--Default Zone End--></html>"),
  collapse="")

cat(tidy_html(txt, option=opts))

## Not run: 
##D library(httr)
##D res <- GET("https://rud.is/test/untidy.html")
##D 
##D # look at the original, un-tidy source
##D cat(content(res, as="text", encoding="UTF-8"))
##D 
##D # see the tidied version
##D cat(tidy_html(content(res, as="text", encoding="UTF-8"),
##D               list(TidyDocType="html5", TidyWrapLen=200)))
##D 
##D # but, you could also just do:
##D cat(tidy_html(url("https://rud.is/test/untidy.html")))
## End(Not run)



