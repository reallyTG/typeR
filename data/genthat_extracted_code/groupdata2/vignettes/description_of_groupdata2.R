## ----include=FALSE-------------------------------------------------------

knitr::opts_chunk$set(collapse = T, comment = "#>", fig.align='center')
options(tibble.print_min = 4L, tibble.print_max = 4L)


## ----eval=FALSE----------------------------------------------------------
#  # Uncomment:
#  # install.packages("groupdata2")

## ----eval=FALSE----------------------------------------------------------
#  # Uncomment:
#  # install.packages("devtools")
#  # devtools::install_github("LudvigOlsen/groupdata2")

## ----error=FALSE, message=FALSE, warning=FALSE---------------------------

# Attaching groupdata2
library(groupdata2)

# Attaching other packages used in this vignette
library(dplyr)
library(tidyr)
library(ggplot2)
library(knitr)

# We will also be using plyr a few times, but we don't attach this 
# because of possible conflicts with dplyr. Instead we use its functions
# like so: plyr::count()


## ------------------------------------------------------------------------
df <- data.frame("x"=c(1:12), 
                "species" = rep(c('cat','pig', 'human'), 4), 
                "age" = sample(c(1:100), 12))


## ------------------------------------------------------------------------
groups <- group_factor(df, 5, method = 'n_dist')

groups

df$groups <- groups

df %>% kable(align = 'c')


## ------------------------------------------------------------------------
aggregate(df[, 3], list(df$groups), mean) %>% 
  rename(group = Group.1, mean_age = x) %>%
  kable(align = 'c')


## ------------------------------------------------------------------------
df <- data.frame("x"=c(1:12), 
                "species" = rep(c('cat','pig', 'human'), 4), 
                "age" = sample(c(1:100), 12))


## ------------------------------------------------------------------------
groups <- group_factor(df, 5, method = 'n_dist', force_equal = TRUE)

groups

plyr::count(groups) %>% 
  rename(group = x, size = freq) %>%
  kable(align = 'c')


## ------------------------------------------------------------------------
df <- head(df, length(groups)) %>%
  mutate(group = groups)

df %>% kable(align = 'c')


## ------------------------------------------------------------------------
df <- data.frame("x"=c(1:12), 
                "species" = rep(c('cat','pig', 'human'), 4), 
                "age" = sample(c(1:100), 12))


## ------------------------------------------------------------------------
df_grouped <- group(df, 5, method = 'n_dist')

df_grouped %>% kable(align = 'c')


## ------------------------------------------------------------------------
df_means <- df %>%
  group(5, method = 'n_dist') %>%
  dplyr::summarise(mean_age = mean(age))

df_means %>% kable(align = 'c')


## ------------------------------------------------------------------------
df <- data.frame("x"=c(1:12), 
                "species" = rep(c('cat','pig', 'human'), 4), 
                "age" = sample(c(1:100), 12))



## ------------------------------------------------------------------------
df_grouped <- df %>%
  group(5, method = 'n_dist', force_equal = TRUE)

df_grouped %>% kable(align = 'c')


## ------------------------------------------------------------------------
df <- data.frame("x"=c(1:12), 
                "species" = rep(c('cat','pig', 'human'), 4), 
                "age" = sample(c(1:100), 12))



## ------------------------------------------------------------------------
df_list <- splt(df, 5, method = 'n_dist')

df_list %>% kable(align = 'c')


## ------------------------------------------------------------------------

v = c(1:6)

splt(v, 3, method = 'n_dist')


## ------------------------------------------------------------------------
df <- data.frame("x"=c(1:12), 
                "species" = rep(c('cat','pig', 'human'), 4), 
                "age" = sample(c(1:100), 12))


## ------------------------------------------------------------------------
df_list <- splt(df, 5, method = 'n_dist', force_equal = TRUE)

df_list %>% kable(align = 'c')


## ------------------------------------------------------------------------
df <- data.frame("participant" = factor(rep(c('1','2', '3', '4', '5', '6'), 3)),
                "age" = rep(sample(c(1:100), 6), 3),
                "diagnosis" = rep(c('a', 'b', 'a', 'a', 'b', 'b'), 3),
                "score" = sample(c(1:100), 3*6))

df <- df[order(df$participant),] 

# Remove index
rownames(df) <- NULL

# Add session info
df$session <- rep(c('1','2', '3'), 6)

kable(df, align = 'c')


## ------------------------------------------------------------------------
df_folded <- fold(df, 3, method = 'n_dist')

# Order by folds
df_folded <- df_folded[order(df_folded$.folds),]

kable(df_folded, align = 'c')



## ------------------------------------------------------------------------
df_folded <- fold(df, 3, cat_col = 'diagnosis', method = 'n_dist')

# Order by folds
df_folded <- df_folded[order(df_folded$.folds),] 

