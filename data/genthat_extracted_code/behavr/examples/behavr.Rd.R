library(behavr)


### Name: behavr
### Title: An S3 class, based on data.table, to store ethomics data
### Aliases: behavr behavr setbehavr is.behavr

### ** Examples

# We generate some metadata and data
set.seed(1)
met <- data.table::data.table(id = 1:5,
                              condition = letters[1:5],
                              sex = c("M", "M", "M", "F", "F"),
                              key = "id")
data <- met[  ,
              list(t = 1L:100L,
                  x = rnorm(100),
                  y = rnorm(100),
                  eating = runif(100) > .5 ),
              by = "id"]
# we store them together in a behavr object d
# d is a copy of the data
d <- behavr(data, met)
print(d)
summary(d)

# we can also convert data to a behavr table without copy:
setbehavr(data, met)
print(data)
summary(data)

### Operations are just like in data.table
# row subsetting:
d[t < 10]
# column subsetting:
d[, .(id, t, x)]
# making new columns inline:
d[, x2 := 1 - x]
### Using `meta = TRUE` applies the operation on the metadata
# making new metavariables:
d[, treatment := interaction(condition,sex), meta = TRUE]
d[meta = TRUE]




