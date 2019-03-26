## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  warning = FALSE,
  message = FALSE
)

## ----eval=FALSE----------------------------------------------------------
#  install.packages("fauxpas")

## ----eval=FALSE----------------------------------------------------------
#  # install.packages("remotes")
#  remotes::install_github("ropenscilabs/fauxpas")

## ------------------------------------------------------------------------
library("fauxpas")

## ------------------------------------------------------------------------
(x <- find_error_class(418))

## ------------------------------------------------------------------------
x$new()

## ----eval=FALSE----------------------------------------------------------
#  find_error_class(999)
#  #> Error in find_error_class(999) : no method found for 999

## ----eval=FALSE----------------------------------------------------------
#  library("crul")
#  cli <- HttpClient$new("https://httpbin.org/status/414")
#  res <- cli$get()
#  http(res)
#  #> Error: Request-URI Too Long (HTTP 414).
#  http414(res)
#  #> Error: Request-URI Too Long (HTTP 414).

## ----eval=FALSE----------------------------------------------------------
#  x <- HTTPRequestURITooLong$new()
#  x$do_verbose(res)
#  #> Error: Request-URI Too Long (HTTP 414).
#  #> - The server is refusing to service the request because the Request-URI is
#  #>    longer than the server is willing to interpret. This rare condition is only likely
#  #>    to occur when a client has improperly converted a POST request to a GET request
#  #>    with long query information, when the client has descended into a URI black hole
#  #>    of redirection (e.g., a redirected URI prefix that points to a suffix of itself),
#  #>    or when the server is under attack by a client attempting to exploit security
#  #>    holes present in some servers using fixed-length buffers for reading or
#  #>    manipulating the Request-URI.

## ----eval=FALSE----------------------------------------------------------
#  library("curl")
#  h <- curl::new_handle()
#  curl::handle_setopt(h)
#  resp <- curl::curl_fetch_memory("https://httpbin.org/status/404", h)
#  http(resp)
#  #> Error: Not Found (HTTP 404).
#  http404(resp)
#  #> Error: Not Found (HTTP 404).

## ----eval=FALSE----------------------------------------------------------
#  x <- HTTPNotFound$new()
#  x$do_verbose(resp)
#  #> Error:  Not Found (HTTP 404).
#  #>  - The server has not found anything matching the Request-URI. No indication is
#  #> given of whether the condition is temporary or permanent. The 410 (Gone) status
#  #> code SHOULD be used if the server knows, through some internally configurable
#  #> mechanism, that an old resource is permanently unavailable and has no forwarding
#  #> address. #> This status code is commonly used when the server does not wish to
#  #> reveal exactly why the request has been refused, or when no other response is
#  #> applicable.

## ----eval=FALSE----------------------------------------------------------
#  library("httr")
#  res <- GET("https://httpbin.org/status/405")
#  http405(res)
#  #> Error: Method Not Allowed (HTTP 405).

## ----eval=FALSE----------------------------------------------------------
#  x <- HTTPMethodNotAllowed$new()
#  x$do_verbose(res)
#  #> Error: Method Not Allowed (HTTP 405).
#  #>  - The method specified in the Request-Line is not allowed for the resource
#  #> identified by the Request-URI. The response MUST include an Allow header
#  #> containing a list of valid methods for the requested resource.

