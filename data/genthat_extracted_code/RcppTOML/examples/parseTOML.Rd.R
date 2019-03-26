library(RcppTOML)


### Name: parseTOML
### Title: Parse a TOML configuration file
### Aliases: parseTOML tomlparse parseToml print.toml summary.toml
### Keywords: package

### ** Examples

  library(RcppTOML)

  file <- system.file("toml", "example.toml", package="RcppTOML")

  toml <- parseTOML(file)  # given file, return parsed object

  summary(toml)            # really sparse summary method
  print(toml)              # print is a wrapper around str()



