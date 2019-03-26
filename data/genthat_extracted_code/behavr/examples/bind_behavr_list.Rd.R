library(behavr)


### Name: bind_behavr_list
### Title: Put together a list of behavr tables
### Aliases: bind_behavr_list

### ** Examples

met <- data.table::data.table(id = 1:5,
                             condition = letters[1:5],
                             sex = c("M", "M", "M", "F", "F"),
                             key = "id")
data <- met[,list(t = 1L:100L,
                  x = rnorm(100),
                  y = rnorm(100),
                  eating = runif(100) > .5),
                  by = "id"]
d1 <- behavr(data, met)

met[,id := id + 5]
data[,id := id + 5]
data.table::setkeyv(met, "id")
data.table::setkeyv(data, "id")

d2 <- behavr(data, met)
d_all <- bind_behavr_list(list(d1, d2))
print(d_all)



