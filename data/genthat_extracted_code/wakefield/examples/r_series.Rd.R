library(wakefield)


### Name: r_series
### Title: Data Frame Series (Repeated Measures)
### Aliases: r_series

### ** Examples

r_series(grade, 5, 10)

## Custom name prefix
r_series(likert, 5, 10, name = "Question")

## Convert factors to integers
r_series(likert_7, 5, 10, integer = TRUE)

## Related variables
r_series(likert, 10, 200, relate = list(operation = "*", mean = 2, sd = 1))
r_series(likert, 10, 200, relate = "--3_1")
r_series(age, 10, 200, relate = "+5_0")

## Change sd to reduce/increase correlation
round(cor(r_series(grade, 10, 10, relate = "+1_2")), 2)
round(cor(r_series(grade, 10, 10, relate = "+1_0")), 2)
round(cor(r_series(grade, 10, 10, relate = "+1_.5")), 2)
round(cor(r_series(grade, 10, 10, relate = "+1_20")), 2)

## Plot Example 1
library(dplyr); library(ggplot2)

dat <- r_data_frame(12,
    name,
    r_series(likert, 10, relate = "+1_.5")
)

# Suggested use of tidyr or reshape2 package here instead
dat <- data.frame(
    ID = rep(dat[[1]], ncol(dat[-1])),
    stack(dat[-1])
)

dat[["Time"]] <- factor(sub("Variable_", "", dat[["ind"]]), levels = 1:10)
ggplot(dat, aes(x = Time, y = values, color = ID, group = ID)) +
    geom_line(size=.8)

## Plot Example 2
dat <- r_data_frame(12,
    name,
    r_series(grade, 100, relate = "+1_2")
)

# Suggested use of tidyr or reshape2 package here instead
dat <- data.frame(
    ID = rep(dat[[1]], ncol(dat[-1])),
    ind = rep(colnames(dat[-1]), each = nrow(dat)),
    values = unlist(dat[-1])
)


dat[["Time"]] <- as.numeric(sub("Grade_", "", dat[["ind"]]))
ggplot(dat, aes(x = Time, y = values, color = ID, group = ID)) +
    geom_line(size=.8) + theme_bw()



