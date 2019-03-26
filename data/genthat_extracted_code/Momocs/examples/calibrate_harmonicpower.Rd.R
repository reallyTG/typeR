library(Momocs)


### Name: calibrate_harmonicpower
### Title: Quantitative calibration, through harmonic power, for Out and
###   Opn objects
### Aliases: calibrate_harmonicpower calibrate_harmonicpower_efourier
###   calibrate_harmonicpower_rfourier calibrate_harmonicpower_tfourier
###   calibrate_harmonicpower_sfourier calibrate_harmonicpower_dfourier

### ** Examples

b5 <- bot %>% slice(1:5)
b5  %>% calibrate_harmonicpower_efourier(nb.h=12)
b5  %>% calibrate_harmonicpower_rfourier(nb.h=12)
b5  %>% calibrate_harmonicpower_tfourier(nb.h=12)
b5  %>% calibrate_harmonicpower_sfourier(nb.h=12)

# on Opn
olea %>% slice(1:5) %>%
    calibrate_harmonicpower_dfourier(nb.h=12)
## Not run: 
##D # let customize the ggplot
##D library(ggplot2)
##D cal <- b5  %>% calibrate_harmonicpower_efourier(nb.h=12)
##D cal$gg + theme_minimal() +
##D coord_cartesian(xlim=c(3.5, 12.5), ylim=c(90, 100)) +
##D ggtitle("Harmonic power calibration")
## End(Not run)



