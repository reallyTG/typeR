library(simmer.bricks)


### Name: do_parallel
### Title: Perform Parallel Tasks
### Aliases: do_parallel

### ** Examples

env <- simmer()
signal <- function() get_name(env)

task.1 <- trajectory("task 1") %>%
  timeout(function() rexp(1))
task.2 <- trajectory("task 2") %>%
  timeout(function() rexp(1))

## These are equivalent:
trajectory() %>%
  do_parallel(
    task.1,
    task.2,
    .env = env, wait = TRUE
  )

trajectory() %>%
  clone(
    n = 3,
    trajectory("original") %>%
      trap(signal) %>%
      wait() %>%
      wait() %>%
      untrap(signal),
    task.1[] %>%
      send(signal),
    task.2[] %>%
      send(signal)) %>%
  synchronize(wait = TRUE)

## These are equivalent:
trajectory() %>%
  do_parallel(
    task.1,
    task.2,
    .env = env, wait = FALSE
  )

trajectory() %>%
  clone(
    n = 3,
    trajectory("original") %>%
      trap(signal),
    task.1[] %>%
      send(signal),
    task.2[] %>%
      send(signal)) %>%
  synchronize(wait = FALSE) %>%
  wait() %>%
  untrap(signal)




