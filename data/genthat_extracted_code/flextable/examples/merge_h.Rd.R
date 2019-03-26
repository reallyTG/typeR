library(flextable)


### Name: merge_h
### Title: Merge flextable cells horizontally
### Aliases: merge_h

### ** Examples

dummy_df <- data.frame( col1 = letters,
col2 = letters, stringsAsFactors = FALSE )
ft_merge <- flextable(dummy_df)
ft_merge <- merge_h(x = ft_merge)
ft_merge



