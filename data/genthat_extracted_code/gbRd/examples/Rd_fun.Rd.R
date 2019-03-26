library(gbRd)


### Name: Rd_fun
### Title: Return all or selected sections of a help topic as an Rd object
### Aliases: Rd_fun
### Keywords: Rd

### ** Examples

# 1st arg is name of a function
Rd_fun("data.frame",keep_section="\\arguments")
Rd_fun("seq",keep_section="\\arguments")

# 1st arg is the value of a call to help()
h1 <- help("seq")
class(h1)
Rd_fun(h1,keep_section="\\title") # note: in Rd file the number of
Rd_fun(h1,keep_section="\\arguments") # backslashes is twice that in
                                        # the rendered doc.



