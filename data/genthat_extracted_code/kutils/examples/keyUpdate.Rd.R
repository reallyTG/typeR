library(kutils)


### Name: keyUpdate
### Title: Update a key in light of a new data frame (add variables and
###   values)
### Aliases: keyUpdate

### ** Examples

## Original data frame has 2 variables
dat1 <- data.frame("Score" = c(1, 2, 3, 42, 4, 2),
                   "Gender" = c("M", "M", "M", "F", "F", "F"))
## New data has all of original dat1, plus a new variable "Weight"
#and has new values for "Gender" and "Score"
dat2 <- plyr::rbind.fill(dat1, data.frame("Score" = 7,
           "Gender" = "other", "Weight" = rnorm(3)))
## Create a long key for the original data, specify some
## recodes for Score and Gender in value_new
key1.long <- keyTemplate(dat1, long = TRUE, varlab = TRUE)

key1.long$value_new <- gsub("42", "10", key1.long$value_new)
key1.long$value_new[key1.long$name_new == "Gender"] <-
       mgsub(c("F", "M"), c("female", "male"),
       key1.long$value_new[key1.long$name_new == "Gender"])  
key1.long[key1.long$name_old == "Score", "name_new"] <- "NewScore"
keyUpdate(key1.long, dat2, append = TRUE)
## Throw away one row, make sure key still has Score values
dat2 <- dat2[-1,]
(key1.long.u <- keyUpdate(key1.long, dat2, append = FALSE))
## Key change Score to character variable
key1.longc <- key1.long
key1.longc[key1.longc$name_old == "Score", "class_new"] <- "character"
keyUpdate(key1.longc, dat2, append = TRUE)
str(dat3 <- keyApply(dat2, key1.longc))
## Now try a wide key
key1.wide <- keyTemplate(dat1)
## Put in new values, same as in key1.long
key1.wide[key1.wide$name_old == "Score", c("name_new", "value_new")] <-
                            c("NewScore", "1|2|3|4|10|.")
key1.wide[key1.wide$name_old == "Gender", "value_new"] <- "female|male|."
## Make sure key1.wide equivalent to key1.long:
## If this is not true, it is a fail
all.equal(long2wide(key1.long), key1.wide, check.attributes = FALSE)
(key1.wide.u <- keyUpdate(key1.wide, dat2))
key1.long.to.wide <- long2wide(key1.long.u)
all.equal(key1.long.to.wide, key1.wide.u, check.attributes = FALSE)
str(keyApply(dat2, key1.wide.u))

mydf.key.path <- system.file("extdata", "mydf.key.csv", package = "kutils")
mydf.key <-  keyImport(mydf.key.path)
##'
set.seed(112233)
N <- 20
## The new Jan data arrived!
mydf2 <- data.frame(x5 = rnorm(N),
                    x4 = rpois(N, lambda = 3),
                    x3 = ordered(sample(c("lo", "med", "hi"),
                                       size = N, replace=TRUE),
                                levels = c("med", "lo", "hi")),
                    x2 = letters[sample(c(1:4,6), N, replace = TRUE)],
                    x1 = factor(sample(c("jan"), N, replace = TRUE)),
                    x7 = ordered(letters[sample(c(1:4,6), N, replace = TRUE)]),
                    x6 = sample(c(1:5), N, replace = TRUE),
                    stringsAsFactors = FALSE)
mydf.key2 <- keyUpdate(mydf.key, mydf2)
mydf.key2
mydf.key2["x1", "value_old"] <- "cindy|bobby|jan|peter|marcia|greg|."
mydf.key2["x1", "value_new"] <- "Cindy<Bobby<Jan<Peter<Marcia<Greg<."
##'
mydf.key.path <- system.file("extdata", "mydf.key.csv", package = "kutils")
mydf.path <- system.file("extdata", "mydf.csv", package = "kutils")
mydf <- read.csv(mydf.path, stringsAsFactors=FALSE)
mydf3 <- rbind(mydf, mydf2)
## Now recode with revised key
mydf4 <- keyApply(mydf3, mydf.key2)
rockchalk::summarize(mydf4)



