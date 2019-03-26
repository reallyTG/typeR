library(xfun)


### Name: in_dir
### Title: Evaluate an expression under a specified working directory
### Aliases: in_dir

### ** Examples

library(xfun)
in_dir(tempdir(), {
    print(getwd())
    list.files()
})



