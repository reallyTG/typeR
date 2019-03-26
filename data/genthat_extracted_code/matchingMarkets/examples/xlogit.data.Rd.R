library(matchingMarkets)


### Name: xlogit.data
### Title: data.frame for exploded logit model
### Aliases: xlogit.data
### Keywords: generate

### ** Examples

## Not run: 
##D ## Game2 is a data.frame in long format for which the response is a
##D ## ranking variable (see example in package mlogit, function mlogit.data)
##D 
##D ## --- 1. baseline case (equivalent to mlogit package)
##D 
##D ## load data
##D data("Game2", package = "mlogit")
##D head(Game2, 13)
##D 
##D ## transform data
##D G <- xlogit.data(Game2, shape = "long", choice = "ch", 
##D                  alt.var = "platform", ranked = TRUE)
##D head(G, 30)
##D 
##D ## --- 2. handle missing values 
##D 
##D ## introduce NAs
##D Game2$ch[Game2$ch != 1] <- NA
##D 
##D ## transform data
##D G <- xlogit.data(Game2, shape = "long", choice = "ch", alt.var = "platform", ranked = TRUE)
##D head(G, 30)
##D 
##D ## --- 3. handle varying choice sets 
##D 
##D ## drop choice options
##D Game2 <- Game2[-c(7:8),]
##D 
##D ## transform data
##D G <- xlogit.data(Game2, shape = "long", choice = "ch", alt.var = "platform", ranked = TRUE)
##D head(G, 30)
##D 
##D ## --- 4. run models
##D summary(mlogit::mlogit(ch ~ own | -1 + hours + age, G, reflevel = "PC"))
##D summary(mlogit::mlogit(ch ~ 0 | -1 + age | own, G))
##D summary(mlogit::mlogit(ch ~ 0 | -1 + age, G))
## End(Not run)



