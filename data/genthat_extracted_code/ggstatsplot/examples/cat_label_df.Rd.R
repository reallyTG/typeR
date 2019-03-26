library(ggstatsplot)


### Name: cat_label_df
### Title: Summary dataframe for categorical variables.
### Aliases: cat_label_df
### Keywords: internal

### ** Examples

## Not run: 
##D # creating a dataframe with counts and percentage
##D df <-
##D   mtcars %>%
##D   dplyr::group_by(.data = ., am, cyl) %>%
##D   dplyr::summarize(.data = ., counts = n()) %>%
##D   dplyr::mutate(.data = ., perc = (counts / sum(counts)) * 100) %>%
##D   dplyr::ungroup(x = .) %>%
##D   dplyr::arrange(.data = ., dplyr::desc(x = cyl)) %>%
##D   dplyr::filter(.data = ., counts != 0L)
##D 
##D # dataframe with label column
##D ggstatsplot:::cat_label_df(
##D   data = df,
##D   label.col.name = "slice.label",
##D   label.content = "both",
##D   perc.k = 1
##D )
## End(Not run)




