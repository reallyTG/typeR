library(rstanarm)


### Name: ps_check
### Title: Graphical checks of the estimated survival function
### Aliases: ps_check

### ** Examples

## No test: 
if (!exists("example_jm")) example(example_jm)
# Compare estimated survival function to Kaplan-Meier curve
ps <- ps_check(example_jm)
ps + 
 ggplot2::scale_color_manual(values = c("red", "black")) + # change colors
 ggplot2::scale_size_manual(values = c(0.5, 3)) + # change line sizes 
 ggplot2::scale_fill_manual(values = c(NA, NA)) # remove fill
## End(No test)



