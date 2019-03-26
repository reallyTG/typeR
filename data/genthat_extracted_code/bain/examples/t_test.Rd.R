library(bain)


### Name: t_test
### Title: Student's t-Test
### Aliases: t_test t_test.default t_test.formula
### Keywords: htest

### ** Examples


require(graphics)

t_test(1:10, y = c(7:20))      # P = .00001855
t_test(1:10, y = c(7:20, 200)) # P = .1245    -- NOT significant anymore

## Classical example: Student's sleep data
plot(extra ~ group, data = sleep)
## Traditional interface
with(sleep, t_test(extra[group == 1], extra[group == 2]))
## Formula interface
t_test(extra ~ group, data = sleep)



