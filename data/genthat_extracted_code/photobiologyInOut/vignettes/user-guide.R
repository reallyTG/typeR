## ---- setup, include=FALSE, cache=FALSE--------------
library(knitr)
opts_chunk$set(fig.align='center', fig.show='hold',
               fig.width=7, fig.height=6, size="footnotesize")
options(replace.assign = TRUE, width = 55,
        warnPartialMatchAttr = FALSE,
        warnPartialMatchDollar = FALSE,
        warnPartialMatchArgs = FALSE)

## ---- example-0-hiden, eval=TRUE, message=FALSE------
# setting TZ may be needed in some geographic locations as some Windows TZ 
# strings are not recognized by all versions of R
Sys.setenv(TZ = 'UTC')
library(photobiology)
library(photobiologyWavebands)
library(photobiologyInOut)
library(lubridate)
library(ggplot2)
library(ggspectra)
library(hyperSpec)
library(colorSpec)
library(pavo)
library(readr)

## ----------------------------------------------------
options(tibble.print_max = 5,
        tibble.print_min = 3,
        photobiology.strict.range = NA_integer_)

## ----------------------------------------------------
jaz.raw.file <- 
  system.file("extdata", "spectrum.jaz", 
              package = "photobiologyInOut", mustWork = TRUE)
jazraw.spct <- read_oo_jazdata(file = jaz.raw.file)
jazraw.spct <- trim_wl(jazraw.spct, range = c(250, 900))

## ----------------------------------------------------
plot(jazraw.spct)

## ----------------------------------------------------
getWhenMeasured(jazraw.spct)

## ----------------------------------------------------
getInstrDesc(jazraw.spct)

## ----------------------------------------------------
getInstrSettings(jazraw.spct)

## ----------------------------------------------------
jaz.s.irrad.file <- 
  system.file("extdata", "spectrum.JazIrrad", 
              package = "photobiologyInOut", mustWork = TRUE)
jaz.spct <- read_oo_jazirrad(file = jaz.s.irrad.file)
jaz0.spct <- jaz.spct
jaz.spct <- trim_wl(jaz.spct, range = c(290, 800))

## ----------------------------------------------------
plot(jaz.spct)

## ----------------------------------------------------
jaz.spct <- fshift(jaz0.spct, range = c(255, 290), f = "mean")
jaz.spct <- trim_wl(jaz.spct, range = c(290, 800))
plot(jaz.spct)

## ----------------------------------------------------
jaz.spct <- smooth_spct(jaz.spct)
plot(jaz.spct)

## ----------------------------------------------------
e_irrad(jaz.spct, PAR())       # W m-2

## ----------------------------------------------------
plot(read_oo_jazirrad(file = jaz.s.irrad.file))

## ----------------------------------------------------
plot(read_oo_jazirrad(file = jaz.s.irrad.file),
     range = c(250,850))

## ----------------------------------------------------
plot(smooth_spct(read_oo_jazirrad(file = jaz.s.irrad.file)),
     range = c(250,850))

## ----------------------------------------------------
q.raw.file <- 
  system.file("extdata", "spectrum.SSIrrad", 
              package = "photobiologyInOut", mustWork = TRUE)
plot(read_oo_ssirrad(file = q.raw.file))

## ----------------------------------------------------
ava.raw.file <- 
  system.file("extdata", "spectrum-avaspec.csv", 
              package = "photobiologyInOut", mustWork = TRUE)
plot(read_avaspec_csv(file = ava.raw.file),
     range = c(280, 900), unit.out = "photon")

## ----------------------------------------------------
macam.raw.file <- 
  system.file("extdata", "spectrum.DTA", 
              package = "photobiologyInOut", mustWork = TRUE)
plot(read_macam_dta(file = macam.raw.file))

## ----------------------------------------------------
licor.file <- 
  system.file("extdata", "spectrum.PRN", 
              package = "photobiologyInOut", mustWork = TRUE)
licor.spct <- read_licor_prn(file = licor.file)

## ----------------------------------------------------
licor.spct
cat(comment(licor.spct))
plot(licor.spct, unit.out = "photon")

