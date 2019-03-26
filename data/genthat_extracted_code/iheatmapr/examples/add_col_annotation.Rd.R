library(iheatmapr)


### Name: add_col_annotation
### Title: add_col_annotation
### Aliases: add_col_annotation add_col_annotation,Iheatmap-method

### ** Examples


mat <- matrix(rnorm(24), ncol = 6)
annotation <- data.frame(gender = c(rep("M", 3),rep("F",3)),
                        age = c(20,34,27,19,23,30))
hm <- iheatmap(mat) %>% add_col_annotation(annotation)

# Print heatmap if interactive session 
if (interactive()) hm 



