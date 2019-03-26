library(bayesdfa)


### Name: sim_dfa
### Title: Simulate from a DFA
### Aliases: sim_dfa

### ** Examples

x <- sim_dfa(num_trends = 2)
names(x)
matplot(t(x$y_sim), type = "l")
matplot(t(x$x), type = "l")

set.seed(42)
x <- sim_dfa(extreme_value = -4, extreme_loc = 10)
matplot(t(x$x), type = "l");abline(v = 10)
matplot(t(x$pred), type = "l");abline(v = 10)

set.seed(42)
x <- sim_dfa()
matplot(t(x$x), type = "l");abline(v = 10)
matplot(t(x$pred), type = "l");abline(v = 10)




