library(qwraps2)


### Name: qblandaltman
### Title: Bland Altman Plots
### Aliases: qblandaltman qblandaltman_build_data_frame

### ** Examples

## Not run: 
##D 
##D # load ggplot2 and the diamonds data set
##D data(diamonds, package = "ggplot2")
##D 
##D # compare a simple regression to random noise
##D dat <- 
##D   data.frame(fitted(lm(price ~ poly(carat, 4), data = diamonds)),  # fitted values
##D              diamonds$price + rnorm(nrow(diamonds), sd = 0.2),     # observed with noise
##D              pi)                                                   # extra column
##D qblandaltman(dat)
##D 
##D # simple example
##D dat <- data.frame(eval1 = rpois(100, 3), eval2 = rpois(100, 3.4)) 
##D qblandaltman(dat)
##D 
##D ggplot2::last_plot() + ggplot2::theme_bw()
##D 
##D # Two plots in one ggplot object
##D set.seed(42)
##D dat1 <- data.frame(eval1 = rnorm(100), eval2 = rt(100, df = 1))
##D dat2 <- data.frame(eval1 = rpois(50, 3), eval2 = rpois(50, 4))
##D 
##D # individual plots
##D qblandaltman(dat1)
##D qblandaltman(dat2)
##D 
##D # combined plots
##D dat <- rbind(cbind(set = "rnorm", qblandaltman_build_data_frame(dat1)), 
##D              cbind(set = "rpois", qblandaltman_build_data_frame(dat2)))
##D qblandaltman(dat, generate_data = FALSE) + ggplot2::facet_wrap( ~ set)
##D 
## End(Not run)



