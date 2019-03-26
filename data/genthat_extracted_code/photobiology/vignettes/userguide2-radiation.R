## ---- include=FALSE, echo=FALSE------------------------------------------
knitr::opts_chunk$set(fig.width=7.2, fig.height=4.3)

## ---- printing-spectra, eval=TRUE, include=FALSE-------------------------
# library(tibble)
options(tibble.print_max = 6, tibble.print_min = 4)

## ---- pkg-load, eval=TRUE------------------------------------------------
library(photobiology)
library(lubridate)
library(dplyr)

## ---- example-1, eval=FALSE----------------------------------------------
#  # not run
#  my.spct <- source_spct(w.length = wavelength/10, s.e.irrad = irrad/1000)

## ---- query-class-1------------------------------------------------------
is.any_spct(sun.spct)
is.generic_spct(sun.spct)
is.source_spct(sun.spct)

## ---- query-class-2------------------------------------------------------
class_spct(sun.spct)
class(sun.spct)

## ---- construction-1-----------------------------------------------------
my.df <- data.frame(w.length = 400:410, s.e.irrad = 1)
my.spct <- as.source_spct(my.df)
class(my.spct)
class(my.df)
my.spct

## ---- construction-2-----------------------------------------------------
my.g.spct <- as.generic_spct(my.spct)
class(my.g.spct)

## ---- construction-3-----------------------------------------------------
source_spct(w.length = 300:305, s.e.irrad = 1)

## ---- construction-4-----------------------------------------------------
z <- 300:305
y <- 2
source_spct(w.length = z, s.e.irrad = y)

## ---- construction-5-----------------------------------------------------
w.length <- 300:305
s.e.irrad <- 1
source_spct(w.length, s.e.irrad)

## ---- construction-6-----------------------------------------------------
my.d.spct <- as.source_spct(my.df, time.unit = "day")

## ---- construction-7-----------------------------------------------------
source_spct(w.length = 300:305, s.e.irrad = -1)
source_spct(w.length = 300:305, s.e.irrad = -1, strict.range = NULL)

## ---- construction-8-----------------------------------------------------
my.cm.spct <- source_spct(w.length = 300:305, s.e.irrad = 1,
                          comment = "This is a comment")
comment(my.cm.spct)

## ---- attr-1-------------------------------------------------------------
my.spct <- sun.spct
setWhenMeasured(my.spct, NULL)
getWhenMeasured(my.spct)
setWhenMeasured(my.spct, ymd_hms("2015-10-31 22:55:00", tz = "EET"))
getWhenMeasured(my.spct)

## ---- attr-2-------------------------------------------------------------
setWhereMeasured(my.spct, NULL)
getWhereMeasured(my.spct)
setWhereMeasured(my.spct, lat = 60, lon = -10)
getWhereMeasured(my.spct)
getWhereMeasured(my.spct)$lon
my.spct

## ---- attr-2a------------------------------------------------------------
setWhatMeasured(my.spct, "something")
getWhatMeasured(my.spct)
my.spct

## ---- attr-3-------------------------------------------------------------
is_effective(sun.spct)
is_effective(sun.spct * waveband(c(400, 700)))

## ---- attr-4-------------------------------------------------------------
ten.minutes.spct <-
  convertTimeUnit(sun.spct, time.unit = duration(10, "minutes"))
ten.minutes.spct
getTimeUnit(ten.minutes.spct)

## ---- col-construction-1-------------------------------------------------
two_suns.mspct <- source_mspct(list(sun1 = sun.spct, sun2 = sun.spct))
two_suns.mspct

## ---- col-construction-2-------------------------------------------------
mixed.mspct <- generic_mspct(list(filter = clear.spct, source = sun.spct))
class(mixed.mspct)
lapply(mixed.mspct, class_spct)

## ---- col-construction-3-------------------------------------------------
two_gen.mspct <- as.generic_mspct(two_suns.mspct)
class(two_gen.mspct)
str(two_gen.mspct, max.level = 1, give.attr = FALSE)

## ---- col-construction-4-------------------------------------------------
one_sun.mspct <- as.source_mspct(sun.spct)
class(one_sun.mspct)
str(one_sun.mspct, max.level = 1, give.attr = FALSE)

## ---- col-construction-5-------------------------------------------------
x <- matrix(1:100, ncol = 2)
wl <- 501:550 # wavelengths in nanometres
as.filter_mspct(x, wl, "Tpc")

## ---- col-construction-6-------------------------------------------------
as.filter_mspct(x, wl, "Tpc", spct.names = c("A", "B"))

