library(umx)


### Name: umx_rename
### Title: umx_rename
### Aliases: umx_rename

### ** Examples

# Re-name "cyl" to "cylinder"
x = mtcars
x = umx_rename(x, replace = c(cyl = "cylinder"))
# alternate style
x = umx_rename(x, old = c("disp"), replace = c("displacement"))
umx_check_names("displacement", data = x, die = TRUE)
# This will warn that "disp" does not exist (anymore)
x = umx_rename(x, old = c("disp"), replace = c("displacement"))
x = umx_rename(x, grep = "lacement", replace = "") # using grep to revert to disp
umx_names(x, "^d") # all names begining with a d



