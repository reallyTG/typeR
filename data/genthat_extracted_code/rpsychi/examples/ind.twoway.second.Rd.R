library(rpsychi)


### Name: ind.twoway.second
### Title: A two-way design with independent samples using published work
### Aliases: ind.twoway.second
### Keywords: design htest

### ** Examples

##Cohen (2000) Table 1
m.mat  <- matrix(c(37.13, 39.31, 39.22, 32.71), ncol=2) #2 * 2
sd.mat <- matrix(c(13.82, 9.42, 9.43, 9.62), ncol=2)
n.mat <- matrix(c(9, 13, 8, 14), ncol=2)

ind.twoway.second(m = m.mat, sd = sd.mat, n = n.mat)


##Tabachnick and Fidell (2007) 
#5.7 Complete example of two-way randomized-groups ANOVA (p.221-236)
m.mat <- matrix(c(837.9, 573.6, 354.9, 699.0, 112.0, 
      852.2, 781.6, 683.3, 1193.9, 130.0), ncol=2)    #5 * 2
sd.mat <- matrix(c(189.87449, 61.31195, 147.93351, 128.51891, 43.36922, 
      227.17042, 104.81221, 116.25934, 198.36692, 37.64158), ncol=2) #5 * 2
n.mat <- matrix(rep(10, 10), ncol=2)

ind.twoway.second(m = m.mat, sd = sd.mat, n = n.mat)


##Kline (2004) Table 7.5
dat <- data.frame(
           y = c(2,3,4,1,3,1,3,4,5,5,6,6,6,7),
           A = factor(c(rep("A1",5), rep("A2", 9))),
           B = factor(c(rep("B1",3), rep("B2",2), rep("B1",2), rep("B2",7)))
           )
ind.twoway.second(m = tapply(dat$y, list(dat$A,dat$B), mean), 
                  sd = tapply(dat$y, list(dat$A,dat$B), sd), 
                  n = tapply(dat$y, list(dat$A,dat$B), length)
                    )



