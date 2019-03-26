library(wakefield)


### Name: relate
### Title: Create Related Numeric Columns
### Aliases: relate
### Keywords: correlate related

### ** Examples

relate(1:10, 10)

(x <- r_data_frame(10, id, relate(1:10, 10, "Time", mean = 2)))
library(ggplot2)

dat <- with(x, data.frame(ID = rep(ID, ncol(x[, -1])), stack(x[, -1])))
dat[["Time"]] <- factor(sub("Time_", "", dat[["ind"]]), levels = 1:10)
ggplot(dat, aes(x = Time, y = values, color = ID, group = ID)) +
    geom_line(size=.8)

relate(1:10, 10, name = "X", operation = "-")
relate(1:10, 10, "X", mean = 1, sd = 0)
relate(1:10, 10, "Var", "*")
relate(1:10, 10, "Var", "/")

relate(gpa(30), 5, mean = .1)
relate(likert(10), 5, mean = .1, sd = .2)
relate(date_stamp(10), 6)
relate(time_stamp(10), 6)
relate(rep(100, 10), 6, "Reaction", "-")



