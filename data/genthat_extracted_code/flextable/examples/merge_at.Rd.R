library(flextable)


### Name: merge_at
### Title: Merge flextable cells
### Aliases: merge_at

### ** Examples

ft_merge <- flextable( head( mtcars ), cwidth = .5 )
ft_merge <- merge_at( ft_merge, i = 1:2, j = 1:3 )
ft_merge



