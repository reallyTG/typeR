library(timetk)


### Name: tk_zooreg
### Title: Coerce time series objects and tibbles with date/date-time
###   columns to ts.
### Aliases: tk_zooreg tk_zooreg_

### ** Examples

### tibble to zooreg: Comparison between tk_zooreg() and zoo::zooreg()
data_tbl <- tibble::tibble(
    date = seq.Date(as.Date("2016-01-01"), by = 1, length.out = 5),
    x    = rep("chr values", 5),
    y    = cumsum(1:5),
    z    = cumsum(11:15) * rnorm(1))

# zoo::zooreg: Values coerced to character; Result does not retain index
data_zooreg <- zoo::zooreg(data_tbl[,-1], start = 2016, freq = 365)
data_zooreg                # Numeric values coerced to character
rownames(data_zooreg)      # NULL, no dates retained

# tk_zooreg: Only numeric columns get coerced; Result retains index as rownames
data_tk_zooreg <- tk_zooreg(data_tbl, start = 2016, freq = 365)
data_tk_zooreg             # No inadvertent coercion to character class

# timetk index
tk_index(data_tk_zooreg, timetk_idx = FALSE)   # Regularized index returned
tk_index(data_tk_zooreg, timetk_idx = TRUE)    # Original date index returned

### Using select and date_var
tk_zooreg(data_tbl, select = y, date_var = date, start = 2016, freq = 365)


### NSE: Enables programming
select   <- "y"
date_var <- "date"
tk_zooreg_(data_tbl, select = select, date_var = date_var, start = 2016, freq = 365)




