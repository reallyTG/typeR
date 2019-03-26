library(PET)


### Name: phantom
### Title: Creation of a Phantom
### Aliases: phantom
### Keywords: math smooth

### ** Examples

P1 <- phantom()
P2 <- phantom(addIm="blurred1")
PhPa1 <- c(0.5, 0, 0, 0.4, 0.6)
PhPa2 <- matrix( c(0.6, -0.35, 0, 0.4, 0.6,
         0.3,  0.5,  0, 0.2, 0.35), nrow=2, byrow=TRUE )
P3 <- phantom(design=PhPa1)
P4 <- phantom(design=PhPa2)
viewData(list(P1, P2, P3, P4), list("Default Phantom",  
         "addIm='blurred1'", "First new design",
         "Second new design"))
rm(P1,P2,P3,P4,PhPa1,PhPa2)



