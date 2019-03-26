library(psychReport)


### Name: addDataDF
### Title: addDataDF
### Aliases: addDataDF

### ** Examples

library(psychReport)
# Example 1: default dataframe
dat <- createDF()
dat <- addDataDF(dat)
hist(dat$RT, 100)
table(dat$Error)

# Example 2: defined overall RT parameters
dat <- createDF(nVP = 50, nTrl = 50,
                design = list("Comp" = c("comp", "incomp")))
dat <- addDataDF(dat, RT = c(500, 150, 100))
boxplot(dat$RT ~ dat$Comp)
table(dat$Comp, dat$Error)

# Example 3: defined RT + Error parameters across conditions
dat <- createDF(nVP = 50, nTrl = 50,
                design = list("Comp" = c("comp", "incomp")))
dat <- addDataDF(dat,
                 RT = list(list(c("Comp:comp"), vals = c(500, 80, 100)),
                           list(c("Comp:incomp"), vals = c(550, 80, 140))),
                 Error = list(list(c("Comp:comp"), vals = c(5)),
                              list(c("Comp:incomp"), vals = c(10))))
boxplot(dat$RT ~ dat$Comp)
table(dat$Comp, dat$Error)

# Example 4:
# create dataframe with defined RT + Error parameters across different conditions
dat <- createDF(nVP = 50, nTrl = 50,
                design = list("Comp" = c("comp", "incomp")))
dat <- addDataDF(dat,
                 RT = list(list(c("Comp:comp"), vals = c(500, 150, 150)),
                           list(c("Comp:incomp"), vals = c(550, 150, 100))),
                 Error = list(list(c("Comp:comp"), vals = c(5, 4, 2, 2, 1)),
                            list(c("Comp:incomp"), vals = c(25, 8, 5, 2, 2))))
boxplot(dat$RT ~ dat$Comp)
table(dat$Comp, dat$Error)




