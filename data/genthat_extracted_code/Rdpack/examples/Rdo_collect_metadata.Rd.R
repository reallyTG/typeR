library(Rdpack)


### Name: Rdo_collect_aliases
### Title: Collect aliases or other metadata from an Rd object
### Aliases: Rdo_collect_aliases Rdo_collect_metadata
### Keywords: Rd

### ** Examples

## this example originally (circa 2012) was:
##     infile <- file.path(R.home(), "src/library/base/man/timezones.Rd")
## but the OS conditional alias in that file has been removed.
## So, create an artificial example:
infile <- system.file("examples", "tz.Rd", package = "Rdpack")

## file.show(infile)
rd <- tools::parse_Rd(infile)

## The functions described here handle "ifdef" and similar directives.
## This detects OS specific aliases (windows = "onlywin" and unix = "onlyunix"):
Rdo_collect_aliases(rd)
Rdpack:::Rdo_collect_metadata(rd, "alias") # same

## In contrast, the following do not find "onlywin" and "onlyunix":
sapply(rd[which(tools:::RdTags(rd)=="\alias")], as.character)
tools:::.Rd_get_metadata(rd, "alias")

Rdpack:::Rdo_collect_metadata(rd, "name")
Rdpack:::Rdo_collect_metadata(rd, "keyword")