## ----------------------------------------------------
licor.file <- 
  system.file("extdata", "reflectance.PRN", 
              package = "photobiologyInOut", mustWork = TRUE)
licor.spct <- read_licor_prn(file = licor.file, s.qty = "Rfr")

## ----------------------------------------------------
licor.spct
cat(comment(licor.spct))
plot(licor.spct)

## ----------------------------------------------------
cs.day.file <- 
  system.file("extdata", "cr6-day.dat", 
              package = "photobiologyInOut", mustWork = TRUE)

## ---- eval=FALSE-------------------------------------
#  # not run
#  read_lines(yoctopuce_hour.file, n_max = 10)

## ----------------------------------------------------
day.dat <- read_csi_dat(file = cs.day.file)
day.dat

## ----------------------------------------------------
cs_hour.file <- 
  system.file("extdata", "cr6-hour.dat", 
              package = "photobiologyInOut", mustWork = TRUE)
hour.dat <- read_csi_dat(file = cs_hour.file)
ggplot(hour.dat, aes(TIMESTAMP, PAR_Den_Avg)) + geom_line()

## ----------------------------------------------------
yoctopuce_hour.file <- 
  system.file("extdata", "yoctopuce-data.csv", 
              package = "photobiologyInOut", mustWork = TRUE)

## ---- eval=FALSE-------------------------------------
#  # not run
#  read_lines(yoctopuce_hour.file, n_max = 10)

## ----------------------------------------------------
hour.dat <- read_yoctopuce_csv(file = yoctopuce_hour.file)
ggplot(hour.dat, aes(ISO.time, temperature.avg)) + geom_line()

## ----------------------------------------------------
tuv.file <- 
  system.file("extdata", "usrout.txt", 
              package = "photobiologyInOut", mustWork = TRUE)
tuv.spct <- read_tuv_usrout(file = tuv.file,
                            date = ymd("2014-03-21"))
summary(subset(tuv.spct, spct.idx == "A"))
tuv.spct

## ---- fig.height=10----------------------------------
plot(tuv.spct, annotations = c("colour.guide")) +
  facet_wrap(~date, ncol = 2)

## ----------------------------------------------------
tuv.mspct <- subset2mspct(tuv.spct)
tuv.mspct

## ----------------------------------------------------
tuv_nd.spct <- read_tuv_usrout(file = tuv.file)
tuv_nd.spct

## ----------------------------------------------------
qtuv.file <- 
  system.file("extdata", "qtuv.txt", 
              package = "photobiologyInOut", mustWork = TRUE)
qtuv.spct <- read_qtuv_txt(file = qtuv.file)
summary(qtuv.spct)
qtuv.spct

## ----------------------------------------------------
uvspec.2col.file <- 
  system.file("extdata", "uvspec-plain-2col.dat", 
              package = "photobiologyInOut", mustWork = TRUE)
lrt.df <- read.table(file = uvspec.2col.file,
                     col.names = c("w.length", "s.e.irrad"))
uvspec.01.spct <- source_spct(w.length = lrt.df$w.length,
                               s.e.irrad = lrt.df$s.e.irrad * 1e-3)
summary(uvspec.01.spct)
cat(comment(uvspec.01.spct))
plot(uvspec.01.spct, range = c(250, 2500), unit.out = "photon")

## ----------------------------------------------------
uvspec.disort.file <- 
  system.file("extdata", "uvspec-disort.dat", 
              package = "photobiologyInOut", mustWork = TRUE)
uvspec.02.spct <- read_uvspec_disort(uvspec.disort.file)
summary(uvspec.02.spct)
cat(comment(uvspec.02.spct))
plot(uvspec.02.spct, unit.out = "photon")

## ----------------------------------------------------
ggplot(uvspec.02.spct) +
  geom_line() +
  geom_line(aes(y = s.e.irrad.diff), linetype = "dashed")

## ----------------------------------------------------
uvspec.disort.inp.file <- 
  system.file("extdata", "uvspec-disort.inp", 
              package = "photobiologyInOut", mustWork = TRUE)
