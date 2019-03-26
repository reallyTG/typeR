library(statar)


### Name: is.panel
### Title: Check whether a data.frame is a panel
### Aliases: is.panel

### ** Examples

library(dplyr)
df <- data_frame(
    id1    = c(1, 1, 1, 2, 2),
    id2   = 1:5,
    year  = c(1991, 1993, NA, 1992, 1992),
    value = c(4.1, 4.5, 3.3, 3.2, 5.2)
)
df %>% group_by(id1) %>% is.panel(year)
df1 <- df %>% filter(!is.na(year))
df1 %>% is.panel(year)
df1 %>% group_by(id1) %>% is.panel(year)
df1 %>% group_by(id1, id2) %>% is.panel(year)



