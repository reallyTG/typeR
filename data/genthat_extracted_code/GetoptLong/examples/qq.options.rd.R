library(GetoptLong)


### Name: qq.options
### Title: Global options for qq() related functions
### Aliases: qq.options

### ** Examples

a = 1
qq.options(cat_prefix = "[INFO] ")
qqcat("a = @{a}\n")
qq.options(cat_verbose = FALSE)
qqcat("a = @{a}\n")
qq.options(RESET = TRUE)
qq.options(code.pattern = "`CODE`")
qqcat("a = `a`\n")
qq.options(RESET = TRUE)



