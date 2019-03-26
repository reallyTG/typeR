library(fullfact)


### Name: ciJack3
### Title: Jackknife confidence intervals 3
### Aliases: ciJack3

### ** Examples

data(chinook_jackL) #Chinook salmon offspring length, delete-one jackknife
ciJack3(chinook_jackL,c(0.0000000,0.7192253,0.2029684,1.0404425,0.1077423,0.5499255),
remain=c("tray","Residual"))



