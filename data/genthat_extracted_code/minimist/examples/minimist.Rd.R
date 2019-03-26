library(minimist)


### Name: minimist
### Title: Parse argument options
### Aliases: minimist

### ** Examples

minimist()
minimist(c("-a", "beep", "-b", "boop"))
args = c("-x", "3", "-y", "4", "-n5", "-abc", "--beep=boop", "foo", "bar", "baz")
minimist(args)