## ---- col-construction-7-------------------------------------------------
xrow <- matrix(1:100, nrow = 2, byrow = TRUE)
as.filter_mspct(xrow, wl, "Tpc")

## ---- col-construction-8-------------------------------------------------
two_suns.mat <- as.matrix(two_suns.mspct, "s.e.irrad")
class(two_suns.mat)
dim(two_suns.mat)
head(dimnames(two_suns.mat)$spct)
head(dimnames(two_suns.mat)$w.length)
head(attr(two_suns.mat, "w.length"))

## ---- col-construction-9-------------------------------------------------
two_suns.row_mat <- as.matrix(two_suns.mat, "s.e.irrad", byrow = TRUE)
class(two_suns.row_mat)
dim(two_suns.row_mat)
head(dimnames(two_suns.row_mat)$spct)
head(attr(two_suns.row_mat, "w.length"))

## ---- bind-1-------------------------------------------------------------
two_suns.spct <- rbindspct(list(a = sun.spct, b = sun.spct / 2))
two_suns.spct

## ---- bind-1a------------------------------------------------------------
subset2mspct(two_suns.spct)

## ---- bind-2-------------------------------------------------------------
test1.df <- data.frame(w.length = rep(200:210, 2),
                       s.e.irrad = rep(c(1, 2), c(11, 11)),
                       spectrum = factor(rep(c("A", "B"), c(11,11))))
subset2mspct(test1.df, member.class = "source_spct", idx.var = "spectrum")

## ---- bind-3-------------------------------------------------------------
subset2mspct(test1.df, member.class = "source_spct", idx.var = "spectrum",
             time.unit = "day")

## ---- set-class-1--------------------------------------------------------
test2.df <- test1.df
setSourceSpct(test2.df, multiple.wl = 2L)
getMultipleWl(test2.df)

## ---- set-class-2--------------------------------------------------------
test3.df <- test1.df
setSourceSpct(test3.df, multiple.wl = NULL)
getMultipleWl(test3.df)

## ---- split-1------------------------------------------------------------
test2.df <- data.frame(w.length = 200:210, A = 1, B = 2, z = "A")
split2source_mspct(test2.df)
split2source_mspct(test2.df, spct.data.var = "s.q.irrad")

## ---- split-2------------------------------------------------------------
split2source_mspct(test2.df, spct.data.var = "s.q.irrad", time.unit = "day")

## ---- join-mspct-01------------------------------------------------------
my.mspct <- source_mspct(list(sun1 = sun.spct, sun2 = sun.spct * 2))
my.df <- join_mspct(my.mspct)
head(my.df)

## ---- col-query-class-1--------------------------------------------------
is.source_mspct(two_suns.mspct)
class(two_suns.mspct)

## ---- col-query-class-2--------------------------------------------------
is.filter_mspct(mixed.mspct)
is.any_mspct(mixed.mspct)
class(mixed.mspct)
lapply(mixed.mspct, class_spct)
lapply(mixed.mspct, class)

## ---- extract-1, eval=FALSE----------------------------------------------
#  # not run as this triggers an error when building the vignette with 'devtools'
#  two_suns.mspct[1]
#  two_suns.mspct[1:2]

## ---- extract-2, eval=FALSE----------------------------------------------
#  # not run as this triggers an error when building the vignette with 'devtools'
#  two_suns.mspct[1:2] <- two_suns.mspct[2:1]

## ---- extract-3----------------------------------------------------------
two_suns.mspct[[1]]
two_suns.mspct$sun1
two_suns.mspct[["sun1"]]

## ---- extract-4----------------------------------------------------------
two_suns.mspct[["sun1"]] <- sun.spct * 2
two_suns.mspct[["sun2"]] <- NULL
two_suns.mspct

## ---- extract-5----------------------------------------------------------
c(two_suns.mspct, mixed.mspct)

## ---- apply-1------------------------------------------------------------
two.mspct <- source_mspct(list(A = sun.spct * 1, B = sun.spct * 2))
msmsply(two.mspct, `+`, 0.1)

## ---- apply-2------------------------------------------------------------
msmsply(two.mspct, trim_wl, range = c(281, 500), fill = NA)

## ---- apply-3------------------------------------------------------------
msdply(two.mspct, max)

## ---- apply-4------------------------------------------------------------
ranges.df <- msdply(two.mspct, range)
ranges.df
cat(comment(ranges.df))

## ---- apply-5------------------------------------------------------------
msdply(two.mspct, range, na.rm = TRUE)

