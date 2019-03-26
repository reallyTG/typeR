library(mixlm)


### Name: t_test
### Title: Text book versions of t-tests and z-tests.
### Aliases: t_test t_test.formula t_test.default t_test_sum z_test
###   z_test.formula z_test.default z_test_sum
### Keywords: htest

### ** Examples


t.test(1:10,y=c(7:20))      # P = .00001855
t.test(1:10,y=c(7:20, 200)) # P = .1245    -- NOT significant anymore

## Classical example: Student's sleep data
plot(extra ~ group, data = sleep)
## Traditional interface
with(sleep, t.test(extra[group == 1], extra[group == 2]))
## Formula interface
t_test(extra ~ group, data = sleep)



