library(js)


### Name: uglify
### Title: Compress and Reformat JavaScript Code
### Aliases: uglify uglify_reformat uglify_optimize

### ** Examples

code <- "function test(x, y){ x = x || 1; y = y || 1; return x*y;}"
cat(uglify_optimize(code))
cat(uglify_reformat(code, beautify = TRUE, indent_level = 2))



