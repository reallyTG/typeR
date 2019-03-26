library(spatstat.data)


### Name: ants
### Title: Harkness-Isham ants' nests data
### Aliases: ants ants.extra
### Keywords: datasets spatial

### ** Examples

  if(require(spatstat)) {

  # Equivalent to Figure 1 of Harkness and Isham (1983)

  data(ants)
  ants.extra$plotit()

  # Data in subrectangle A, rotated 
  # Approximate data used by Sarkka (1993)

  angle <- atan(diff(ants.extra$fieldscrub$y)/diff(ants.extra$fieldscrub$x))
  plot(rotate(ants.extra$A, -angle))

  # Approximate window used by Takacs and Fiksel (1986)

  tfwindow <- boundingbox(Window(ants))
  antsTF <- ppp(ants$x, ants$y, window=tfwindow)
  plot(antsTF)
  }



