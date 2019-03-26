library(behavr)


### Name: xmv
### Title: Expand a metavariable and map it against the data
### Aliases: xmv

### ** Examples

#### First, we create some data

library(data.table)
set.seed(1)
data <- data.table(
                   id = rep(c("A", "B"), times = c(10, 26)),
                   t = c(1:10, 5:30),
                   x = rnorm(36), key = "id"
                   )

metadata = data.table(id = c("A", "B"),
                      treatment = c("w", "z"),
                      lifespan = c(19, 32),
                      ref_x = c(1, 0),
                      key = "id")
dt <- behavr(data, metadata)
summary(dt)

#### Subsetting using metadata

dt[xmv(treatment) == "w"]
dt[xmv(treatment) == "w"]
dt[xmv(lifespan) < 30]

#### Allocating new columns using metavariable

# Just joining lifespan (not necessary)
dt[, lif := xmv(lifespan)]
print(dt)
# Anonymously (more useful)
dt[, x2 := x - xmv(ref_x)]
print(dt)



