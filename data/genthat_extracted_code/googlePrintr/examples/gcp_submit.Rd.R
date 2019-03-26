library(googlePrintr)


### Name: gcp_submit
### Title: Submit print job to printer
### Aliases: gcp_submit

### ** Examples

## Not run: 
##D printer <- gcp_search("myPrinter")
##D 
##D gcp_submit(printer$id[1], 
##D            "New Title",
##D            content = 
##D              "<h1>Hello World</h1>",
##D            contentType = "text/html"
##D )
## End(Not run)




