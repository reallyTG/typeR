library(prefmod)


### Name: pattPC.fit
### Title: Function to fit a pattern model for paired comparisons
### Aliases: pattPC.fit
### Keywords: models multivariate

### ** Examples

# fit only first three objects with undecided parameter
pattPC.fit(cemspc, nitems = 3, undec = TRUE)

# check for ignorable missing
pattPC.fit(cemspc, nitems = 3, undec = TRUE, NItest = TRUE)

# check if SEX has an effect
m1 <- pattPC.fit(cemspc, nitems = 3, formel = ~1,   elim = ~SEX, undec = TRUE)
m2 <- pattPC.fit(cemspc, nitems = 3, formel = ~SEX, elim = ~SEX, undec = TRUE)

# calculate LR test for SEX
ll1 <- m1$result$minimum
ll2 <- m2$result$minimum
df1 <- length(m1$result$estimate)
df2 <- length(m2$result$estimate)
lr  <- 2*(ll1 - ll2)
df  <- df2 - df1
cat("LR test = ", lr, " on df = ", df, " (p = ",
    round(pchisq(lr, df, lower.tail = FALSE), digits = 5), ")\n", sep = "")


# generates data set with three items and some missing values in
# comparison (23), column 3, then there are no NAs for object 1
data3 <- dat4[, 1:3]
idx3  <- sample(1:100, 10)
data3[idx3, 3] <- NA
checkMIS(data3, nitems = 3, verbose = TRUE)

# estimate MNAR PC pattern model for data3 without alpha1 and beta1
pattPC.fit(data3, nitems = 3,
  MISalpha = c(FALSE, TRUE, TRUE),
  MISbeta  = c(FALSE, TRUE, TRUE))