## ---- apply-6------------------------------------------------------------
str(mslply(two.mspct, names))

## ---- apply-7------------------------------------------------------------
str(msaply(two.mspct, max))

## ---- apply-8------------------------------------------------------------
str(msaply(two.mspct, range))

## ---- convolve-1---------------------------------------------------------
convolve_each(two.mspct, sun.spct)

## ---- convolve-2---------------------------------------------------------
convolve_each(sun.spct, two.mspct)

## ---- convolve-3---------------------------------------------------------
another_two.mspct <- two.mspct
names(another_two.mspct) <- c("a", "b")
convolve_each(another_two.mspct, two.mspct)

## ------------------------------------------------------------------------
convolve_each(two.mspct, sun.spct, oper = `+`)

## ---- col-attr-1---------------------------------------------------------
getWhenMeasured(two.mspct)
setWhenMeasured(two.mspct, ymd("2015-10-31", tz = "EET"))
getWhenMeasured(two.mspct)
setWhenMeasured(two.mspct,
                list(ymd_hm("2015-10-31 10:00", tz = "EET"),
                     ymd_hm("2015-10-31 11:00", tz = "EET")))
getWhenMeasured(two.mspct)
two.mspct

## ------------------------------------------------------------------------
when_measured2tb(two.mspct)

## ------------------------------------------------------------------------
when_measured2tb(two.mspct, col.names = c(when.measured = "time"))

## ------------------------------------------------------------------------
q_irrad(two.mspct) %>%
  add_attr2tb(two.mspct, 
              col.names = c("lon", "lat", "when.measured"))

## ------------------------------------------------------------------------
q_irrad(two.mspct) %>%
  add_attr2tb(two.mspct, 
              col.names = c(lon = "longitude", 
                            lat = "latitude", 
                            when.measured = "time"))

## ---- wb-1---------------------------------------------------------------
PAR.wb <- waveband(c(400, 700), wb.name = "PAR")
UVA.wb <- waveband(c(315, 400), wb.name = "UVA")
UVB.wb <- waveband(c(280, 315), wb.name = "UVB")
UVC.wb <- waveband(c(100, 280), wb.name = "UVC")
UV.wb  <- waveband(c(100, 400), wb.name =  "UV")
UV_bands.lst <- list(UVC.wb, UVB.wb, UVA.wb)

## ---- wb-2---------------------------------------------------------------
CIE_e_fun <-
function(w.length){
    CIE.energy <- numeric(length(w.length))
    CIE.energy[w.length <= 298] <- 1
    CIE.energy[(w.length > 298) & (w.length <= 328)] <-
      10^(0.094*(298-w.length[(w.length > 298) & (w.length <= 328)]))
    CIE.energy[(w.length > 328) & (w.length <= 400)] <-
      10^(0.015*(139-w.length[(w.length > 328) & (w.length <= 400)]))
    CIE.energy[w.length > 400] <- 0
    return(CIE.energy)
}

## ---- wb-3---------------------------------------------------------------
CIE.wb <- waveband(c(250, 400), weight = "SWF",
                   SWF.e.fun = CIE_e_fun, SWF.norm = 298)

## ---- wb-4---------------------------------------------------------------
waveband(sun.spct)

## ------------------------------------------------------------------------
waveband()

## ---- wb-5---------------------------------------------------------------
is.waveband(PAR.wb)

## ---- wb-6---------------------------------------------------------------
is_effective(waveband(c(400,500)))

## ---- wb-list-1----------------------------------------------------------
wavebands <- list(waveband(c(300,400)), waveband(c(400,500)))
wavebands

## ---- wb-split-1---------------------------------------------------------
split_bands(c(200, 225, 300))
split_bands(c(200, 225, 300), length.out = 2)

## ---- wb-split-2---------------------------------------------------------
split_bands(sun.spct, length.out = 2)
split_bands(PAR.wb, length.out = 2)
split_bands(c(200, 800), length.out = 3)

## ---- wb-split-3---------------------------------------------------------
split_bands(list(A = c(200, 300), B = c(400, 500), C = c(250, 350)))
split_bands(list(c(100, 150, 200), c(800, 825)))

## ---- wb-split-4---------------------------------------------------------
split_bands(UV_bands.lst, length.out  =  2)
split_bands(list(c(100, 150, 200), c(800, 825)), length.out = 1)

## ---- set-up-printing, eval=FALSE----------------------------------------
#  options(tibble.print_max = 4)
#  options(tibble.print_min = 4)

