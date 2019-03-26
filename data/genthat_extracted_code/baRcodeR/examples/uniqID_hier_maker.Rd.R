library(baRcodeR)


### Name: uniqID_hier_maker
### Title: Make hierarchical ID codes
### Aliases: uniqID_hier_maker

### ** Examples

if(interactive()){
## for interactive mode
uniqID_hier_maker(user = TRUE)
}

## how to make hierarchy list

## create vectors for each level in the order string_prefix, beginning_value,
## end_value and combine in list

a <- c("a", 3, 6)
b <- c("b", 1, 3)
c <- list(a, b)
Labels <- uniqID_hier_maker(hierarchy = c)
Labels

## add string at end of each label
Labels <- uniqID_hier_maker(hierarchy = c, end = "end")
Labels




