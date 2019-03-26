library(GetoptLong)


### Name: qqcat
### Title: Print a string which has been intepolated with variables
### Aliases: qqcat

### ** Examples

a = 1
b = "text"
qqcat("a = @{a}, b = '@{b}'\n")
qqcat("a = `a`, b = '`b`'\n", code.pattern = "`CODE`")

qq.options("cat_prefix" = function(x) format(Sys.time(), "[%Y-%m-%d %H:%M:%S] "))
qqcat("a = @{a}, b = '@{b}'\n")
Sys.sleep(2)
qqcat("a = @{a}, b = '@{b}'\n")
qq.options(RESET = TRUE)