## ---- print-1, eval=FALSE------------------------------------------------
#  print(sun.spct, n = 3)

## ---- print-2, eval=FALSE------------------------------------------------
#  summary(sun.spct)

## ------------------------------------------------------------------------
na.omit(sun.spct)
na.exclude(sun.spct)

## ---- bin-oper-1---------------------------------------------------------
sun.spct * sun.spct

## ---- bin-oper-2---------------------------------------------------------
sun.spct * polyester.spct

## ---- bin-oper-3---------------------------------------------------------
sun.spct * polyester.spct * polyester.spct
sun.spct * polyester.spct^2

## ---- bin-oper-4---------------------------------------------------------
sun.spct * 2
2 * sun.spct
sun.spct * c(0,1)

## ---- bin-oper-5---------------------------------------------------------
sun.spct * UVB.wb

## ---- bin-oper-6, eval=FALSE---------------------------------------------
#  sun.spct * CIE.wb

## ---- unary-oper-1-------------------------------------------------------
-sun.spct
sqrt(sun.spct)

## ---- options-1----------------------------------------------------------
options(photobiology.radiation.unit = "photon")
sun.spct * UVB.wb
options(photobiology.radiation.unit = "energy")
sun.spct * UVB.wb

## ---- options-2----------------------------------------------------------
photon_as_default()
sun.spct * UVB.wb
energy_as_default()
sun.spct * UVB.wb

## ---- options-3----------------------------------------------------------
using_photon(sun.spct * UVB.wb)
using_energy(sun.spct * UVB.wb)

## ---- manip-1------------------------------------------------------------
# STOPGAP
shade.spct <- sun.spct

## ---- manip-2------------------------------------------------------------
rbindspct(list(sun.spct, shade.spct))
rbindspct(list(A = sun.spct, B = shade.spct), idfactor = "site")

## ---- manip-3------------------------------------------------------------
sun.spct[1:10, ]
sun.spct[1:10, 1]
sun.spct[1:10, 1, drop = TRUE]
sun.spct[1:10, "w.length", drop = TRUE]

## ---- manip-4------------------------------------------------------------
subset(sun.spct, s.e.irrad > 0.2)
subset(sun.spct, w.length > 600)
subset(sun.spct, c(TRUE, rep(FALSE, 99)))

## ---- manip-5------------------------------------------------------------
e2q(sun.spct, "add")
e2q(sun.spct, "replace")

## ---- manip-6------------------------------------------------------------
normalize(sun.spct)

## ---- manip-7------------------------------------------------------------
normalize(sun.spct, range = PAR.wb, norm = "max")

## ---- manip-8------------------------------------------------------------
normalize(sun.spct, norm = 600.3)

## ------------------------------------------------------------------------
my.spct <- normalize(sun.spct)
is_normalized(my.spct)
getNormalized(my.spct)

## ---- manip-9------------------------------------------------------------
fscale(sun.spct)
fscale(sun.spct, f = "total")
fscale(sun.spct, range = PAR.wb, f = irrad)
fscale(sun.spct, range = PAR.wb, f = q_irrad, target = 800e-6)

## ------------------------------------------------------------------------
my.spct <- fscale(sun.spct)
is_scaled(my.spct)
getScaled(my.spct)

## ---- manip-10-----------------------------------------------------------
fshift(sun.spct, range = UVB.wb, f = "mean")
fshift(sun.spct, range = c(280,290), f = "min")

## ---- manip-11-----------------------------------------------------------
clean(sun.spct - 0.01, range = c(280.5, 282))

## ---- manip-12-----------------------------------------------------------
clean(polyester.spct - 0.053)

## ---- manip-13-----------------------------------------------------------
interpolate_wl(sun.spct, seq(400, 500, by = 0.1))

## ---- trim-1-------------------------------------------------------------
clip_wl(sun.spct, range = c(400, 402))
clip_wl(sun.spct, range = c(400, NA))

## ---- trim-2-------------------------------------------------------------
clip_wl(sun.spct, range = UVA.wb)

## ---- trim-3-------------------------------------------------------------
clip_wl(sun.spct, range = c(100, 200))

## ---- trim-4-------------------------------------------------------------
trim_wl(sun.spct, c(282.5, NA))
clip_wl(sun.spct, c(282.5, NA))

## ---- trim-5-------------------------------------------------------------
trim_wl(sun.spct, PAR.wb)

## ---- trim-6-------------------------------------------------------------
trim_wl(sun.spct, c(281.5, NA), fill = NA)