comment(uvspec.02.spct) <- paste(comment(uvspec.02.spct),
                                 read_file(uvspec.disort.inp.file),
                                 sep = "\n\n")
cat(comment(uvspec.02.spct))

## ----------------------------------------------------
uvspec.multi.file <- 
  system.file("extdata", "uvspec-multi.dat", 
              package = "photobiologyInOut", mustWork = TRUE)
lbr.multi.spct <- read_uvspec_disort_vesa(uvspec.multi.file)
print(lbr.multi.spct, n = 5)

## ----------------------------------------------------
fmi.file <- 
  system.file("extdata", "2014-08-21_cum.hel", 
              package = "photobiologyInOut", mustWork = TRUE)
z.spct <- read_fmi_cum(fmi.file)
class_spct(z.spct)
getWhenMeasured(z.spct)
z.spct

## ----------------------------------------------------
fmi.files <- 
  system.file("extdata", c("2014-08-21_cum.hel", "2014-08-21_cum.hel"),
              package = "photobiologyInOut", mustWork = TRUE)
z.mspct <- read_m_fmi_cum(fmi.files)
class(z.mspct)
getWhenMeasured(z.mspct)
z.mspct

## ---- eval=FALSE-------------------------------------
#  fmi.files <- list.files(".", "*cum.hel")
#  fmi.files <- paste(".", fmi.files, sep = "")
#  z1.mspct <- read_m_fmi_cum(fmi.files)
#  class(z1.mspct)
#  getWhenMeasured(z1.mspct)
#  z1.mspct

## ---- message=FALSE----------------------------------
# because of Google's query limits call will frequently fail without a key
# my.geocode <- ggmap::geocode("Kumpula, Helsinki, Finland", source = "google")
my.geocode <- data.frame(lon = 24.96474, lat = 60.20911)
z2.mspct <-
  read_m_fmi_cum(fmi.files,
                 geocode = my.geocode)
class(z2.mspct)
getWhenMeasured(z2.mspct)
getWhereMeasured(z2.mspct)
z2.mspct

## ----------------------------------------------------
fmi.file <- 
  system.file("extdata", "2013-05-01.hel", 
              package = "photobiologyInOut", mustWork = TRUE)
z3.mspct <- read_fmi2mspct(fmi.file)
class(z3.mspct)[1:2]
getWhenMeasured(z3.mspct[[1]])
length(z3.mspct)
names(z3.mspct)
getWhenMeasured(z3.mspct[[1]])
getWhatMeasured(z3.mspct[[1]])

## ----------------------------------------------------
fred.file <- 
  system.file("extdata", "FReDflowerID_157.csv", 
              package = "photobiologyInOut", mustWork = TRUE)
fred.spct <- read_FReD_csv(file = fred.file, 
                           label = "Gazania heterochaeta",
                           geocode = data.frame(lat = -28.8751, lon = 17.2293))

## ----------------------------------------------------
fred.spct
cat(comment(fred.spct))
plot(fred.spct)

## ----------------------------------------------------
aster.file <- 
  system.file("extdata", "drygrass-spectrum.txt", 
              package = "photobiologyInOut", mustWork = TRUE)
aster.spct <- read_ASTER_txt(file = aster.file)

## ----------------------------------------------------
aster.spct
cat(comment(aster.spct))
plot(aster.spct)

## ----------------------------------------------------
z2.hspct <- mspct2hyperSpec(z2.mspct, "s.e.irrad")
class(z2.hspct)
# plot(z2.hspct)

## ----------------------------------------------------
class(laser)
laser
plot(laser)

## ----------------------------------------------------
wl(laser) <- list (
  wl = 1e7 / (1/405e-7 - wl (laser)),
  label = expression (lambda / nm)
)
laser
plot(laser)
laser.mspct <-
  hyperSpec2mspct(laser, "source_spct", "s.e.irrad", multiplier = 1e-3)
ggplot(laser.mspct[[1]]) +
  geom_line() +
  stat_peaks(geom = "text", vjust = -1, label.fmt = "%.6g nm", color = "red")

