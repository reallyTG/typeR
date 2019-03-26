library(gbRd)


### Name: Rdo_args2txt
### Title: Extract the descriptions of one or more arguments of a function
### Aliases: Rdo_args2txt
### Keywords: Rd

### ** Examples

# ?seq
cat(Rdo_args2txt("seq", c("by", "...")))
cat(Rdo_args2txt("seq", c("from", "by")))



