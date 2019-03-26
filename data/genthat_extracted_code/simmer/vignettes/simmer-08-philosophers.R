## ---- cache=FALSE, include=FALSE-----------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>", 
                      fig.width = 6, fig.height = 4, fig.align = "center")

required <- c("simmer.plot")

if (!all(sapply(required, requireNamespace, quietly = TRUE)))
  knitr::opts_chunk$set(eval = FALSE)

## ---- message=FALSE------------------------------------------------------
library(simmer)
library(simmer.plot)

simulate <- function(fork_seq, time, thinking=function() rexp(1, 1),
                     eating=function() rexp(1, 1), lag=0.1, seed=333)
{
  set.seed(seed)

  env <- simmer("Dining philosophers")

  for (i in seq_along(fork_seq)) {
    philosopher <- names(fork_seq)[[i]]
    forks <- paste0("fork_", fork_seq[[i]])

    dining <- trajectory() %>%
      timeout(thinking) %>%
      seize(forks[[1]]) %>%
      timeout(lag) %>%
      seize(forks[[2]]) %>%
      timeout(eating) %>%
      release(forks[[1]]) %>%
      release(forks[[2]]) %>%
      rollback(7) # back to think

    env %>%
      add_resource(paste0("fork_", i)) %>%
      add_generator(paste0(philosopher, "_"), dining, at(0))
  }

  run(env, time)
}

## ---- message=FALSE------------------------------------------------------
states <- c("hungry", "eating")

philosophers_gantt <- function(env, size=15) env %>%
  get_mon_arrivals(per_resource=TRUE) %>%
  transform(philosopher = sub("_[0-9]*", "", name),
            state = factor(states, states)) %>%
  ggplot(aes(y=philosopher, yend=philosopher)) + xlab("time") +
  geom_segment(aes(x=start_time, xend=end_time, color=state), size=size)

## ---- message=FALSE------------------------------------------------------
fork_seq <- list(
  Socrates   = c(1, 2),
  Pythagoras = c(2, 3),
  Plato      = c(3, 4),
  Aristotle  = c(4, 1)
)

simulate(fork_seq, time=50) %>%
  print() %>%
  philosophers_gantt() + theme_bw()

## ---- message=FALSE------------------------------------------------------
fork_seq$Aristotle <- rev(fork_seq$Aristotle)

simulate(fork_seq, time=50) %>%
  print() %>%
  philosophers_gantt() + theme_bw()

