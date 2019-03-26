library(simmer.bricks)


### Name: delayed_release
### Title: Delayed Release of a Resource
### Aliases: delayed_release delayed_release_selected

### ** Examples

## These are equivalent for a non-preemptive resource:
trajectory() %>%
  delayed_release("res1", 5, 1)

trajectory() %>%
  clone(
    2,
    trajectory() %>%
      set_capacity("res1", -1, mod="+") %>%
      release("res1", 1),
    trajectory() %>%
      timeout(5) %>%
      set_capacity("res1", 1, mod="+")
  ) %>%
  synchronize(wait=FALSE)

## These are equivalent for a preemptive resource:
trajectory() %>%
  delayed_release("res2", 5, 1, preemptive=TRUE)

trajectory() %>%
  clone(
    2,
    trajectory() %>%
      release("res2", 1),
    trajectory() %>%
      set_prioritization(c(rep(.Machine$integer.max, 2), 0)) %>%
      seize("res2", 1) %>%
      timeout(5) %>%
      release("res2", 1)
  ) %>%
  synchronize(wait=FALSE)




