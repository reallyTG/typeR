library(RcppTOML)


### Name: RcppTOML-package
### Title: R Access to Parser for TOML (Tom's Obvious Markup Language)
### Aliases: RcppTOML-package RcppTOML
### Keywords: package

### ** Examples

  library(RcppTOML)

  file <- system.file("toml", "example.toml", package="RcppTOML")

  toml <- parseTOML(file)  # given file, return parsed object

  summary(toml)            # really sparse summary method
  print(toml)              # print is a wrapper around str()



