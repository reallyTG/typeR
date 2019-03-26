library(Momocs)


### Name: which_out
### Title: Identify outliers
### Aliases: which_out

### ** Examples

# on a numeric
x <- rnorm(10)
x[4] <- 99
which_out(x)

# on a Coe
bf <- bot %>% efourier(6)
bf$coe[c(1, 6), 1] <- 5
which_out(bf)

# on Ldk
w_no <- w_ok <- wings
w_no$coo[[2]][1, 1] <- 2
w_no$coo[[6]][2, 2] <- 2
which_out(w_ok, conf=1e-12) # with low conf, no outliers
which_out(w_no, conf=1e-12) # as expected

# a way to illustrate, filter outliers
# conf has been chosen deliberately low to show some outliers
x_f <- bot %>% efourier
x_p <- PCA(x_f)
# which are outliers (conf is ridiculously low here)
which_out(x_p$x[, 1], 0.5)
cols <- rep("black", nrow(x_p$x))
outliers <- which_out(x_p$x[, 1], 0.5)
cols[outliers] <- "red"
plot(x_p, col=cols)
# remove them for Coe, rePCA, replot
x_f %>% slice(-outliers) %>% PCA %>% plot

# or directly with which_out.Coe
# which relies on a PCA
outliers <- x_f %>% which_out(0.5, nax=0.95) %>% na.omit()
x_f %>% slice(-outliers) %>% PCA %>% plot