## ---- trim-7-------------------------------------------------------------
trim_wl(sun.spct, c(275, NA), fill = 0)

## ---- trim-8-------------------------------------------------------------
trim_wl(sun.spct, c(281.5, NA), fill = NA)
trim_wl(sun.spct, c(281.5, NA), fill = NA, use.hinges = FALSE)

## ------------------------------------------------------------------------
trim2overlap(two.mspct)

## ------------------------------------------------------------------------
extend2extremes(two.mspct, fill = 0)

## ---- weights-1----------------------------------------------------------
sun.spct * CIE.wb

## ---- tag-1--------------------------------------------------------------
tag(sun.spct, PAR.wb)
tag(sun.spct, UV_bands.lst)

## ---- tag-2--------------------------------------------------------------
tg.sun.spct <- tag(sun.spct, PAR.wb)
attr(tg.sun.spct, "spct.tags")

## ---- tag-3--------------------------------------------------------------
wb2tagged_spct(UV_bands.lst)
wb2rect_spct(UV_bands.lst)

## ---- tag-4--------------------------------------------------------------
tg.sun.spct
is_tagged(tg.sun.spct)
untg.sun.spct <- untag(tg.sun.spct)
is_tagged(untg.sun.spct)

## ------------------------------------------------------------------------
is_tagged(untg.sun.spct)
untag(tg.sun.spct, byref = TRUE)
is_tagged(untg.sun.spct)


## ---- summary-1----------------------------------------------------------
summary(sun.spct)

## ---- summary-2----------------------------------------------------------
summary(two_suns.spct)

## ---- summary-3----------------------------------------------------------
wl_range(sun.spct)
wl_min(sun.spct)
wl_max(sun.spct)
wl_midpoint(sun.spct)
wl_expanse(sun.spct)
wl_stepsize(sun.spct)

## ---- summary-4----------------------------------------------------------
filters.mspct <- filter_mspct(list(none = clear.spct,
                                   pet = polyester.spct,
                                   yellow = yellow_gel.spct))
wl_range(filters.mspct)

## ---- summary-5----------------------------------------------------------
peaks(sun.spct, span = 51)
valleys(sun.spct, span = 51)

## ---- summary-6----------------------------------------------------------
peaks(sun.spct, span = 51, unit.out = "photon")

## ---- summary-7----------------------------------------------------------
peaks(sun.spct, span = 21)

## ---- col-summary-1------------------------------------------------------
msmsply(filters.mspct, peaks, span = 21)

## ---- find-wls-1---------------------------------------------------------
wls_at_target(sun.spct, target = "half.maximum")
wls_at_target(sun.spct, target = "half.maximum", interpolate = TRUE)

## ---- find-wls-2---------------------------------------------------------
wls_at_target(filters.mspct, target = "half.maximum")

## ---- irrad-1------------------------------------------------------------
irrad(sun.spct)

## ---- irrad-2------------------------------------------------------------
irrad(sun.spct, PAR.wb)

## ---- irrad-3------------------------------------------------------------
irrad(sun.spct, c(400, 700))

## ---- irrad-4------------------------------------------------------------
e_irrad(sun.spct, PAR.wb) # W m-2
q_irrad(sun.spct, PAR.wb, scale.factor = 1e6) # umol s-1 m-2

## ---- irrad-5------------------------------------------------------------
irrad(sun.spct, PAR.wb, time.unit = "hour")

## ---- irrad-6------------------------------------------------------------
irrad(sun.daily.spct, PAR.wb, time.unit = "second")

## ---- irrad-7------------------------------------------------------------
e_irrad(sun.spct, UV_bands.lst) # W m-2

## ---- irrad-8a-----------------------------------------------------------
irrad(sun.spct, UV_bands.lst, quantity = "total")

## ---- irrad-8b-----------------------------------------------------------
irrad(sun.spct, UV_bands.lst, quantity = "average")

## ---- irrad-8c-----------------------------------------------------------
irrad(sun.spct, UV_bands.lst, quantity = "contribution")
irrad(sun.spct, UV_bands.lst, quantity = "relative")

## ---- irrad-8d-----------------------------------------------------------
irrad(sun.spct, UV_bands.lst, quantity = "contribution.pc")
irrad(sun.spct, UV_bands.lst, quantity = "relative.pc")

## ------------------------------------------------------------------------
irrad(sun.spct, PAR.wb, time.unit = duration(8, "hours"))

## ------------------------------------------------------------------------
fluence(sun.spct, PAR.wb, exposure.time = duration(8, "hours"))

