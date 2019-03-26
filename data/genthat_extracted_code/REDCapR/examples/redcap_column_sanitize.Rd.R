library(REDCapR)


### Name: redcap_column_sanitize
### Title: Sanitize to adhere to REDCap character encoding requirements.
### Aliases: redcap_column_sanitize

### ** Examples

dirty <- data.frame(id=1:3, names=c("Ekstr\xf8m", "J\xf6reskog", "bi\xdfchen Z\xfcrcher"))
REDCapR::redcap_column_sanitize(dirty)
# Produces the dataset:
#  id            names
#1  1          Ekstr?m
#2  2         Joreskog
#3  3 bisschen Zurcher

# Typical examples are not shown because they require non-ASCII encoding,
#   which makes the package documentation less portable.



