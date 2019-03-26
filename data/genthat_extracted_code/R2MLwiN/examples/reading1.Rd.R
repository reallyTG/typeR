library(R2MLwiN)


### Name: reading1
### Title: Students' reading attainment in inner London infant schools.
### Aliases: reading1
### Keywords: datasets

### ** Examples

## Not run: 
##D # from demo(UserGuide13)
##D 
##D data(reading1, package = "R2MLwiN")
##D summary(reading1)
##D 
##D reading1[reading1 == -10] <- NA
##D 
##D summary(reading1)
##D 
##D reading <- reshape(reading1, idvar = "student", timevar = "id",
##D                    varying = c("read1", "age1", "read2", "age2", "read3", "age3",
##D                    "read4", "age4", "read5", "age5", "read6", "age6"),
##D                    sep = "", direction = "long")
##D 
##D reading <- reading[c("student", "id", "age", "read")]
##D reading <- reading[order(reading$student, reading$id), ]
##D 
##D colnames(reading) <- c("student", "occasion", "age", "reading")
##D rownames(reading) <- NULL
##D 
##D summary(reading)
##D 
##D head(reading, 5)
##D 
##D tab <- aggregate(reading ~ occasion, reading,
##D                  function(x) c(N = length(x), mean = mean(x), sd = sd(x)))
##D tab <- rbind(tab, c(NA, NA))
##D tab$reading[7, ] <- c(length(na.omit(reading$reading)),
##D                       mean(na.omit(reading$reading)),
##D                       sd(na.omit(reading$reading)))
##D rownames(tab)[7] <- "Total"
##D tab
##D 
##D tab <- aggregate(age ~ occasion, reading,
##D                  function(x) c(N = length(x), mean = mean(x), sd = sd(x)))
##D tab <- rbind(tab, c(NA, NA))
##D tab$age[7, ] <- c(length(na.omit(reading$age)),
##D                   mean(na.omit(reading$age)),
##D                   sd(na.omit(reading$age)))
##D rownames(tab)[7] <- "Total"
##D tab
##D 
##D (mymodel1 <- runMLwiN(reading ~ 1 + (1 | student) + (1 | occasion),
##D                       data = reading))
## End(Not run)