## ---- col-names-1--------------------------------------------------------
names(filters.mspct)

## ------------------------------------------------------------------------
two_suns.mspct <- source_mspct(list(sun1 = sun.spct, sun2 = sun.spct))
q_irrad(two_suns.mspct, 
        w.band = list(PAR = waveband(c(400,700))),
        scale.factor = 1e6, # umol m-2 s-1
        attr2tb = c(when.measured = "time", lon = "lon", lat = "lat"))

## ---- col-convolve-1-----------------------------------------------------
filtered_sun <- convolve_each(filters.mspct, sun.spct)
irrad(filtered_sun, list(UVA.wb, PAR.wb))

## ---- col-convolve-2-----------------------------------------------------
irrad(convolve_each(filters.mspct, sun.spct), 
      list(UVA.wb, PAR.wb))

## ---- col-convolve-3-----------------------------------------------------
filtered_sun <- msmsply(filters.mspct, `*`, sun.spct)
irrad(filtered_sun, list(UVA.wb, PAR.wb))

## ---- fluence-1----------------------------------------------------------
fluence(sun.spct, exposure.time = duration(1, "hours"))
fluence(sun.spct, exposure.time = 3600) # seconds

## ---- fluence-2----------------------------------------------------------
q_fluence(sun.spct, PAR.wb, exposure.time = duration(25, "minutes"))

## ------------------------------------------------------------------------
q_ratio(sun.spct, UVB.wb, PAR.wb)
q_ratio(sun.spct, list(UVC.wb, UVB.wb, UVA.wb, UV.wb))
q_ratio(sun.spct, UVB.wb, list(UV.wb, PAR.wb))

## ---- ratios-2-----------------------------------------------------------
qe_ratio(sun.spct, list(UVB.wb, PAR.wb))

## ---- ratios-3-----------------------------------------------------------
q_ratio(filtered_sun, list(UVB.wb, UVA.wb, PAR.wb))

## ------------------------------------------------------------------------
normalized_diff_ind(sun.spct,
                    waveband(c(400, 700)), waveband(c(700, 1100)),
                    irrad)

## ------------------------------------------------------------------------
transmittance(polyester.spct, list(UVB.wb, UVA.wb, PAR.wb))

## ------------------------------------------------------------------------
reflectance(green_leaf.spct, waveband(c(600, 700)))

## ------------------------------------------------------------------------
irrad(sun.spct * polyester.spct, list(UVB.wb, UVA.wb, PAR.wb, wb.trim = TRUE)) /
  irrad(sun.spct, list(UVB.wb, UVA.wb, PAR.wb, wb.trim = TRUE))

## ------------------------------------------------------------------------
transmittance(filters.mspct, w.band = list("Tfr(UVA)" = UVA.wb, "Tfr(PAR)" = PAR.wb))

## ------------------------------------------------------------------------
transmittance(filters.mspct,
              w.band = list(Tfr = waveband(c(350, 550))),
              attr2tb = "what.measured")

## ------------------------------------------------------------------------
transmittance(filters.mspct, 
              list("Tfr(UVA)" = UVA.wb, "Tfr(PAR)" = PAR.wb),
              attr2tb = "what.measured")

## ------------------------------------------------------------------------
response(photodiode.spct)

## ------------------------------------------------------------------------
e_response(photodiode.spct, list(UVB.wb, UVA.wb))

## ------------------------------------------------------------------------
sensors <- response_mspct(list(GaAsP = photodiode.spct,
                               CCD = ccd.spct))
response(sensors, list(UVB.wb, UVA.wb, PAR.wb), quantity = "contribution")

## ------------------------------------------------------------------------
integrate_spct(sun.spct)

## ------------------------------------------------------------------------
average_spct(sun.spct)

## ------------------------------------------------------------------------
w_length2rgb(550) # green
w_length2rgb(630) # red
w_length2rgb(c(550, 630, 380, 750)) # vectorized

## ------------------------------------------------------------------------
w_length_range2rgb(c(400,700))

## ------------------------------------------------------------------------
with(sun.spct, s_e_irrad2rgb(w.length, s.e.irrad))
with(sun.spct, s_e_irrad2rgb(w.length, s.e.irrad, sens = ciexyzCMF2.spct))

## ------------------------------------------------------------------------
rgb_spct(sun.spct)
rgb_spct(sun.spct, sens = ciexyzCMF2.spct)

## ------------------------------------------------------------------------
color_of(sun.spct)
color_of(sun.spct * yellow_gel.spct)