## ----------------------------------------------------
# bug that needs to be fixed
fluorescent.mspct <- colorSpec2mspct(Fs.5nm)
print(fluorescent.mspct, n = 3, n.members = 3)

## ----------------------------------------------------
colorSpec2mspct(Hoya)

## ----------------------------------------------------
fluorescent.spct <- colorSpec2spct(Fs.5nm)
plot(fluorescent.spct) + aes(linetype = spct.idx)

## ----------------------------------------------------
colorSpec2chroma_spct(xyz1931.5nm)

## ----------------------------------------------------
sun.cspec <- spct2colorSpec(sun.spct)
plot(sun.cspec, col = "blue")

## ----------------------------------------------------
spct2colorSpec(yellow_gel.spct)

## ----------------------------------------------------
chroma_spct2colorSpec(beesxyzCMF.spct)

## ----------------------------------------------------
data(sicalis)
class(sicalis)
names(sicalis)

## ----------------------------------------------------
sicalis.mspct <- rspec2mspct(sicalis, "reflector_spct", "Rpc")
summary(sicalis.mspct[[1]])
summary(sicalis.mspct[[2]])
summary(sicalis.mspct[[3]])

## ----------------------------------------------------
ggplot(rbindspct(sicalis.mspct[1:3])) +
  aes(linetype = spct.idx) +
  ylim(0,0.3) +
  geom_line()

## ----------------------------------------------------
print(sicalis.mspct[c(TRUE, FALSE, FALSE)])
ggplot(rbindspct(sicalis.mspct[c(TRUE, FALSE, FALSE)])) +
  aes(linetype = spct.idx) +
  ylim(0,0.15) +
  geom_line() +
  ggtitle("'crown' reflectance spectra")

## ----------------------------------------------------
refl.by.band <- reflectance(sicalis.mspct, w.band = list(Red(), Green(), Blue(), UVA()))
refl.by.band$body.part <- c("crown", "throat", "breast")

## ----------------------------------------------------
refl.red <- reflectance(sicalis.mspct, w.band = Red())
names(refl.red)[2] <- "red.reflectance"
refl.red$body.part <- c("crown", "throat", "breast")
ggplot(refl.red, aes(x = body.part, y = red.reflectance)) +
  stat_summary(fun.data = "mean_se", color = "red") +
  geom_point(alpha = 0.5)

## ----------------------------------------------------
jaz.irrad.comma.file <- 
  system.file("extdata", "spectrum-comma.JazIrrad", 
              package = "photobiologyInOut", mustWork = TRUE)
my.locale <- locale(decimal_mark = ",", tz = "EET")
jaz00.spct <- read_oo_jazirrad(file = jaz.irrad.comma.file,
                               locale = my.locale)

## ----------------------------------------------------
jaz00.spct

## ----------------------------------------------------
jaz.s.irrad.file <- 
  system.file("extdata", "spectrum.JazIrrad", 
              package = "photobiologyInOut", mustWork = TRUE)

## ---- warning=FALSE----------------------------------
jaz01.spct <- read_oo_jazirrad(file = jaz.s.irrad.file,
                               date = NULL)
getWhenMeasured(jaz01.spct)

## ---- warning=FALSE----------------------------------
jaz02.spct <- read_oo_jazirrad(file = jaz.s.irrad.file,
                               date = ymd_hms("2015-11-15 12:00:00"))
getWhenMeasured(jaz02.spct)

## ---- warning=FALSE----------------------------------
jaz03.spct <- read_oo_jazirrad(file = jaz.s.irrad.file,
                               date = now())
getWhenMeasured(jaz03.spct)

## ---- message=FALSE,warning=FALSE--------------------
# because of Google's query restrictions call may occasionally fail
# my.geocode <- ggmap::geocode("Vikki, 00790 Helsinki, Finland", source = "google")
my.geocode <- data.frame(lon = 25.02006, lat = 60.22525)
jaz04.spct <- read_oo_jazirrad(file = jaz.s.irrad.file,
                               geocode = my.geocode)
jaz04.spct
getWhereMeasured(jaz04.spct)

