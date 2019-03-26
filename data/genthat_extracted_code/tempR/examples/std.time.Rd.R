library(tempR)


### Name: std.time
### Title: Time standardize results
### Aliases: std.time

### ** Examples

# vector - toy data example
x <- rep(c(rep(0,18), rep(1,18)), 2)
names(x) <- 1:72
x           # raw time
std.time(x) # standardized time

# data frame - toy data example
y <- data.frame(rbind(c(c(rep(0,18),
                           rep(1,18)),
                           rep(0, 4)),
                           c(rep(c(rep(0,9),
                           rep(1,9)), 2),
                           1, rep(0, 3)),
                           rep(0, 40)))
colnames(y) <- 1:40
y           # raw time
std.time(y) # standardized time

# time standardization using 'bars' data set
# only sample 1 will be done (for illustrative purposes)
eval1 <- unique(bars[bars$sample == 1, (1:3)])
bar1.std <- data.frame(unique(bars[bars$sample == 1, (1:4)]), matrix(0, ncol = 101))

for (e in 1:nrow(eval1)){
  bar1.std[bar1.std$assessor == eval1$assessor[e] &
             bar1.std$session == eval1$session[e] &
             bar1.std$sample == eval1$sample[e],
             -c(1:4)] <- std.time(bars[bars$assessor == eval1$assessor[e] &
                                         bars$session == eval1$session[e] &
                                         bars$sample == eval1$sample[e],
                                           -c(1:4)])
}
colnames(bar1.std)[5:ncol(bar1.std)] <- 0:100
head(bar1.std)