kable(df_folded, align = 'c')


## ------------------------------------------------------------------------
df_folded %>% group_by(.folds) %>% count(diagnosis) %>% kable(align='c')


## ------------------------------------------------------------------------
df_folded <- fold(df, 3, id_col = 'participant', method = 'n_dist')

# Order by folds
df_folded <- df_folded[order(df_folded$.folds),] 

# Remove index (Looks prettier in the table!)
rownames(df_folded) <- NULL

kable(df_folded, align = 'c')


## ------------------------------------------------------------------------
df_folded %>% group_by(.folds) %>% count(participant) %>% kable(align='c')


## ------------------------------------------------------------------------
df_folded <- fold(df, 3, cat_col = 'diagnosis', id_col = 'participant', method = 'n_dist')

# Order by folds
df_folded <- df_folded[order(df_folded$.folds),] 

kable(df_folded, align = 'c')


## ------------------------------------------------------------------------
df_folded %>% group_by(.folds) %>% count(diagnosis, participant) %>% kable(align='c')


## ------------------------------------------------------------------------
df <- data.frame("x"=c(1:12), 
                "species" = rep(c('cat','pig', 'human'), 4), 
                "age" = sample(c(1:100), 12))


## ------------------------------------------------------------------------
groups <- group_factor(df, 5, method = 'n_dist', randomize = TRUE)

groups


## ------------------------------------------------------------------------
df_list <- splt(df, 5, method = 'n_dist', randomize = TRUE)

df_list %>% kable(align = 'c')


## ----echo=FALSE----------------------------------------------------------

# 
# Examples to show difference between methods
# This could be made interactive! This way you could test what happens in different situations by 
# by simply moving a slider!
#

vec <- c(1:57)

n <- 6

if (exists ('n_meth_v57n6')){
  rm(n_meth_v57n6)
  }

for (meth in c('n_dist', 'n_fill' ,'n_last','n_rand')){
  
  data_temp <- data.frame(plyr::count(group_factor(vec, n, method = meth)))
  
  names(data_temp)[names(data_temp)=="freq"] <- meth
  
  if (exists ('n_meth_v57n6')) {
    
    n_meth_v57n6 <- cbind(n_meth_v57n6, data_temp)
    
  } else {
    
    n_meth_v57n6 <- data_temp
    
  }
  
}

forced_equal <- plyr::count(group_factor(vec, n, method = 'n_last', force_equal = TRUE))

n_meth_v57n6$forced_equal <- forced_equal$freq

n_meth_v57n6 <- n_meth_v57n6[ , !duplicated(colnames(n_meth_v57n6))]


# gather() dataframe for plotting

data_plot <- n_meth_v57n6 %>%
  gather(method, group_size,-1)


upper_limit <- max(data_plot$group_size)+1
lower_limit <- min(data_plot$group_size)-1


v57n6_plot <- ggplot(data_plot, aes(x, group_size))


## Output

# Dataframe
n_meth_v57n6

# Plot
v57n6_plot +
  geom_point() +
  scale_y_continuous(limit = c(lower_limit, upper_limit),
                     breaks = round(seq(lower_limit, upper_limit, by = 2),1)) + 
  #scale_y_continuous(limit = c(lower_limit, upper_limit))+
  facet_wrap('method', ncol=1) +
  labs(x = 'group',
       y = 'group Size',
       title = 'Distribution of Elements in groups')+
  theme_bw()+
  theme(axis.text.y = element_text(size=9),
        axis.text.x = element_text(size=9))
        





## ----echo=FALSE----------------------------------------------------------



vec <- c(1:117)

n <- 11

if (exists ('n_meth_v117n11')){
  rm(n_meth_v117n11)
  }

for (meth in c('n_dist', 'n_fill' ,'n_last','n_rand')){
  
  data_temp <- data.frame(plyr::count(group_factor(vec, n, method = meth)))
  
  names(data_temp)[names(data_temp)=="freq"] <- meth
  
  if (exists ('n_meth_v117n11')) {
    
    n_meth_v117n11 <- cbind(n_meth_v117n11, data_temp)
    
  } else {
    
    n_meth_v117n11 <- data_temp
    
  }
  
}

forced_equal <- plyr::count(group_factor(vec, n, method = 'n_last', force_equal = TRUE))

n_meth_v117n11$forced_equal <- forced_equal$freq

n_meth_v117n11 <- n_meth_v117n11[ , !duplicated(colnames(n_meth_v117n11))]




# gather() dataframe for plotting

data_plot <- n_meth_v117n11 %>%
  gather(method, group_size,-1)

v117n11_plot <- ggplot(data_plot, aes(x, group_size))


upper_limit <- max(data_plot$group_size)+1
lower_limit <- min(data_plot$group_size)-1


