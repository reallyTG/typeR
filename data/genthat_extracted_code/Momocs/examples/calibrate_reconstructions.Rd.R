library(Momocs)


### Name: calibrate_reconstructions
### Title: Calibrate using reconstructed shapes
### Aliases: calibrate_reconstructions calibrate_reconstructions_efourier
###   calibrate_reconstructions_rfourier calibrate_reconstructions_tfourier
###   calibrate_reconstructions_sfourier calibrate_reconstructions_npoly
###   calibrate_reconstructions_opoly calibrate_reconstructions_dfourier

### ** Examples


### On Out
shapes %>%
    calibrate_reconstructions_efourier(id=1, range=1:6)

# you may prefer efourier...
shapes %>%
    calibrate_reconstructions_tfourier(id=1, range=1:6)

#' you may prefer efourier...
shapes %>%
    calibrate_reconstructions_rfourier(id=1, range=1:6)

#' you may prefer efourier... # todo
#shapes %>%
#     calibrate_reconstructions_sfourier(id=5, range=1:6)

### On Opn
olea %>%
    calibrate_reconstructions_opoly(id=1)

olea %>%
    calibrate_reconstructions_npoly(id=1)

olea %>%
    calibrate_reconstructions_dfourier(id=1)




