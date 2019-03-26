library(iheatmapr)


### Name: add_row_annotation
### Title: add_row_annotation
### Aliases: add_row_annotation add_row_annotation,Iheatmap-method

### ** Examples


mat <- matrix(rnorm(24), nrow = 6)
annotation <- data.frame(gender = c(rep("M", 3),rep("F",3)),
                        age = c(20,34,27,19,23,30))
hm <- iheatmap(mat) %>% add_row_annotation(annotation)

# Print heatmap if interactive session 
if (interactive()) hm 



