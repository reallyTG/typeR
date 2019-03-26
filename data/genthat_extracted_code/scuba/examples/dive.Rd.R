library(scuba)


### Name: dive
### Title: Define a Dive Profile
### Aliases: dive
### Keywords: utilities

### ** Examples

  # Dive to 25 m for 20 min followed by safety stop at 5 metres for 3 min
  d <- dive(c(25,20),c(5,3))
  plot(d)

  # Bounce dive to 20 metres
  d <- dive(20)

  # Two dives separated by a one-hour surface interval
  d <- dive(c(30,15),c(9,2),c(5,5),c(0,60),c(12,60),c(5,5))

  # ASCENT RATES
  # Ascent rate 18 m/min below 9 metres, 6m/min above 9 metres
  d <- dive(c(30, 12), ascent(18), 9, ascent(6), c(5,3))

  # UPLOADED DIVE PROFILE
  data(baron)
  pro <- baron[, 1:2]
  d <- dive(pro)
  d <- dive(pro, begin=NA, end=NA)
  plot(d)

  # GAS USE
  # 30-metre dive on Nitrox 32
  d <- dive(nitrox(0.32), c(30,20), c(5,5))

  # GAS SWITCHING
  # Dive to 18 m for 30 min on air,
  # switch to Nitrox 36, ascend to 5 metres, safety stop
  d <- dive(c(18, 30), nitrox(0.36), c(5,3))
  # Same as above, but ascend to 5 m on air, then switch gas
  d <- dive(c(18, 30), 5, nitrox(0.36), c(5,3))

  # SWITCHING TO SPECIFIC TANKS
  d <- dive(tanklist=list(main=air, deco=nitrox(0.50)),
            tank="main", c(30, 20), 5, tank="deco", c(5,10))

  # Descend to 5 metres on pure oxygen, switch to Trimix,
  # descend to 30 metres, remain 40 minutes, ascend to 6 metres,
  # switch to pure oxygen, ascend to 5 metres, decompress 10 minutes,
  # surface and continue breathing pure oxygen for 10 minutes

  d <- dive(tanklist=list(travel=trimix(0.15, 0.5), deco=nitrox(1)),
            tank="deco", 5, tank="travel", c(30,40), 6, tank="deco",
            c(5,10), c(0,10))




