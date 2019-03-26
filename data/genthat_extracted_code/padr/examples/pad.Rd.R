library(padr)


### Name: pad
### Title: Pad the datetime column of a data frame
### Aliases: pad

### ** Examples

simple_df <- data.frame(day = as.Date(c('2016-04-01', '2016-04-03')),
                        some_value = c(3,4))
pad(simple_df)
pad(simple_df, interval = "day")

library(dplyr) # for the pipe operator
month <- seq(as.Date('2016-04-01'), as.Date('2017-04-01'),
              by = 'month')[c(1, 4, 5, 7, 9, 10, 13)]
month_df <- data.frame(month = month,
                       y = runif(length(month), 10, 20) %>% round)
# forward fill the padded values with tidyr's fill
month_df %>% pad %>% tidyr::fill(y)

# or fill all y with 0
month_df %>% pad %>% fill_by_value(y)

# padding a data.frame on group level
day_var <- seq(as.Date('2016-01-01'), length.out = 12, by = 'month')
x_df_grp <- data.frame(grp1 = rep(LETTERS[1:3], each =4),
                       grp2 = letters[1:2],
                       y    = runif(12, 10, 20) %>% round(0),
                       date = sample(day_var, 12, TRUE)) %>%
 arrange(grp1, grp2, date)

# pad by one grouping var
x_df_grp %>% pad(group = 'grp1')

# pad by two groups vars
x_df_grp %>% pad(group = c('grp1', 'grp2'), interval = "month")

# Using group argument the interval is determined over all the observations,
# ignoring the groups.
x <- data.frame(dt_var = as.Date(c("2017-01-01", "2017-03-01", "2017-05-01",
"2017-01-01", "2017-02-01", "2017-04-01")),
id = rep(1:2, each = 3), val = round(rnorm(6)))
pad(x, group = "id")
# applying pad with do, interval is determined individualle for each group
x %>% group_by(id) %>% do(pad(.))



