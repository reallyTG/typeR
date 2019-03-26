## ----include=FALSE-------------------------------------------------------

knitr::opts_chunk$set(collapse = T, comment = "#>", fig.align='center')
options(tibble.print_min = 4L, tibble.print_max = 4L)


## ----warning=FALSE,message=FALSE-----------------------------------------
library(groupdata2)
library(dplyr) # %>%
library(ggplot2)
library(knitr) # kable

## ------------------------------------------------------------------------
timeSeriesFrame = data.frame('residents' = austres)

# Show structure of dataframe
str(timeSeriesFrame) 

# Show head of data
timeSeriesFrame %>% head(12) %>% kable()


## ----echo=FALSE, message=FALSE-------------------------------------------
# Plot of time series

ggplot(timeSeriesFrame, aes(seq_along(residents), residents)) +
  geom_point() +
  labs(x = 'Measurement', y = 'Residents')



## ------------------------------------------------------------------------
ts = timeSeriesFrame %>%
  
  # Group data
  group(n = 12, method = 'greedy') %>%
  
  # Find means of each group
  dplyr::summarise(mean = mean(residents))

# Show new data
ts %>% kable() 

## ----echo=FALSE, message=FALSE-------------------------------------------
# Plot of time series

ggplot(ts, aes(.groups, mean)) +
  geom_point() +
  labs(x = 'Groups', y = 'Mean n of residents')



## ------------------------------------------------------------------------
ts = timeSeriesFrame %>%
  
  # Group data
  group(n = 12, method = 'greedy') %>%
  
  # Find range of each group
  dplyr::summarise(range = diff(range(residents)))

# Show new data
ts %>% kable() 


## ------------------------------------------------------------------------
main_group_size = 12

# Loop through a list ranging from 1-30
for (step_size in c(1:30)){
  
  # If the remainder is 0
  if(main_group_size %staircase% step_size == 0){
    
    # Print the step size
    print(step_size)
    
  }
  
}


## ------------------------------------------------------------------------
ts <- timeSeriesFrame %>%
  
  # Group data
  group(n = 12, method='greedy') %>%
  
  # Create subgroups
  do(group(., n = 2, method='staircase', col_name = '.subgroups'))

# Show head of new data
ts %>% head(24) %>% kable() 


## ------------------------------------------------------------------------
# Show tail of new data
ts %>% tail(17) %>% kable()


## ------------------------------------------------------------------------
ts_means <- ts %>%
  
  # Convert .subgroups to an integer and then to a factor
  mutate(.subgroups = as.integer(.subgroups),
         .subgroups = as.factor(.subgroups)) %>%
  
  # Group by first .groups, then .subgroups
  group_by(.groups, .subgroups) %>%
  
  # Find the mean and range of each subgroup
  dplyr::summarise(mean = mean(residents),
                   range = diff(range(residents)))

# Show head of new data
ts_means %>% head(9) %>% kable() 

## ----echo=FALSE, message=FALSE-------------------------------------------
# Plot of time series

ggplot(ts_means, aes(seq_along(mean), mean)) +
  geom_point() +
  labs(x = 'Subgroup', y = 'Mean n of residents')