## Output

# Dataframe
n_meth_v117n11

# Plot
v117n11_plot + 
  geom_point() + 
  scale_y_continuous(limit = c(lower_limit, upper_limit),
                     breaks = round(seq(lower_limit, upper_limit, by = 2),1)) + 
  facet_wrap('method', ncol=1) + 
  labs(x = 'group',
       y = 'group Size',
       title = 'Distribution of Elements in groups')+
  theme_bw()+
  theme(axis.text.y = element_text(size=9),
        axis.text.x = element_text(size=9))


  


## ----echo=FALSE----------------------------------------------------------


vec <- c(1:100)

if (exists ('greedy_data')){
  rm(greedy_data)
  }

for (n in c(8,15,20)){

  group_sizes <- plyr::count(group_factor(vec, n, method='greedy'))

  data_temp <- data.frame(group_sizes, 'Size' = factor(n))

  
  if (exists ('greedy_data')) {
    
    greedy_data <- rbind(greedy_data, data_temp)
    
  } else {
    
    greedy_data <- data_temp
    
  }
  
}


greedy_plot <- ggplot(greedy_data, aes(x, freq, color=Size))

greedy_plot + 
  geom_point() +
  labs(x = 'group',
       y = 'group Size',
       title = 'Greedy Distribution of Elements in groups',
       color = 'Size') +
  theme_bw()+
  theme(plot.margin = unit(c(1,1,1,1), "cm"))+
  theme(axis.text.y = element_text(size=9),
        axis.text.x = element_text(size=9))



## ----echo=FALSE----------------------------------------------------------


vec <- c(1:1000)

if (exists ('staircase_data')){
  rm(staircase_data)
  }

for (n in c(2, 5, 11)){

  group_sizes <- plyr::count(group_factor(vec, n, method='staircase'))

  data_temp <- data.frame(group_sizes, 'step_size' = factor(n))

  
  if (exists ('staircase_data')) {
    
    staircase_data <- rbind(staircase_data, data_temp)
    
  } else {
    
    staircase_data <- data_temp
    
  }
  
}

staircase_plot <- ggplot(staircase_data, aes(x, freq, color=step_size))

staircase_plot + 
  geom_point() +
  #scale_x_continuous(breaks = round(seq(1, max(data_temp$x), by = 2),1))+
  labs(x = 'group',
       y = 'group Size',
       title = 'Staircasing Distribution of Elements in groups',
       color = 'Step Size') +
  theme_bw()+
  theme(axis.text.y = element_text(size=9),
        axis.text.x = element_text(size=7))




## ----echo=FALSE----------------------------------------------------------

staircase_data <- staircase_data %>%
  group_by(step_size) %>%
  mutate(cumsum = cumsum(freq))

staircase_cumulative_plot <- ggplot(staircase_data, aes(x, cumsum, color=step_size))

staircase_cumulative_plot + 
  geom_point() +
  labs(x = 'group',
       y = 'Cumulative sum of group sizes',
       title = 'Staircasing Cumulative Sum of group Sizes',
       color = 'Step Size') +
  theme_bw()+
  theme(axis.text.y = element_text(size=9),
        axis.text.x = element_text(size=7))


## ----echo=FALSE----------------------------------------------------------


vec <- c(1:1000)

if (exists ('primes_data')){
  rm(primes_data)
  }

for (n in c(2, 5, 11)){

  group_sizes <- plyr::count(group_factor(vec, n, method='primes'))

  data_temp <- data.frame(group_sizes, 'start_at' = factor(n))

  
  if (exists ('primes_data')) {
    
    primes_data <- rbind(primes_data, data_temp)
    
  } else {
    
    primes_data <- data_temp
    
  }
  
}

primes_plot <- ggplot(primes_data, aes(x, freq, color=start_at))

primes_plot + 
  geom_point() +
  #scale_x_continuous(breaks = round(seq(1, max(data_temp$x), by = 2),1))+
  labs(x = 'group',
       y = 'group Size',
       title = 'Prime numbers method - Elements per groups',
       color = 'Start at') +
  theme_bw()+
  theme(axis.text.y = element_text(size=9),
        axis.text.x = element_text(size=7))




## ----echo=FALSE----------------------------------------------------------

primes_data <- primes_data %>%
  group_by(start_at) %>%
  mutate(cumsum = cumsum(freq))

primes_cumulative_plot <- ggplot(primes_data, aes(x, cumsum, color=start_at))

primes_cumulative_plot + 
  geom_point() +
  labs(x = 'group',
       y = 'Cumulative sum of group sizes',
       title = 'Primes Cumulative Sum of group Sizes',
       color = 'Start At') +
  theme_bw()+
  theme(axis.text.y = element_text(size=9),
        axis.text.x = element_text(size=7))


