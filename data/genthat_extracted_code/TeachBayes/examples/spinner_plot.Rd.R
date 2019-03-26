library(TeachBayes)


### Name: spinner_plot
### Title: Constructs a spinner
### Aliases: spinner_plot

### ** Examples

  probs <- rep(.2, 5)
  spinner_plot(probs,
         values=c("A", "B", "C", "D", "E"),
         title="My Spinner")
  # probs does not need to be normalized
  spinner_plot(c(1, 2, 1, 2))



