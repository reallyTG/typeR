library(bunchr)


### Name: bunch_viewer
### Title: Visualizing a histogram and potential excluded areas
### Aliases: bunch_viewer

### ** Examples

ability_vec <- 4000 * rbeta(100000, 2, 5)
earning_vec <- sapply(ability_vec, earning_fun, 0.2, 0.1, 0.2, 0, 1000)
bunch_viewer(earning_vec, 1000, 20, 40, 2, 2, 20, trimy = TRUE, report = FALSE)




