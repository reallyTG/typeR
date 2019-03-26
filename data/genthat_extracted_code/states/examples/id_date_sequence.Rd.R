library(states)


### Name: id_date_sequence
### Title: Identify date sequences
### Aliases: id_date_sequence

### ** Examples

library("ggplot2")
d1 <- as.Date("2018-01-01")
d2 <- as.Date("2025-01-01")
seq1 <- seq(d1, d2, by = "year")
data.frame(seq1, id=id_date_sequence(seq1, "year"))
# With a gap, should be two ids
df <- data.frame(date = seq1[-4], id=id_date_sequence(seq1[-4], "year"), cowcode = 999)
df

# The point is to plot countries with interrupted independence correctly:
df$y <- c(rep(1, 3), rep(2, 4))
df$id <- paste0(df$cowcode, df$id)
df
ggplot(df, aes(x = date, y = y, group = cowcode)) + geom_line()
ggplot(df, aes(x = date, y = y, group = id)) + geom_line()



