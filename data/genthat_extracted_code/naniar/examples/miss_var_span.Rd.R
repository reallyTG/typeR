library(naniar)


### Name: miss_var_span
### Title: Summarise the number of missings for a given repeating span on a
###   variable
### Aliases: miss_var_span

### ** Examples


miss_var_span(data = pedestrian,
             var = hourly_counts,
             span_every = 168)

 library(dplyr)
 pedestrian %>%
   group_by(month) %>%
     miss_var_span(var = hourly_counts,
                   span_every = 168)




