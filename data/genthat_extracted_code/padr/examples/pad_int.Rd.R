library(padr)


### Name: pad_int
### Title: Pad the integer column of a data frame
### Aliases: pad_int

### ** Examples

int_df <- data.frame(x = c(2005, 2007, 2008, 2011),
                     val = c(3, 2, 6, 3))
pad_int(int_df, 'x')
pad_int(int_df, 'x', start_val = 2006, end_val = 2013)

int_df2 <- data.frame(x = c(2005, 2015), val = c(3, 4))
pad_int(int_df2, 'x', step = 2)
pad_int(int_df2, 'x', step = 5)

int_df3 <- data.frame(x = c(2005, 2006, 2008, 2006, 2007, 2009),
                      g = rep(LETTERS[1:2], each = 3),
                      val = c(6, 6, 3, 5, 4, 3))
pad_int(int_df3, 'x', group = 'g')
pad_int(int_df3, 'x', group = 'g', start_val = 2005, end_val = 2009)



