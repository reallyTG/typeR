library(behavr)


### Name: stitch_on
### Title: Stitch behavioural data by putting together the same individuals
###   recorded over different experiments on the basis of a user-defined
###   identifier
### Aliases: stitch_on

### ** Examples

set.seed(1)
met1 <- data.table::data.table(uid = 1:5,id = 1:5,
                               condition = letters[1:5],
                               sex = c("M", "M", "M", "F", "F"),
                               key = "id")
met2 <- data.table::data.table(uid = 1:4, id = 6:9,
                               condition = letters[1:4],
                               sex=c("M", "M", "M", "F"),
                               key = "id")
met1[, datetime := as.POSIXct("2015-01-02")]
met2[, datetime := as.POSIXct("2015-01-03")]
met <- rbind(met1, met2)
data.table::setkeyv(met, "id")
t <- 1L:100L
data <- met[,list(t = t,
                  x = rnorm(100),
                  y = rnorm(100),
                  eating = runif(100) > .5 ),
            by = "id"]
d <- behavr(data, met)
summary(d)
d2 <- stitch_on(d, on = "uid")
summary(d2)




