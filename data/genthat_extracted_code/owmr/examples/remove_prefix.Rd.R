library(owmr)


### Name: remove_prefix
### Title: Remove prefices from column names.
### Aliases: remove_prefix

### ** Examples

x <- data.frame(main.temp = 1:10, sys.msg = "OK", cnt = 10:1)
names(x)
remove_prefix(x, c("main", "sys")) %>% names()



