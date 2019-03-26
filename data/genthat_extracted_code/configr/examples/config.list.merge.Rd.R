library(configr)


### Name: config.list.merge
### Title: Merge list file (From config package), list.right will overwrite
###   the element also existed in list.left
### Aliases: config.list.merge

### ** Examples

config.json <- system.file('extdata', 'config.json', package='configr')
list.left <- list()
list.right <- eval.config(file = config.json)
config.list.merge(list.left, list.right)
list.left <- list(a=c(123,456))
list.right <- list(a=c(4,5,6)) 
config.list.merge(list.left, list.right)



