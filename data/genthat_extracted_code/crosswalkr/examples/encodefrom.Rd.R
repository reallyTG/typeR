library(crosswalkr)


### Name: encodefrom
### Title: Encode data frame column using external crosswalk file.
### Aliases: encodefrom encodefrom_

### ** Examples

df <- data.frame(state = c('Kentucky','Tennessee','Virginia'),
                 stfips = c(21,47,51),
                 cenregnm = c('South','South','South'))

df_tbl <- tibble::as_data_frame(df)

cw <- get(data(stcrosswalk))

df$state2 <- encodefrom(df, state, cw, stname, stfips, stabbr)
df_tbl$state2 <- encodefrom(df_tbl, state, cw, stname, stfips, stabbr)
df_tbl$state3 <- encodefrom(df_tbl, state, cw, stname, stfips, stabbr,
                            ignore_tibble = TRUE)

haven::as_factor(df_tbl)
haven::zap_labels(df_tbl)



