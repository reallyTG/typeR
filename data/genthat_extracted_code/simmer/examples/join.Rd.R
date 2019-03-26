library(simmer)


### Name: join
### Title: Join Trajectories
### Aliases: join

### ** Examples

t1 <- trajectory() %>% seize("dummy", 1)
t2 <- trajectory() %>% timeout(1)
t3 <- trajectory() %>% release("dummy", 1)

## join can be used alone
join(t1, t2, t3)

## or can be chained in a trajectory definition
trajectory() %>%
  join(t1) %>%
  timeout(1) %>%
  join(t3)




