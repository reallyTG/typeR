library(yaml)


### Name: as.yaml
### Title: Convert an R object into a YAML string
### Aliases: as.yaml
### Keywords: data manip

### ** Examples

  as.yaml(1:10)
  as.yaml(list(foo=1:10, bar=c("test1", "test2")))
  as.yaml(list(foo=1:10, bar=c("test1", "test2")), indent=3)
  as.yaml(list(foo=1:10, bar=c("test1", "test2")), indent.mapping.sequence=TRUE)
  as.yaml(data.frame(a=1:10, b=letters[1:10], c=11:20))
  as.yaml(list(a=1:2, b=3:4), omap=TRUE)
  as.yaml("multi\nline\nstring")
  as.yaml(function(x) x + 1)
  as.yaml(list(foo=list(list(x = 1, y = 2), list(x = 3, y = 4))))

  # custom handler
  as.yaml(Sys.time(), handlers = list(
    POSIXct = function(x) format(Sys.time(), "%Y-%m-%d")
  ))

  # custom handler with verbatim output to change how logical vectors are
  # emitted
  as.yaml(c(TRUE, FALSE), handlers = list(
    logical = function(x) {
      result <- ifelse(x, "true", "false")
      class(result) <- "verbatim"
      return(result)
    }
  ))

  # custom tag for scalar
  x <- "thing"
  attr(x, "tag") <- "!thing"
  as.yaml(x)

  # custom tag for sequence
  x <- 1:10
  attr(x, "tag") <- "!thing"
  as.yaml(x)

  # custom tag for mapping
  x <- data.frame(a = letters[1:5], b = letters[6:10])
  attr(x, "tag") <- "!thing"
  as.yaml(x)

  # custom tag for each element in a list
  x <- list(1, 2, 3)
  attr(x[[1]], "tag") <- "!a"
  attr(x[[2]], "tag") <- "!b"
  attr(x[[3]], "tag") <- "!c"
  as.yaml(x)



