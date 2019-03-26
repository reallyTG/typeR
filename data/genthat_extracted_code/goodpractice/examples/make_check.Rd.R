library(goodpractice)


### Name: make_check
### Title: Create a check function
### Aliases: make_check

### ** Examples

# make a preparation function
url_prep <- make_prep(
  name = "desc", 
  func = function(path, quiet) desc::description$new(path)
)
# and the corresponding check function
url_chk <- make_check(
  description = "URL field in DESCRIPTION",
  tags = character(),
  preps = "desc",
  gp = "have a URL field in DESCRIPTION",
  check = function(state) state$desc$has_fields("URL")
)
# use together in gp()
bad1 <- system.file("bad1", package = "goodpractice")
res <- gp(bad1, checks = "no_description_depends",
          extra_preps = list("desc" = url_prep),
          extra_checks = list("url" = url_chk))



