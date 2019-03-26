library(data.table)


### Name: dcast.data.table
### Title: Fast dcast for data.table
### Aliases: dcast.data.table dcast
### Keywords: data

### ** Examples

require(data.table)
names(ChickWeight) <- tolower(names(ChickWeight))
DT <- melt(as.data.table(ChickWeight), id=2:4) # calls melt.data.table

# dcast is a S3 method in data.table from v1.9.6
dcast(DT, time ~ variable, fun=mean)
dcast(DT, diet ~ variable, fun=mean)
dcast(DT, diet+chick ~ time, drop=FALSE)
dcast(DT, diet+chick ~ time, drop=FALSE, fill=0)

# using subset
dcast(DT, chick ~ time, fun=mean, subset=.(time < 10 & chick < 20))

# drop argument, #1512
DT <- data.table(v1 = c(1.1, 1.1, 1.1, 2.2, 2.2, 2.2),
                 v2 = factor(c(1L, 1L, 1L, 3L, 3L, 3L), levels=1:3),
                 v3 = factor(c(2L, 3L, 5L, 1L, 2L, 6L), levels=1:6),
                 v4 = c(3L, 2L, 2L, 5L, 4L, 3L))
# drop=TRUE
dcast(DT, v1 + v2 ~ v3)                      # default is drop=TRUE
dcast(DT, v1 + v2 ~ v3, drop=FALSE)          # all missing combinations of both LHS and RHS
dcast(DT, v1 + v2 ~ v3, drop=c(FALSE, TRUE)) # all missing combinations of only LHS
dcast(DT, v1 + v2 ~ v3, drop=c(TRUE, FALSE)) # all missing combinations of only RHS

# using . and ...
DT <- data.table(v1 = rep(1:2, each = 6),
                 v2 = rep(rep(1:3, 2), each = 2),
                 v3 = rep(1:2, 6),
                 v4 = rnorm(6))
dcast(DT, ... ~ v3, value.var = "v4") #same as v1 + v2 ~ v3, value.var = "v4"
dcast(DT, v1 + v2 + v3 ~ ., value.var = "v4")

## for each combination of (v1, v2), add up all values of v4
dcast(DT, v1 + v2 ~ ., value.var = "v4", fun.aggregate = sum)

## Not run: 
##D # benchmark against reshape2's dcast, minimum of 3 runs
##D set.seed(45)
##D DT <- data.table(aa=sample(1e4, 1e6, TRUE),
##D       bb=sample(1e3, 1e6, TRUE),
##D       cc = sample(letters, 1e6, TRUE), dd=runif(1e6))
##D system.time(dcast(DT, aa ~ cc, fun=sum)) # 0.12 seconds
##D system.time(dcast(DT, bb ~ cc, fun=mean)) # 0.04 seconds
##D # reshape2::dcast takes 31 seconds
##D system.time(dcast(DT, aa + bb ~ cc, fun=sum)) # 1.2 seconds
## End(Not run)

# NEW FEATURE - multiple value.var and multiple fun.aggregate
DT = data.table(x=sample(5,20,TRUE), y=sample(2,20,TRUE),
                z=sample(letters[1:2], 20,TRUE), d1 = runif(20), d2=1L)
# multiple value.var
dcast(DT, x + y ~ z, fun=sum, value.var=c("d1","d2"))
# multiple fun.aggregate
dcast(DT, x + y ~ z, fun=list(sum, mean), value.var="d1")
# multiple fun.agg and value.var (all combinations)
dcast(DT, x + y ~ z, fun=list(sum, mean), value.var=c("d1", "d2"))
# multiple fun.agg and value.var (one-to-one)
dcast(DT, x + y ~ z, fun=list(sum, mean), value.var=list("d1", "d2"))



