library(FlexParamCurve)


### Name: change.pnparameters
### Title: Change Fixed Parameter Values
### Aliases: change.pnparameters

### ** Examples



# change all fixed values except K and Rk


    modpar(posneg.data$age, posneg.data$mass, pn.options = "myoptions")


    change.pnparameters(Asym = 10000, Infl = 80, M = 5, RAsym = 10000, 


        Ri = 240, RM = 5, pn.options = "myoptions")





# change fixed values of M and constrain hatching mass to 45.5 in a growth curve


    change.pnparameters(M = 1, RM = 0.5, first.y = 45.5, pn.options = "myoptions")





