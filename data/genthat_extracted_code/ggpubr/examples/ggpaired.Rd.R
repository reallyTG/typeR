library(ggpubr)


### Name: ggpaired
### Title: Plot Paired Data
### Aliases: ggpaired

### ** Examples


# Example 1
#::::::::::::::::::::::::::::::::::::::::::
before <-c(200.1, 190.9, 192.7, 213, 241.4, 196.9, 172.2, 185.5, 205.2, 193.7)
after <-c(392.9, 393.2, 345.1, 393, 434, 427.9, 422, 383.9, 392.3, 352.2)

d <- data.frame(before = before, after = after)
ggpaired(d, cond1 = "before", cond2 = "after",
    fill = "condition", palette = "jco")

# Example 2
#::::::::::::::::::::::::::::::::::::::::::
ggpaired(ToothGrowth, x = "supp", y = "len",
 color = "supp", line.color = "gray", line.size = 0.4,
 palette = "npg")




