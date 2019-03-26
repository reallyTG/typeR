## ----include=FALSE-------------------------------------------------------

knitr::opts_chunk$set(collapse = T, comment = "#>", fig.align='center')
options(tibble.print_min = 4L, tibble.print_max = 4L)


## ----warning=FALSE,message=FALSE-----------------------------------------
library(groupdata2)
library(dplyr) # %>%
library(knitr) # kable

## ------------------------------------------------------------------------

df_observations <- data.frame(
  
  "run" = 1:30,
  "participant" = c(1,1,1,1,
             2,2,2,2,2,2,
             3,3,3,3,
             1,1,1,1,1,1,1,
             2,2,2,
             3,3,3,3,3,3),
  "errors" = c(3,2,5,3,
               0,0,1,1,0,1,
               6,4,3,1,
               2,1,3,2,1,1,0,
               0,0,1,
               3,3,4,2,2,1)
  
)

# Show the first 20 rows of dataframe
df_observations %>% head(20) %>%  kable()

df_ratings <- data.frame(
  
  "session" = c(1:6),
  "rating" = c(3,8,2,5,9,4)
  
)

df_ratings %>% kable()


## ------------------------------------------------------------------------

group(df_observations, n = c(1,2,3,1,2,3), method = 'l_starts', 
      starts_col = 'participant', col_name = 'session') %>% 
  kable()


## ------------------------------------------------------------------------
df_observations <- group(df_observations, n = 'auto', 
                         method = 'l_starts',
                         starts_col = 'participant', 
                         col_name = 'session') 

df_observations %>% 
  kable()


## ------------------------------------------------------------------------
df_merged <- merge(df_observations, df_ratings, by = 'session')

# Show head of df_merged
df_merged %>% head(15) %>% kable()


## ------------------------------------------------------------------------
avg_errors <- df_merged %>% 
  group_by(session) %>% 
  dplyr::summarize("avg_errors" = mean(errors))

avg_errors %>% kable()


## ------------------------------------------------------------------------
df_summarized <- merge(df_merged, avg_errors, by = 'session') %>% 
  group_by(session) %>%  # For each session
  filter(row_number()==1) %>%  # Get first row
  select(-errors) # Remove errors column as we use avg_errors now

df_summarized %>% kable()

## ------------------------------------------------------------------------
summary(lm(rating~avg_errors, df_summarized))

