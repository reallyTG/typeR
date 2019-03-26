library(konfound)


### Name: pkonfound
### Title: Perform sensitivity analysis for published studies
### Aliases: pkonfound

### ** Examples

pkonfound(2, .4, 100, 3)
pkonfound(-2.2, .65, 200, 3)
pkonfound(.5, 3, 200, 3)

pkonfound(2, .4, 100, 3, to_return = "thresh_plot")
pkonfound(2, .4, 100, 3, to_return = "corr_plot")

pkonfound_output <- pkonfound(2, .4, 200, 3,
                              to_return = c("raw_output", "thresh_plot", "corr_plot"))
summary(pkonfound_output)
pkonfound_output$raw_output
pkonfound_output$thresh_plot
pkonfound_output$corr_plot



