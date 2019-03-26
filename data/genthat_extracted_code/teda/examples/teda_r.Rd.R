library(teda)


### Name: teda_r
### Title: Create teda recursive object from observation (+ state)
### Aliases: teda_r

### ** Examples

vec = c(20, 12, 10, 20)
a = teda_r(vec[1])
b = teda_r(vec[2],
           a$curr_mean,
           a$curr_var,
           a$next_k)
c = teda_r(vec[3],
           b$curr_mean,
           b$curr_var,
           b$next_k)

d = teda_r(vec[4],
           c$curr_mean,
           c$curr_var,
           c$next_k)
summary(d)




