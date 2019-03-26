library(forcats)


### Name: fct_drop
### Title: Drop unused levels
### Aliases: fct_drop

### ** Examples

f <- factor(c("a", "b"), levels = c("a", "b", "c"))
f
fct_drop(f)

# Set only to restrict which levels to drop
fct_drop(f, only = "a")
fct_drop(f, only = "c")



