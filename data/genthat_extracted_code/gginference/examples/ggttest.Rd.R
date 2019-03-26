library(gginference)


### Name: ggttest
### Title: Student's t-test plot
### Aliases: ggttest

### ** Examples


t_test <- t.test(sleep$extra ~ sleep$group)
t_test
ggttest(t_test)


t_test2 <- t.test(x = 1:10, y = c(7:20)) 
t_test2
ggttest(t_test2)




