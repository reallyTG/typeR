library(GlobalOptions)


### Name: .v
### Title: Get value of other options
### Aliases: .v

### ** Examples

opt = set_opt(a = 1, b = function() .v$a*2)
opt$b
opt(a = 2); opt$b



