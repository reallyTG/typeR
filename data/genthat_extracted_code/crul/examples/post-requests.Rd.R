library(crul)


### Name: post-requests
### Title: HTTP POST/PUT/PATCH requests
### Aliases: post-requests

### ** Examples

## Not run: 
##D (x <- HttpClient$new(url = "https://httpbin.org"))
##D 
##D # POST requests
##D ## a list
##D (res_post <- x$post('post', body = list(hello = "world"), verbose = TRUE))
##D 
##D ## a string
##D (res_post <- x$post('post', body = "hello world", verbose = TRUE))
##D 
##D ## empty body request
##D x$post('post')
##D 
##D ## form requests
##D (cli <- HttpClient$new(
##D   url = "https://httpbin.org/post",
##D   opts = list(verbose = TRUE)
##D ))
##D res <- cli$post(
##D   encode = "form",
##D   body = list(
##D     custname = 'Jane',
##D     custtel = '444-4444',
##D     size = 'small',
##D     topping = 'bacon',
##D     comments = 'make it snappy'
##D   )
##D )
##D jsonlite::fromJSON(res$parse("UTF-8"))
##D 
##D (x <- HttpClient$new(url = "https://httpbin.org"))
##D res <- x$post("post",
##D   encode = "json",
##D   body = list(
##D     genus = 'Gagea',
##D     species = 'pratensis'
##D   )
##D )
##D jsonlite::fromJSON(res$parse())
##D 
##D # PUT requests
##D (x <- HttpClient$new(url = "https://httpbin.org"))
##D (res <- x$put(path = "put",
##D   encode = "json",
##D   body = list(
##D     genus = 'Gagea',
##D     species = 'pratensis'
##D   )
##D ))
##D jsonlite::fromJSON(res$parse("UTF-8"))
##D 
##D res <- x$put("put", body = "foo bar")
##D jsonlite::fromJSON(res$parse("UTF-8"))
##D 
##D 
##D # PATCH requests
##D (x <- HttpClient$new(url = "https://httpbin.org"))
##D (res <- x$patch(path = "patch",
##D   encode = "json",
##D   body = list(
##D     genus = 'Gagea',
##D     species = 'pratensis'
##D   )
##D ))
##D jsonlite::fromJSON(res$parse("UTF-8"))
##D 
##D res <- x$patch("patch", body = "foo bar")
##D jsonlite::fromJSON(res$parse("UTF-8"))
##D 
##D 
##D # Upload files
##D ## image
##D path <- file.path(Sys.getenv("R_DOC_DIR"), "html/logo.jpg")
##D (x <- HttpClient$new(url = "https://httpbin.org"))
##D res <- x$post(path = "post", body = list(y = upload(path)))
##D res$content
##D 
##D ## text file, in a list
##D (x <- HttpClient$new(url = "https://httpbin.org"))
##D file <- upload(system.file("CITATION"))
##D res <- x$post(path = "post", body = list(y = file))
##D jsonlite::fromJSON(res$parse("UTF-8"))
##D 
##D ## text file, as data
##D res <- x$post(path = "post", body = file)
##D jsonlite::fromJSON(res$parse("UTF-8"))
## End(Not run)



