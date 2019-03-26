
library("partykit")
stopifnot(require("party"))
set.seed(29)

### regression
airq <- airquality[complete.cases(airquality),]

mtry <- ncol(airq) - 1L
ntree <- 25

cf_partykit <- partykit::cforest(Ozone ~ ., data = airq,
    ntree = ntree, mtry = mtry)

w <- do.call("cbind", cf_partykit$weights)

cf_party <- party::cforest(Ozone ~ ., data = airq, 
    control = party::cforest_unbiased(ntree = ntree, mtry = mtry),
    weights = w)

p_partykit <- predict(cf_partykit)
p_party <- predict(cf_party)

stopifnot(max(abs(p_partykit - p_party)) < sqrt(.Machine$double.eps))

prettytree(cf_party@ensemble[[1]], inames = names(airq)[-1])
party(cf_partykit$nodes[[1]], data = model.frame(cf_partykit))

v_party <- do.call("rbind", lapply(1:5, function(i) party::varimp(cf_party)))

v_partykit <- do.call("rbind", lapply(1:5, function(i) partykit::varimp(cf_partykit)))

summary(v_party)
summary(v_partykit)

party::varimp(cf_party, conditional = TRUE)
partykit::varimp(cf_partykit, conditional = TRUE)


### classification
set.seed(29)
mtry <- ncol(iris) - 1L
ntree <- 25

cf_partykit <- partykit::cforest(Species ~ ., data = iris,
    ntree = ntree, mtry = mtry)

w <- do.call("cbind", cf_partykit$weights)

cf_party <- party::cforest(Species ~ ., data = iris, 
    control = party::cforest_unbiased(ntree = ntree, mtry = mtry),
    weights = w)

p_partykit <- predict(cf_partykit, type = "prob")
p_party <- do.call("rbind", treeresponse(cf_party))

stopifnot(max(abs(unclass(p_partykit) - unclass(p_party))) < sqrt(.Machine$double.eps))

prettytree(cf_party@ensemble[[1]], inames = names(iris)[-5])
party(cf_partykit$nodes[[1]], data = model.frame(cf_partykit))

v_party <- do.call("rbind", lapply(1:5, function(i) party::varimp(cf_party)))

v_partykit <- do.call("rbind", lapply(1:5, function(i)
    partykit::varimp(cf_partykit, risk = "mis")))

summary(v_party)
summary(v_partykit)

party::varimp(cf_party, conditional = TRUE)
partykit::varimp(cf_partykit, risk = "misclass", conditional = TRUE)

### mean aggregation
set.seed(29)

### fit forest
cf <- partykit::cforest(dist ~ speed, data = cars, ntree = 100)

### prediction; scale = TRUE introduced in 1.2-1
pr <- predict(cf, newdata = cars[1,,drop = FALSE], type = "response", scale = TRUE)
### this is equivalent to 
w <- predict(cf, newdata = cars[1,,drop = FALSE], type = "weights")
stopifnot(isTRUE(all.equal(pr, sum(w * cars$dist) / sum(w),
                           check.attributes = FALSE)))

### check if this is the same as mean aggregation

### compute terminal node IDs for first obs
nd1 <- predict(cf, newdata = cars[1,,drop = FALSE], type = "node")
### compute terminal nide IDs for all obs
nd <- predict(cf, newdata = cars, type = "node")
### random forests weighs
lw <- cf$weights

### compute mean predictions for each tree
### and extract mean for terminal node containing
### first observation
np <- vector(mode = "list", length = length(lw))
m <- numeric(length(lw))

for (i in 1:length(lw)) {
    np[[i]] <- tapply(lw[[i]] * cars$dist, nd[[i]], sum) / 
               tapply(lw[[i]], nd[[i]], sum)
    m[i] <- np[[i]][as.character(nd1[i])]
}

stopifnot(isTRUE(all.equal(mean(m), sum(w * cars$dist) / sum(w))))

### check parallel variable importance (make this reproducible)
if(.Platform$OS.type == "unix") {
    RNGkind("L'Ecuyer-CMRG")
    v1 <- partykit::varimp(cf_partykit, risk = "misclass", conditional = TRUE, cores = 2)
    v2 <- partykit::varimp(cf_partykit, risk = "misclass", conditional = TRUE, cores = 2)
    stopifnot(all.equal(v1, v2))
}

### check weights argument
cf_partykit <- partykit::cforest(Species ~ ., data = iris,
    ntree = ntree, mtry = 4)
w <- do.call("cbind", cf_partykit$weights)
cf_2 <- partykit::cforest(Species ~ ., data = iris,
    ntree = ntree, mtry = 4, weights = w)
stopifnot(max(abs(predict(cf_2, type = "prob") - 
                  predict(cf_partykit, type = "prob"))) < sqrt(.Machine$double.eps))

