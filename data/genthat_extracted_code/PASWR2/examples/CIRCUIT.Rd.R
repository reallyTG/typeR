library(PASWR2)


### Name: CIRCUIT
### Title: Circuit Design Lifetime
### Aliases: CIRCUIT
### Keywords: datasets

### ** Examples

# ggplot2 approach
ggplot(data = CIRCUIT, aes(x = design, y = lifetime, fill = design)) + geom_boxplot() + 
labs(x = "", y = "Lifetime in thousands of hours") + guides(fill = FALSE) + 
scale_fill_brewer()
ggplot(data = CIRCUIT, aes(x = design, y = lifetime, fill = design)) + geom_violin() + 
labs(x = "", y = "Lifetime in thousands of hours") + guides(fill = FALSE) + 
scale_fill_brewer()
# Reorder the boxplots by medians
ggplot(data = CIRCUIT, aes(x = reorder(design, lifetime, FUN = median),  lifetime, 
fill = design)) + geom_boxplot() + labs(x = "", y = "Lifetime in thousands of hours") + 
guides(fill = FALSE) + scale_fill_brewer()



