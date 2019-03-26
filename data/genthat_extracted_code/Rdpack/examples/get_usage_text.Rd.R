library(Rdpack)


### Name: get_usage_text
### Title: Get the text of the usage section of Rd documentation
### Aliases: get_usage_text
### Keywords: RdoUsage

### ** Examples

# get the Rd object documenting Rdo_macro
h <- help("Rdo_macro")
rdo <- utils:::.getHelpFile(h)

ut <- get_usage_text(rdo)

# in this case rdo describes other objects
# and their usage entries are returned, as well.
cat(ut,sep = "\n")



