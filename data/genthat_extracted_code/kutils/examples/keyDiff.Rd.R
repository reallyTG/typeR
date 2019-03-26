library(kutils)


### Name: keyDiff
### Title: Show difference between 2 keys
### Aliases: keyDiff

### ** Examples


dat1 <- data.frame("Score" = c(1, 2, 3, 42, 4, 2),
                   "Gender" = c("M", "M", "M", "F", "F", "F"))
## First try with a long key
key1 <- keyTemplate(dat1, long = TRUE)
key1$value_new <- gsub("42", "10", key1$value_new)
key1$value_new[key1$name_new == "Gender"] <-
       mgsub(c("F", "M"), c("female", "male"),
       key1$value_new[key1$name_new == "Gender"])  
key1[key1$name_old == "Score", "name_new"] <- "NewScore"
dat2 <- data.frame("Score" = 7, "Gender" = "other", "Weight" = rnorm(3))
dat2 <- plyr::rbind.fill(dat1, dat2)
dat2 <- dat2[-1,]
key2 <- keyUpdate(key1, dat2, append = TRUE)
(kdiff <- keyDiff(key1, key2))



