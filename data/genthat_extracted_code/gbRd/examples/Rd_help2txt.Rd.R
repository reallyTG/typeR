library(gbRd)


### Name: Rd_help2txt
### Title: Extract selected help sections as text.
### Aliases: Rd_help2txt
### Keywords: Rd

### ** Examples

# 1st arg is the name of a function
Rd_help2txt("data.frame",keep_section="\\arguments")

Rd_help2txt("seq",keep_section="\\examples")
Rd_help2txt("seq",keep_section="\\examples",omit_sec_header=TRUE)



