library(StratigrapheR)


### Name: reposition
### Title: Core correction
### Aliases: reposition

### ** Examples

# ----

d <- zeq_example

dec <- d$Dec
inc <- d$Inc

cdec <- 75
cinc <- 45
crot <- 90

par(mfrow = c(2,2))

earnet()
earpoints(dec,inc)
earpoints(0, 90, l = list(cex = 2))
earpoints(0, 90, l = list(col = "red", bg = "red"))
title("1. Laboratory projection,
      axis for rotating the specimen")

# Roll ----

roll <- reposition(dec, inc, crot = 90)

earnet()
earpoints(roll$dec,roll$inc)
earpoints(0, 90, l = list(cex = 2))
earpoints(90, 0, h = list(col = "red", bg = "pink"), double = TRUE)
title("2. Correction of the specimen rotation,
      in red the axis for tilting the specimen")

# Tilt ---

tilt <- reposition(dec, inc, cinc = cinc ,crot = crot)

earnet()
earpoints(0, cinc, l = list(cex = 2))
earpoints(tilt$dec, tilt$inc)
earpoints(0,90, l = list(col = "red", bg = "red"))
title("3. Correction of the specimen inclination,
      in red the axis for rotating the tilted specimen")

# Orient ---

orient <- reposition(dec, inc, cdec = cdec, cinc = cinc ,crot = crot)

earnet()
earpoints(cdec, cinc, l = list(cex = 2))
earpoints(orient$dec, orient$inc)
title("4. Full geographical repositioning,
      the big dot is the core orientation")

par(mfrow = c(1,1))

# ----




