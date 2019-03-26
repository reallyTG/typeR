library(afc)


### Name: afc
### Title: Calculate Generalized Discrimination Score 2AFC
### Aliases: afc
### Keywords: file

### ** Examples


  #
  #In all following examples, forecasts of the Nino-3.4 index are evaluated
  #
  #----------------------
  #Example 1: Dichotomous observations, dichotomous forecasts
  # ---------------------
  #Load set of dichotomous observations and dichotomous forecasts
  data(cnrm.nino34.dd)
  obsv = cnrm.nino34.dd$obsv
  fcst = cnrm.nino34.dd$fcst
  #Calculate skill score
  afc(obsv, fcst, obsv.type="d", fcst.type="d")

  # ---------------------
  #Example 2: Dichotomous observations, (ordinal) polychotomous forecasts
  # ---------------------
  #Load set of dichotomous observations and polychotomous forecasts (4 categories)
  data(cnrm.nino34.dm)
  obsv = cnrm.nino34.dm$obsv
  fcst = cnrm.nino34.dm$fcst
  #Calculate skill score
  afc(obsv, fcst, obsv.type="d", fcst.type="m", m=4)

  # ---------------------
  #Example 3: Dichotomous observations, probabilistic forecasts
  # ---------------------
  #Load set of dichotomous observations and probabilistic forecasts
  data(cnrm.nino34.dp)
  obsv = cnrm.nino34.dp$obsv
  fcst = cnrm.nino34.dp$fcst
  #Calculate skill score
  afc(obsv, fcst, obsv.type="d", fcst.type="p")

  # ---------------------
  #Example 4: Dichotomous observations, continuous forecasts
  # ---------------------
  #Load set of dichotomous observations and continuous forecasts
  data(cnrm.nino34.dc)
  obsv = cnrm.nino34.dc$obsv
  fcst = cnrm.nino34.dc$fcst
  #Calculate skill score
  afc(obsv, fcst, obsv.type="d", fcst.type="c")

  # ---------------------
  #Example 5: Dichotomous observations, ensemble forecasts
  # ---------------------
  #Load set of dichotomous observations and 9-member ensemble forecasts
  data(cnrm.nino34.de)
  obsv = cnrm.nino34.de$obsv
  fcst = cnrm.nino34.de$fcst
  #Calculate skill score
  afc(obsv, fcst, obsv.type="d", fcst.type="e")

  # ---------------------
  #Example 6: Polychotomous (ordinal) observations, polychotomous (ordinal) forecasts
  # ---------------------
  #Load set of polychotomous observations (4 categories) and polychotomous forecasts (4 categories)
  data(cnrm.nino34.mm)
  obsv = cnrm.nino34.mm$obsv
  fcst = cnrm.nino34.mm$fcst
  #Calculate skill score
  afc(obsv, fcst, obsv.type="m", fcst.type="m", m=4, m2=4)

  # ---------------------
  #Example 7: Polychotomous (ordinal) observations, probabilistic forecasts forecasts
  # ---------------------
  #Load set of polychotomous observations (4 categories) and probabilistic forecasts
  data(cnrm.nino34.mp)
  obsv = cnrm.nino34.mp$obsv
  fcst = cnrm.nino34.mp$fcst
  #Calculate skill score
  afc(obsv, fcst, obsv.type="m", fcst.type="p", m=4)

  # ---------------------
  #Example 8: Polychotomous (ordinal) observations, continuous forecasts
  # ---------------------
  #Load set of polychotomous observations (4 categories) and continuous forecasts
  data(cnrm.nino34.mc)
  obsv = cnrm.nino34.mc$obsv
  fcst = cnrm.nino34.mc$fcst
  #Calculate skill score
  afc(obsv, fcst, obsv.type="m", fcst.type="c", m=4)

  # ---------------------
  #Example 9: Polychotomous (ordinal) observations, ensemble forecasts
  # ---------------------
  #Load set of polychotomous observations (4 categories) and 9-member ensemble forecasts
  data(cnrm.nino34.me)
  obsv = cnrm.nino34.me$obsv
  fcst = cnrm.nino34.me$fcst
  #Calculate skill score
  afc(obsv, fcst, obsv.type="m", fcst.type="e", m=4)

  # ---------------------
  #Example 10: Polychotomous (nominal) observations, polychotomous (nominal) forecasts
  # ---------------------
  #Load set of polychotomous observations (4 categories) and polychotomous forecasts (4 categories)
  data(cnrm.nino34.mm)
  obsv = cnrm.nino34.mm$obsv
  fcst = cnrm.nino34.mm$fcst
  #Calculate skill score
  afc(obsv, fcst, obsv.type="n", fcst.type="n", m=4)

  # ---------------------
  #Example 11: Polychotomous (nominal) observations, probabilistic forecasts
  # ---------------------
  #Load set of polychotomous observations (4 categories) and probabilistic forecasts
  data(cnrm.nino34.mp)
  obsv = cnrm.nino34.mp$obsv
  fcst = cnrm.nino34.mp$fcst
  #Calculate skill score
  afc(obsv, fcst, obsv.type="n", fcst.type="p", m=4)

  # ---------------------
  #Example 12: Continuous observations, continuous forecasts
  # ---------------------
  #Load set of continuous observations and continuous forecasts
  data(cnrm.nino34.cc)
  obsv = cnrm.nino34.cc$obsv
  fcst = cnrm.nino34.cc$fcst
  #Calculate skill score
  afc(obsv, fcst, obsv.type="c", fcst.type="c")

  # ---------------------
  #Example 13: Continuous observations, ensemble forecasts
  # ---------------------
  #Load set of continuous observations and 9-member ensemble forecasts
  data(cnrm.nino34.ce)
  obsv = cnrm.nino34.ce$obsv
  fcst = cnrm.nino34.ce$fcst
  #Calculate skill score
  afc(obsv, fcst, obsv.type="c", fcst.type="e")




