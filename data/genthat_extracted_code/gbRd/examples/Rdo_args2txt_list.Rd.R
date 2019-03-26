library(gbRd)


### Name: Rdo_args2txt_list
### Title: Extract the descriptions of the arguments of a function
### Aliases: Rdo_args2txt_list
### Keywords: Rd

### ** Examples

# each arg always gets an individual entry in the list;
# compare:
Rdo_args2txt_list("seq", c("from", "to", "by"))
# to:
cat(Rdo_args2txt("seq", c("from", "to", "by")))




