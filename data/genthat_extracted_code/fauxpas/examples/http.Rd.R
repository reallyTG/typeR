library(fauxpas)


### Name: http100
### Title: higher level error wrappers
### Aliases: http100 http101 http102 http200 http201 http202 http203
###   http204 http205 http206 http207 http208 http226 http300 http301
###   http302 http303 http304 http305 http306 http307 http308 http400
###   http401 http402 http403 http404 http405 http406 http407 http408
###   http409 http410 http411 http412 http413 http414 http415 http416
###   http417 http418 http419 http420 http422 http423 http424 http425
###   http426 http428 http429 http431 http440 http444 http449 http450
###   http451 http494 http495 http496 http497 http498 http499 http500
###   http501 http502 http503 http504 http505 http506 http507 http508
###   http509 http510 http511 http598 http599 http

### ** Examples

if (requireNamespace("crul")) {
 library("crul")
 res <- HttpClient$new("https://httpbin.org/status/418")$get()
 ## Not run: http(res)
 http(res, behavior = "warning")
 http(res, behavior = "message")

 res <- HttpClient$new("https://httpbin.org/status/414")$get()
 ## Not run: http414(res)
 http(res, behavior = "warning")
 http(res, behavior = "message")

 res <- HttpClient$new("https://httpbin.org/asdfafadsf")$get()
 ## Not run: http404(res)
 http(res, behavior = "warning")
 http(res, behavior = "message")
}

if (requireNamespace("curl")) {
 library("curl")
 h <- curl::new_handle()
 curl::handle_setopt(h)
 res <- curl::curl_fetch_memory("https://httpbin.org/status/418", h)
 ## Not run: http(res)
 http(res, behavior = "warning")
 http(res, behavior = "message")
}

if (requireNamespace("httr")) {
 library("httr")
 res <- GET("https://httpbin.org/status/418")
 ## Not run: http(res)
 http(res, behavior = "warning")
 http(res, behavior = "message")
}



