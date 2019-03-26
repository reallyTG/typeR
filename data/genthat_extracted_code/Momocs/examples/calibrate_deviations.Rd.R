library(Momocs)


### Name: calibrate_deviations
### Title: Quantitative calibration, through deviations, for Out and Opn
###   objects
### Aliases: calibrate_deviations calibrate_deviations_efourier
###   calibrate_deviations_tfourier calibrate_deviations_rfourier
###   calibrate_deviations_sfourier calibrate_deviations_npoly
###   calibrate_deviations_opoly calibrate_deviations_dfourier

### ** Examples

b5 <- slice(bot, 1:5) #for the sake of speed
b5 %>% calibrate_deviations_efourier()
b5 %>% calibrate_deviations_rfourier()
b5 %>% calibrate_deviations_tfourier()
b5 %>% calibrate_deviations_sfourier()

o5 <- slice(olea, 1:5) #for the sake of speed
o5 %>% calibrate_deviations_opoly()
o5 %>% calibrate_deviations_npoly()
o5 %>% calibrate_deviations_dfourier()




