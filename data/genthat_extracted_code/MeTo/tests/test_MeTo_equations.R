## Compare output of MeTo equations with examples of Allen et al. (1998)
test_that('MeTo', {
  # -----------------------------------------------------------------------------------------------
## Example 2
  # -----------------------------------------------------------------------------------------------
expect_equal(round(psyc_cons(elev = 1800, P = 81.8), 3), 0.054)
  # -----------------------------------------------------------------------------------------------
## Example 3
  # -----------------------------------------------------------------------------------------------
# test e0
expect_equal(round(e0(24.5), 3), 3.075)
expect_equal(round(e0(15), 3), 1.705)
# test satVP
expect_equal(round(satVP(24.5, 15), 2), 2.39)
# -----------------------------------------------------------------------------------------------
## EXAMPLE 4
# -----------------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------------
## EXAMPLE 5
# -----------------------------------------------------------------------------------------------
# Determination of actual vapour pressure from relative humidity
expect_equal(round(e0(18), 3), 2.064)
expect_equal(round(e0(25), 3), 3.168)
# test VP
expect_equal(round(VP(Tmax = 25, Tmin = 18, Rhmax = 82, Rhmin = 54), 2), 1.7) # eq. 17 of Allen et al. (1998)
expect_equal(round(VP(Tmax = 25, Tmin = 18, Rhmean = ((82 + 54)/2)), 2), 1.78) # eq. 19 of Allen et al. (1998)
# -----------------------------------------------------------------------------------------------
## EXAMPLE 6
# -----------------------------------------------------------------------------------------------
# Determination of vapour pressure deficit
# from example 5
expect_equal(round(((e0(18) + e0(25))/2 - VP(Tmax = 25, Tmin = 18, Rhmax = 82, Rhmin = 54)), 2), 0.91)
# -----------------------------------------------------------------------------------------------
## EXAMPLE 7
# -----------------------------------------------------------------------------------------------
# Conversion of latitude in degrees and minutes to radians

# -----------------------------------------------------------------------------------------------
## EXAMPLE 8
# -----------------------------------------------------------------------------------------------
# Determination of extraterrestrial radiation
# Determine the extraterrestrial radiation (Ra ) for 3 September at 20°S.
expect_equal(round(dr(x = 246), 3), 0.985)
expect_equal(round(SolarDec(x = 246), 2), 0.12)
expect_equal(round(ws(x = 246, lat.rad = -0.35), 3), 1.527)
expect_equal(round(Ra(x = 246, lat.rad = -0.35), 1), 32.2)
# -----------------------------------------------------------------------------------------------
## EXAMPLE 9
# -----------------------------------------------------------------------------------------------
# Determination of daylight hours
expect_equal(round(dlh(x = 246, lat.rad = -0.35), 1), 11.7)
# -----------------------------------------------------------------------------------------------
## EXAMPLE 10
# -----------------------------------------------------------------------------------------------
# Determination of solar radiation from measured duration of sunshine
# latitude of 22°54’S, n = 220 hours of sunshine in May.
## test Ra (daily)
expect_equal(round(Ra(x = 135, lat.deg = -22.9), 1), 25.1)
## test dln (daylength hour)
expect_equal(round(dlh(x = 135, lat.deg = -22.9), 1), 10.9)
# Monthly sum 220
## estRs: Rs from N
expect_equal(round(estRs(x = 135, n = 220/31, lat.rad = NULL, lat.deg = -22.9), 1), 14.5)
# -----------------------------------------------------------------------------------------------
## EXAMPLE 11
# -----------------------------------------------------------------------------------------------
# Determination of net longwave radiation
expect_equal(round(Rso(x = 135, elev = 1, lat.deg = -22.9), 1), 18.8)
expect_equal(round(Rnl(x = 135,
                       Rs = estRs(x = 135, n = 220/31, lat.rad = NULL, lat.deg = -22.9),
                       actVP = 2.1, Tmax = 25.1, elev = 1,
                       Tmin = 19.1, Rhmin = NULL, Rhmax = NULL, Rhmean = NULL, lat.deg = -22.9), 1), 3.5)
# -----------------------------------------------------------------------------------------------
## EXAMPLE 12
# -----------------------------------------------------------------------------------------------
# Determination of net radiation
expect_equal(round(Rns(Rs = estRs(x = 135, n = 220/31, lat.rad = NULL, lat.deg = -22.9)), 1), 11.1)
expect_equal(round(Rn(x = 135, elev = 1,
                      Rs = estRs(x = 135, n = 220/31, lat.rad = NULL, lat.deg = -22.9),
                      Tmax = 25.1, Tmin = 19.1, lat.deg = -22.9, actVP = 2.1), 1), 7.6)
# -----------------------------------------------------------------------------------------------
## EXAMPLE 13
# -----------------------------------------------------------------------------------------------
# Determination of soil heat flux for monthly periods
# not implemented
# -----------------------------------------------------------------------------------------------
## EXAMPLE 14
# -----------------------------------------------------------------------------------------------
# Adjusting wind speed data to standard height
expect_equal(round(adj_u2(3.2, uz = 10), 1), 2.4)
# -----------------------------------------------------------------------------------------------
## EXAMPLE 15
# -----------------------------------------------------------------------------------------------
# ToDo: implement equations for  determination of solar radiation from temperature data
# -----------------------------------------------------------------------------------------------
## EXAMPLE 17
# -----------------------------------------------------------------------------------------------
expect_equal(round(deltaVP(Tmax = 34.8, Tmin = 25.6), 3), 0.246)
expect_equal(round(psyc_cons(elev = 2, P = 101.3), 4), 0.0673) # FAO 0.0674
# Ra
expect_equal(round(Ra(x = 105, lat.deg = 13.73), 2), 38.06)
# Daylength
expect_equal(round(dlh(x = 105, lat.deg = 13.73), 2), 12.31)
expect_equal(round(Rn(x = 105, n = 8.5, elev = 2, actVP = 2.85, Tmax = 34.8, Tmin = 25.6, lat.deg = 13.73), 2), 14.33)
expect_equal(round(Rso(x = 105, lat.deg = 13.73, elev = 2), 2), 28.54)
expect_equal(round(Rns(Rs = estRs(x = 105, n = 8.5, lat.deg = 13.73)), 2), 17.44)
# FAO 5.72 here 5.73
expect_equal(round(ETref(x = 105, n = 8.5, elev = 2, actVP = 2.85, Tmax = 34.8, Tmin = 25.6, lat.deg = 13.73, P = 101.3, u = 2, G = 0.14), 2), 5.72)
# -----------------------------------------------------------------------------------------------
## Example 18
# -----------------------------------------------------------------------------------------------
# Determination of ETo with daily data
# as.numeric(strftime(t = '1990-07-06', format = "%j"))
expect_equal(round(adj_u2(u = 10*1000/(60*60), uz = 10), 3), 2.078)
expect_equal(round(psyc_cons(elev = 100), 4), 0.0666)
expect_equal(round(dlh(x = 187, lat.deg = 50 + 48/60), 1), 16.1)
expect_equal(round(Ra(x = 187, lat.deg = 50 + 48/60), 2), 41.09)
expect_equal(round(estRs(x = 187, n = 9.25, lat.deg = 50 + 48/60), 2), 22.07)
expect_equal(round(Rso(x = 187, lat.deg = 50 + 48/60, elev = 100), 2), 30.90)
expect_equal(round(Rns(Rs = estRs(x = 187, n = 9.25, lat.deg = 50 + 48/60)), 2), 17.00)
expect_equal(round(Rnl(x = 187, Tmax = 21.5, Tmin = 12.3, Rhmax = 84, Rhmin = 63,
                       Rs = estRs(x = 187, n = 9.25, lat.deg = 50 + 48/60), lat.deg = 50 + 48/60, elev = 100), 2), 3.71)
expect_equal(round(Rn(x = 187, Tmax = 21.5, Tmin = 12.3, Rhmax = 84, Rhmin = 63,
                      Rs = estRs(x = 187, n = 9.25, lat.deg = 50 + 48/60), lat.deg = 50 + 48/60, elev = 100), 2), 13.28)
expect_equal(round(ETref(x = 187, elev = 100, Tmax = 21.5, Tmin = 12.3, Rhmax = 84, Rhmin = 63, n = 9.25, lat.deg = 50 + 48/60, u = 10*1000/(60*60),
                         P = 100.1, control = list(uz = 10)), 1), 3.9)
# Check ETref for continious time series
expect_equal(round(ETref(x = c(187, 188), elev = 100, lat.deg = 50.8, Tmax = c(21.5, 22), Tmin = c(12.3, 13),
                         Rhmax = c(84, 85), Rhmin = c(63, 61),
                         u = c(2.78, 2), n = c(9.25, 10), control = list(uz = 10), P = c(100.1, 100.2)), 1), c(3.9, 4.0))
# -----------------------------------------------------------------------------------------------
## Example 19
# -----------------------------------------------------------------------------------------------
# Determination of ETo with hourly data
expect_equal(round(w(x = as.POSIXct('2018-10-01 02:30'), long.deg = (360 - (16 + 15/60)), control = list(Lz = 15)), 2) , -2.46)
expect_equal(round(w(x = as.POSIXct('2018-10-01 14:30'), long.deg = (360 - (16 + 15/60)), control = list(Lz = 15)), 3) , 0.682)
# Ra
expect_equal(Ra(x = as.POSIXct('2018-10-01 02:30'), tl = 1, lat.deg = -(16 + (13/60)), long.deg = (360 - (16 + 15/60)),
                 control = list(Lz = 15)) , 0)

expect_equal(round(Ra(x = as.POSIXct('2018-10-01 14:30'), tl = 1, lat.deg = (16 + (13/60)), long.deg = (360 - (16 + 15/60)),
                        control = list(Lz = 15)), 3), 3.543)
# Rso
expect_equal(Rso(x = as.POSIXct('2018-10-01 02:30'), tl = 1, elev = 8, lat.deg = (16 + (13/60)),
                 long.deg = (360 - (16 + 15/60)), control = list(est.ratio.Rs.Rso = 0.8, Lz = 15)), 0)
expect_equal(round(Rso(x = as.POSIXct('2018-10-01 14:30'),
                        tl = 1, elev = 8, lat.deg = (16 + (13/60)), long.deg = (360 - (16 + 15/60)),
                        control = list(Lz = 15)), 3), 2.658)
# Rns
expect_equal(Rns(Rs = 0), 0)
expect_equal(round(Rns(Rs = 2.45), 3), 1.887)
# Rnl
expect_equal(round(Rnl(x = as.POSIXct('2018-10-01 02:30'),
                              Tmean = 28, Rhmean = 90, tl = 1, Rs = 0, elev = 8, lat.deg = (16 + (13/60)),
                              long.deg = (360 - (16 + 15/60)), control = list(est.ratio.Rs.Rso = 0.8, Lz = 15)), 3), 0.100)
expect_equal(round(Rnl(x = as.POSIXct('2018-10-01 14:30'),
                       Tmean = 38, Rhmean = 52, tl = 1, Rs = 2.450, elev = 8, lat.deg = (16 + (13/60)),
                       long.deg = (360 - (16 + 15/60)), control = list(Lz = 15)), 3), 0.137)
# Rn
expect_equal(round(Rn(x = as.POSIXct('2018-10-01 02:30'),
                      Tmean = 28, Rhmean = 90, tl = 1, Rs = 0, elev = 8, lat.deg = (16 + (13/60)),
                      long.deg = (360 - (16 + 15/60)), control = list(est.ratio.Rs.Rso = 0.8, Lz = 15)), 3), -0.100)
expect_equal(round(Rn(x = as.POSIXct('2018-10-01 14:30'),
                      Tmean = 38, Rhmean = 52, tl = 1, Rs = 2.450, elev = 8,
                      lat.deg = (16 + (13/60)), long.deg = (360 - (16 + 15/60)), control = list(Lz = 15)), 3), 1.749)
# estimation of soil heat flux
expect_equal(round(estG(x = as.POSIXct('2018-10-01 02:30'),
                        Tmean = 28, Rhmean = 90, tl = 1, Rs = 0, elev = 8,
                        lat.deg = (16 + (13/60)), long.deg = (360 - (16 + 15/60)),
                        control = list(Lz = 15, est.ratio.Rs.Rso = 0.8)), 3), -0.050)
expect_equal(round(estG(x = as.POSIXct('2018-10-01 14:30'),
                        Tmean = 38, Rhmean = 52, tl = 1, Rs = 2.450, elev = 8,
                        lat.deg = (16 + (13/60)), long.deg = (360 - (16 + 15/60)),
                        control = list(Lz = 15)), 3), 0.175)
# Gras reference evapotranspiration
expect_equal(round(ETref(x = as.POSIXct('2018-10-01 02:30'),
                         Tmean = 28, Rhmean = 90, u = 1.9, tl = 1, Rs = 0, elev = 8,
                        lat.deg = (16 + (13/60)), long.deg = (360 - (16 + 15/60)),
                        control = list(est.ratio.Rs.Rso = 0.8, Lz = 15)), 2), 0.00)
expect_equal(round(ETref(x = as.POSIXct('2018-10-01 14:30'),
                         Tmean = 38, Rhmean = 52, u = 3.3, tl = 1, Rs = 2.450, elev = 8,
                         lat.deg = (16 + (13/60)), long.deg = (360 - (16 + 15/60)),
                         control = list(Lz = 15)), 2), 0.63)
expect_equal(round(ETref(x = as.POSIXct('2018-10-01 14:30'),
                         Tmean = 38, Rhmean = 52, u = 3.3, tl = 1, G = 0.1749218,
                         Rs = 2.450, elev = 8, lat.deg = (16 + (13/60)), long.deg = (360 - (16 + 15/60)),
                         control = list(Lz = 15)), 2), 0.63)
# -----------------------------------------------------------------------------------------------
#  Example 20
# -----------------------------------------------------------------------------------------------
# ToDo: Implement equations for estimating humidity data
# ETref(x = lubridate::yday('2015-07-15'), elev = 200, Tmax = 26.5, Tmin = 14.8, u = 2)
# -----------------------------------------------------------------------------------------------
})

# ETref(x = as.POSIXct(c('2018-10-01 14:30', '2018-10-01 15:30')),
#       Tmean = c(38, 37.8), Rhmean = c(52, 52.3), u = c(3.3, 3.2), Rs = c(2.450, 2.5), elev = 8,
#       lat.deg = 16.22, long.deg = 343.75, G = c(0.175, 0.178) , P = c(101.21, 101.21) ,
#       control = list(Lz = 15, albedo = c(0.23, 1)))

