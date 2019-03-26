library(forcats)


### Name: fct_inorder
### Title: Reorder factors levels by first appearance or frequency
### Aliases: fct_inorder fct_infreq

### ** Examples

f <- factor(c("b", "b", "a", "c", "c", "c"))
f
fct_inorder(f)
fct_infreq(f)

fct_inorder(f, ordered = TRUE)



