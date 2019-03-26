## ----options, include=FALSE---------------------------------------------------
options(width = 80)
options(digits = 6)

## ----HTML, include=FALSE------------------------------------------------------
## some frequently used HTML expressions
logfO2 <- "log<i>f</i><sub>O<sub>2</sub></sub>"
# use lowercase here because these tend to be variable names in the examples
zc <- "<i>Z</i><sub>C</sub>"
o2 <- "O<sub>2</sub>"
h2o <- "H<sub>2</sub>O"

## ----setup, include=FALSE-----------------------------------------------------
library(knitr)

## from "Tufte Handout" example dated 2016-12-27
# invalidate cache when the tufte version changes
opts_chunk$set(tidy = FALSE, cache.extra = packageVersion('tufte'))
options(htmltools.dir.version = FALSE)

## adjust plot margins
## first one from https://yihui.name/knitr/hooks/
knit_hooks$set(small.mar = function(before, options, envir) {
    if (before) par(mar = c(4.2, 4.2, .1, .1))  # smaller margin on top and right
})
knit_hooks$set(tiny.mar = function(before, options, envir) {
    if (before) par(mar = c(.1, .1, .1, .1))  # tiny margin all around
})
knit_hooks$set(smallish.mar = function(before, options, envir) {
    if (before) par(mar = c(4.2, 4.2, 0.9, 0.9))  # smallish margins on top and right
})

## use pngquant to optimize PNG images
knit_hooks$set(pngquant = hook_pngquant)
# pngquant isn't available on R-Forge ...
if (!nzchar(Sys.which("pngquant"))) {
  pngquant <- NULL 
  # save space by using a lower resolution
  dpi <- 50
} else {
  pngquant <- "--speed=1 --quality=0-50"
  dpi <- 72
}

## http://stackoverflow.com/questions/23852753/knitr-with-gridsvg
## Set up a chunk hook for manually saved plots.
knit_hooks$set(custom.plot = hook_plot_custom)

## hook to change <img /> to <embed /> -- required for interactive SVG
hook_plot <- knit_hooks$get("plot")
knit_hooks$set(plot = function(x, options) {
  x <- hook_plot(x, options)
  if (!is.null(options$embed.tag) && options$embed.tag) x <- gsub("<img ", "<embed ", x)
  x
})

## http://stackoverflow.com/questions/30530008/hook-to-time-knitr-chunks
now = Sys.time()
knit_hooks$set(timeit = function(before) {
    if (before) { now <<- Sys.time() }
    else {
        paste("%", sprintf("Chunk rendering time: %s seconds.\n", round(Sys.time() - now, digits = 3))) 
    }
})
timeit <- NULL

## colorize messages 20171031
## adapted from https://gist.github.com/yihui/2629886#file-knitr-color-msg-rnw
color_block = function(color) {
  function(x, options) sprintf('<pre style="color:%s">%s</pre>', color, x)
}
knit_hooks$set(warning = color_block('magenta'), error = color_block('red'), message = color_block('blue'))

## ----install_CHNOSZ, eval=FALSE-----------------------------------------------
#  install.packages("CHNOSZ")

## ----library_CHNOSZ-----------------------------------------------------------
library(CHNOSZ)

## ----data_thermo--------------------------------------------------------------
data(thermo)

## ----pseudocode, eval=FALSE---------------------------------------------------
#  data(thermo)         ## initialize system settings
#  basis(...)
#  species(...)
#  a <- affinity(...)
#  e <- equilibrate(a)  ## optional
#  diagram(e)           ## or diagram(a)
#  data(thermo)         ## clear settings for next calculation

## ----info_adenine-------------------------------------------------------------
info("aden ")
info("adenine")
iadenine <- info("adenine")
info(iadenine)

## ----refs_adenine-------------------------------------------------------------
thermo.refs(iadenine)

## ----bsad_adenine, fig.margin=TRUE, fig.width=4, fig.height=4, small.mar=TRUE, dpi=dpi, out.width="100%", echo=FALSE, message=FALSE, results="hide", fig.cap="Nucleobase equal-activity diagram.", cache=TRUE, pngquant=pngquant, timeit=timeit----
basis("CHNOSe")
species(c("adenine", "cytosine", "guanine", "thymine", "uracil"))
a <- affinity(H2O = c(-12, -0), Eh = c(-0.5, 0), T = 100)
diagram(a)

## ----subcrt_adenine-----------------------------------------------------------
subcrt("adenine", T = 100)

## ----equil_adenine, fig.margin=TRUE, fig.width=4, fig.height=4, small.mar=TRUE, dpi=dpi, out.width="100%", echo=FALSE, message=FALSE, results="hide", fig.cap="Activities of nucleobases in metastable equilibrium.", cache=TRUE, pngquant=pngquant, timeit=timeit----
basis("e-", 3.6)
a <- affinity(H2O = c(-12, 0), T = 100)
e <- equilibrate(a)
diagram(e, ylim = c(-8, 0))

## ----bsad_adenine, eval=FALSE-------------------------------------------------
#  basis("CHNOSe")
#  species(c("adenine", "cytosine", "guanine", "thymine", "uracil"))
#  a <- affinity(H2O = c(-12, -0), Eh = c(-0.5, 0), T = 100)
#  diagram(a)

## ----equil_adenine, eval=FALSE------------------------------------------------
#  basis("e-", 3.6)
#  a <- affinity(H2O = c(-12, 0), T = 100)
#  e <- equilibrate(a)
#  diagram(e, ylim = c(-8, 0))

## ----info_methane-------------------------------------------------------------
info("methane")

## ----info_methane_gas---------------------------------------------------------
info("methane", "gas")

## ----info_methane_test, echo=FALSE, results="hide"----------------------------
# this prevents the vignette from compiling in case
# database updates cause the species index of methane to change
stopifnot(info("methane")==859)
# it is up to the editor of this vignette to ensure that number
# is used in the hard-coded examples below!

## ----info_859, message=FALSE--------------------------------------------------
info(859)

## ----info_info_water----------------------------------------------------------
info(info("water"))

## ----width180, include=FALSE------------------------------------------------------------------------------------------------------------------------------------------------------
options(width = 180)

## ----info_acid--------------------------------------------------------------------------------------------------------------------------------------------------------------------
info("acid")

## ----width80, include=FALSE---------------------------------------------------
options(width = 80)

## ----info_ribose--------------------------------------------------------------
info(" ribose")

## ----info_859_formula, message=FALSE------------------------------------------
info(859)$formula

## ----makeup_859---------------------------------------------------------------
makeup(859)
as.chemical.formula(makeup(859))

## ----ZC_859, message=FALSE----------------------------------------------------
ZC(859)
ZC(info(859)$formula)
ZC(makeup(859))

## ----subcrt_water-------------------------------------------------------------
subcrt("water")

## ----subcrt_water_grid--------------------------------------------------------
subcrt("water", T = c(400, 500, 600), P = c(200, 400, 600), grid = "P")$out$water

## ----subcrt_water_plot, fig.margin=TRUE, fig.width=4, fig.height=4, small.mar=TRUE, dpi=dpi, out.width="100%", echo=FALSE, message=FALSE, fig.cap="Isothermal contours of density (g cm<sup>-3</sup>) and pressure (bar) of water.", cache=TRUE, pngquant=pngquant, timeit=timeit----
substuff <- subcrt("water", T=seq(0,1000,100), P=c(NA, seq(1,500,1)), grid="T")
water <- substuff$out$water
plot(water$P, water$rho, type = "l")

## ----subcrt_water_plot, eval=FALSE--------------------------------------------
#  substuff <- subcrt("water", T=seq(0,1000,100), P=c(NA, seq(1,500,1)), grid="T")
#  water <- substuff$out$water
#  plot(water$P, water$rho, type = "l")

## ----units_methane, message=FALSE---------------------------------------------
T.units("K")
P.units("MPa")
E.units("J")
subcrt("methane", T = 298.15, P = 0.1)$out$methane$G

## ----convert_G, message=FALSE-------------------------------------------------
convert(info(info("methane"))$G, "J")

## ----data_thermo--------------------------------------------------------------
data(thermo)

## ----subcrt_CO2---------------------------------------------------------------
subcrt(c("CO2", "CO2"), c("gas", "aq"), c(-1, 1), T = seq(0, 250, 50))

## ----CO2_logK, echo=FALSE, message=FALSE--------------------------------------
T <- seq(0, 350, 10)
CO2 <- subcrt(c("CO2", "CO2"), c("gas", "aq"), c(-1, 1), T = T)$out$logK
CO <- subcrt(c("CO", "CO"), c("gas", "aq"), c(-1, 1), T = T)$out$logK
CH4 <- subcrt(c("CH4", "CH4"), c("gas", "aq"), c(-1, 1), T = T)$out$logK
logK <- data.frame(T, CO2, CO, CH4)

## ----CO2_plot, fig.margin=TRUE, fig.width=4, fig.height=4, small.mar=TRUE, dpi=dpi, out.width="100%", echo=FALSE, message=FALSE, fig.cap="Calculated equilibrium constants for dissolution of CO<sub>2</sub>, CO, and CH<sub>4</sub>.", cache=TRUE, pngquant=pngquant, timeit=timeit----
matplot(logK[, 1], logK[, -1], type = "l", col = 1, lty = 1,
        xlab = axis.label("T"), ylab = axis.label("logK"))
text(80, -1.7, expr.species("CO2"))
text(240, -2.37, expr.species("CO"))
text(300, -2.57, expr.species("CH4"))

## ----CO2_logK, eval=FALSE-----------------------------------------------------
#  T <- seq(0, 350, 10)
#  CO2 <- subcrt(c("CO2", "CO2"), c("gas", "aq"), c(-1, 1), T = T)$out$logK
#  CO <- subcrt(c("CO", "CO"), c("gas", "aq"), c(-1, 1), T = T)$out$logK
#  CH4 <- subcrt(c("CH4", "CH4"), c("gas", "aq"), c(-1, 1), T = T)$out$logK
#  logK <- data.frame(T, CO2, CO, CH4)

## ----CO2_plot, eval=FALSE-----------------------------------------------------
#  matplot(logK[, 1], logK[, -1], type = "l", col = 1, lty = 1,
#          xlab = axis.label("T"), ylab = axis.label("logK"))
#  text(80, -1.7, expr.species("CO2"))
#  text(240, -2.37, expr.species("CO"))
#  text(300, -2.57, expr.species("CH4"))

## ----subcrt_unbalanced, results="hide"----------------------------------------
subcrt(c("CO2", "CH4"), c(-1, 1))

## ----basis_singular, error=TRUE-----------------------------------------------
basis(c("CO2", "H2", "H2CO2"))

## ----basis_CHO----------------------------------------------------------------
basis(c("CO2", "H2", "H2O"))

## ----basis_CHOZ---------------------------------------------------------------
basis(c("CO2", "H2", "H2O", "H+"))

## ----subcrt_acetoclastic, message=FALSE---------------------------------------
subcrt(c("acetate", "methane"), c(-1, 1))$reaction

## ----subcrt_methanogenesis, message=FALSE-------------------------------------
acetate_oxidation <- subcrt("acetate", -1)
hydrogenotrophic <- subcrt("methane", 1)
acetoclastic <- subcrt(c("acetate", "methane"), c(-1, 1))

## ----describe_reaction_plot, fig.margin=TRUE, fig.width=3.5, fig.height=1.8, tiny.mar=TRUE, dpi=dpi, out.width="100%", pngquant=pngquant, timeit=timeit----
plot(0, 0, type = "n", axes = FALSE, ann=FALSE, xlim=c(0, 5), ylim=c(5.2, -0.2))
text(0, 0, "acetoclastic methanogenesis", adj = 0)
text(5, 1, describe.reaction(acetoclastic$reaction), adj = 1)
text(0, 2, "acetate oxidation", adj = 0)
text(5, 3, describe.reaction(acetate_oxidation$reaction), adj = 1)
text(0, 4, "hydrogenotrophic methanogenesis", adj = 0)
text(5, 5, describe.reaction(hydrogenotrophic$reaction), adj = 1)

## ----basis_mayumi, message=FALSE, results="hide"------------------------------
E.units("J")
basis(c("CO2", "H2", "H2O", "H+"))
basis(c("CO2", "H2"), "gas")
basis(c("H2", "pH"), c(-3.92, 7.3))

## ----affinity_acetoclastic, message=FALSE-------------------------------------
subcrt(c("acetate", "methane"), c(-1, 1),
       c("aq", "gas"), logact = c(-3.4, -0.18), T = 55, P = 50)$out

## ----affinity_hydrogenotrophic, message=FALSE---------------------------------
subcrt("methane", 1, "gas", logact = -0.18, T = 55, P = 50)$out

## ----rxnfun, message=FALSE----------------------------------------------------
rxnfun <- function(coeffs) {
  subcrt(c("acetate", "methane"), coeffs,
         c("aq", "gas"), logact = c(-3.4, -0.18), T = 55, P = 50)$out
}

## ----methanogenesis_plot, fig.margin=TRUE, fig.width=4.1, fig.height=4.1, small.mar=TRUE, dpi=dpi, out.width="100%", echo=FALSE, message=FALSE, fig.cap="Gibbs energies of acetate oxidation and methanogenesis (after Mayumi et al., 2013).", cache=TRUE, pngquant=pngquant, timeit=timeit----
Adat <- lapply(c(-3, 3), function(logfCO2) {
  basis("CO2", logfCO2)
  data.frame(logfCO2,
    rxnfun(c(0, 0))$A,
    rxnfun(c(-1, 0))$A,
    rxnfun(c(-1, 1))$A,
    rxnfun(c(0, 1))$A
  )
})
Adat <- do.call(rbind, Adat)
matplot(Adat[, 1], -Adat[, -1]/1000, type = "l", lty = 1, lwd = 2,
  xlab = axis.label("CO2"), ylab = axis.label("DG", prefix = "k"))
legend("topleft", c("acetate oxidation", "acetoclastic methanogenesis",
  "hydrogenotrophic methanogenesis"), lty = 1, col = 2:4)

## ----methanogenesis_plot, eval=FALSE------------------------------------------
#  Adat <- lapply(c(-3, 3), function(logfCO2) {
#    basis("CO2", logfCO2)
#    data.frame(logfCO2,
#      rxnfun(c(0, 0))$A,
#      rxnfun(c(-1, 0))$A,
#      rxnfun(c(-1, 1))$A,
#      rxnfun(c(0, 1))$A
#    )
#  })
#  Adat <- do.call(rbind, Adat)
#  matplot(Adat[, 1], -Adat[, -1]/1000, type = "l", lty = 1, lwd = 2,
#    xlab = axis.label("CO2"), ylab = axis.label("DG", prefix = "k"))
#  legend("topleft", c("acetate oxidation", "acetoclastic methanogenesis",
#    "hydrogenotrophic methanogenesis"), lty = 1, col = 2:4)

## ----data_thermo, message=FALSE-----------------------------------------------
data(thermo)

## ----basis_CHNOSZ, results="hide"---------------------------------------------
basis("CHNOS+")

## ----species_sulfur-----------------------------------------------------------
species(c("H2S", "HS-", "HSO4-", "SO4-2"))

## ----affinity-----------------------------------------------------------------
unlist(affinity()$values)

## ----swap_basis---------------------------------------------------------------
swap.basis("O2", "e-")

## ----EhpH_plot, fig.margin=TRUE, fig.width=4, fig.height=4, small.mar=TRUE, dpi=dpi, out.width="100%", echo=FALSE, message=FALSE, cache=TRUE, fig.cap="Aqueous sulfur species at 25 °C.", pngquant=pngquant, timeit=timeit----
a <- affinity(pH = c(0, 12), Eh = c(-0.5, 1))
diagram(a, fill = "heat")
water.lines(a)

## ----EhpH_plot, echo=1, eval=FALSE--------------------------------------------
#  a <- affinity(pH = c(0, 12), Eh = c(-0.5, 1))
#  diagram(a, fill = "heat")
#  water.lines(a)

## ----EhpH_plot, echo=-1, eval=FALSE-------------------------------------------
#  a <- affinity(pH = c(0, 12), Eh = c(-0.5, 1))
#  diagram(a, fill = "heat")
#  water.lines(a)

## ----EhpH_plot_color, fig.margin=TRUE, fig.width=4, fig.height=4, smallish.mar=TRUE, dpi=dpi, out.width="100%", echo=FALSE, message=FALSE, cache=TRUE, fig.cap="The same plot, with different colors and labels.", pngquant=pngquant, timeit=timeit----
diagram(a, fill = "terrain", lwd = 3, lty = 3,
        names = c("hydrogen sulfide", "bisulfide", "bisulfate", "sulfate"),
        tplot = FALSE, main = "sulfur species, 25 °C", bty = "n")

## ----EhpH_plot_color, echo=TRUE, eval=FALSE-----------------------------------
#  diagram(a, fill = "terrain", lwd = 3, lty = 3,
#          names = c("hydrogen sulfide", "bisulfide", "bisulfate", "sulfate"),
#          tplot = FALSE, main = "sulfur species, 25 °C", bty = "n")

## ----info_CuCl, results="hide"------------------------------------------------
info(" CuCl")

## ----info_chalcocite, message=FALSE-------------------------------------------
info(info("chalcocite", c("cr", "cr2", "cr3")))$T

## ----copper_setup, echo=TRUE, results="hide"----------------------------------
basis(c("Cu", "H2S", "Cl-", "H2O", "H+", "e-"))
basis("H2S", -6)
basis("Cl-", -0.7)
species(c("copper", "tenorite"))
species("chalcocite", "cr2")
species(c("CuCl", "CuCl2-", "CuCl3-2", "CuCl+", "CuCl2", "CuCl3-", "CuCl4-2"))

## ----copper_mosaic, fig.margin=TRUE, fig.width=4, fig.height=4, small.mar=TRUE, dpi=dpi, out.width="100%", message=FALSE, cache=TRUE, fig.cap="Copper minerals and aqueous complexes with chloride, 200 °C.", pngquant=pngquant, timeit=timeit----
T <- 200
res <- 200
bases <- c("H2S", "HS-", "HSO4-", "SO4-2")
m1 <- mosaic(bases, blend = TRUE, pH = c(0, 12, res), Eh=c(-1.2, 0.75, res), T=T)
diagram(m1$A.species, lwd = 2, fill = NA, limit.water = FALSE)
diagram(m1$A.bases, add = TRUE, col = "blue", col.names = "blue", lty = 2,
        limit.water = FALSE)
water.lines(m1$A.species, col = "red", lwd = 2, lty = 3)

## ----mosaicfun, fig.fullwidth=TRUE, fig.width=9, fig.height=3, small.mar=TRUE, dpi=dpi, out.width="85%", message=FALSE, results="hide", cache=TRUE, fig.cap="The same chemical system projected into different sets of basis species.", pngquant=pngquant, timeit=timeit----
mosaicfun <- function(newvar, T = 200) {
  swap.basis("e-", names(newvar))
  if (names(newvar) == "O2") basis("O2", "gas")
  mosaicargs <- c(list(bases), blend=TRUE, pH=list(c(-2, 12, res)), newvar, T=T)
  m1 <- do.call(mosaic, mosaicargs)
  diagram(m1$A.species, lwd = 2, fill = rev(topo.colors(10)),
          limit.water = FALSE)
  diagram(m1$A.bases, add = TRUE, col = "blue", col.names = "blue", lty = 3,
          limit.water = FALSE)
  water.lines(m1$A.species, col = "red", lwd = 2, lty = 3)
  swap.basis(names(newvar), "e-")
}
par(mfrow = c(1, 3))
mosaicfun(list(Eh = c(-1, 1, res)))
mosaicfun(list(H2 = c(-30, 10, res)))
mosaicfun(list(O2 = c(-70, 5, res)))

## ----rainbow_data-------------------------------------------------------------
file <- system.file("extdata/cpetc/SC10_Rainbow.csv", package = "CHNOSZ")
rb <- read.csv(file, check.names = FALSE)

## ----rainbow_species, results="hide"------------------------------------------
basis(c("CO2", "H2", "NH4+", "H2O", "H2S", "H+"))
species("CH4", -3)
species(c("adenine", "cytosine", "aspartic acid", "deoxyribose",
          "methane", "leucine", "tryptophan", "n-nonanoic acid"), -6)

## ----rainbow_affinity, message=FALSE------------------------------------------
a <- affinity(T = rb$T, CO2 = rb$CO2, H2 = rb$H2,
              `NH4+` = rb$`NH4+`, H2S = rb$H2S, pH = rb$pH)
T <- convert(a$vals[[1]], "K")
a$values <- lapply(a$values, convert, "G", T)
a$values <- lapply(a$values, `*`, -0.001)

## ----rainbow_diagram, fig.margin=TRUE, fig.width=4, fig.height=4, small.mar=TRUE, dpi=dpi, out.width="100%", echo=FALSE, message=FALSE, cache=TRUE, fig.cap="Affinities of organic synthesis in a hydrothermal system, after Shock and Canovas (2010).", pngquant=pngquant, timeit=timeit----
diagram(a, balance = 1, ylim = c(-100, 100), ylab = axis.label("A", prefix="k"),
        col = rainbow(8), lwd = 2, bg = "slategray3")
abline(h = 0, lty = 2, lwd = 2)

## ----rainbow_diagram, eval=FALSE----------------------------------------------
#  diagram(a, balance = 1, ylim = c(-100, 100), ylab = axis.label("A", prefix="k"),
#          col = rainbow(8), lwd = 2, bg = "slategray3")
#  abline(h = 0, lty = 2, lwd = 2)

## ----PPM_basis, results="hide", message=FALSE---------------------------------
basis(c("FeS2", "H2S", "O2", "H2O"))
species(c("pyrite", "magnetite"))
species("pyrrhotite", "cr2")

## ----PPM_affinity, message=FALSE, echo=1--------------------------------------
unlist(affinity(T = 300, P = 100)$values)
## 2031 1999 2036 
##    0    0    0

## ----PPM_setup, results="hide"------------------------------------------------
mod.buffer("PPM", "pyrrhotite", "cr2")
basis(c("H2S", "O2"), c("PPM", "PPM"))

## ----PPM_activities, message=FALSE--------------------------------------------
unlist(affinity(T = 300, P = 100, return.buffer = TRUE)[1:3])

## ----demo_buffer_noecho, fig.margin=TRUE, fig.width=4, fig.height=4, small.mar=TRUE, dpi=dpi, out.width="100%", message=FALSE, echo=FALSE, cache=TRUE, fig.cap="Values of log<i>f</i><sub>H<sub>2</sub></sub> corresponding to mineral buffers or to given activities of aqueous species.", pngquant=pngquant, timeit=timeit----
demo(buffer, echo = FALSE)

## ----PPM_affinity, eval=FALSE-------------------------------------------------
#  unlist(affinity(T = 300, P = 100)$values)
#  ## 2031 1999 2036
#  ##    0    0    0

## ----demo_buffer, eval=FALSE--------------------------------------------------
#  demo(buffer)

## ----bjerrum_diagram, fig.margin=TRUE, fig.width=3, fig.height=6, small.mar=TRUE, dpi=dpi, out.width="100%", echo=FALSE, results="hide", message=FALSE, cache=TRUE, fig.cap="Three views of carbonate speciation: affinity, activity, degree of formation.", pngquant=pngquant, timeit=timeit----
par(mfrow = c(3, 1))
basis("CHNOS+")
species(c("CO2", "HCO3-", "CO3-2"))
a25 <- affinity(pH = c(4, 13))
a150 <- affinity(pH = c(4, 13), T = 150)
diagram(a25, dy = 0.4)
diagram(a150, add = TRUE, col = "red")
e25 <- equilibrate(a25, loga.balance = -3)
e150 <- equilibrate(a150, loga.balance = -3)
diagram(e25, ylim = c(-6, 0), dy = 0.15)
diagram(e150, add = TRUE, col = "red")
diagram(e25, alpha = TRUE, dy = -0.25)
diagram(e150, alpha = TRUE, add = TRUE, col = "red")

## ----bjerrum_diagram, echo=1:7, eval=FALSE------------------------------------
#  par(mfrow = c(3, 1))
#  basis("CHNOS+")
#  species(c("CO2", "HCO3-", "CO3-2"))
#  a25 <- affinity(pH = c(4, 13))
#  a150 <- affinity(pH = c(4, 13), T = 150)
#  diagram(a25, dy = 0.4)
#  diagram(a150, add = TRUE, col = "red")
#  e25 <- equilibrate(a25, loga.balance = -3)
#  e150 <- equilibrate(a150, loga.balance = -3)
#  diagram(e25, ylim = c(-6, 0), dy = 0.15)
#  diagram(e150, add = TRUE, col = "red")
#  diagram(e25, alpha = TRUE, dy = -0.25)
#  diagram(e150, alpha = TRUE, add = TRUE, col = "red")

## ----bjerrum_diagram, echo=8:11, eval=FALSE-----------------------------------
#  par(mfrow = c(3, 1))
#  basis("CHNOS+")
#  species(c("CO2", "HCO3-", "CO3-2"))
#  a25 <- affinity(pH = c(4, 13))
#  a150 <- affinity(pH = c(4, 13), T = 150)
#  diagram(a25, dy = 0.4)
#  diagram(a150, add = TRUE, col = "red")
#  e25 <- equilibrate(a25, loga.balance = -3)
#  e150 <- equilibrate(a150, loga.balance = -3)
#  diagram(e25, ylim = c(-6, 0), dy = 0.15)
#  diagram(e150, add = TRUE, col = "red")
#  diagram(e25, alpha = TRUE, dy = -0.25)
#  diagram(e150, alpha = TRUE, add = TRUE, col = "red")

## ----bjerrum_diagram, echo=12:13, eval=FALSE----------------------------------
#  par(mfrow = c(3, 1))
#  basis("CHNOS+")
#  species(c("CO2", "HCO3-", "CO3-2"))
#  a25 <- affinity(pH = c(4, 13))
#  a150 <- affinity(pH = c(4, 13), T = 150)
#  diagram(a25, dy = 0.4)
#  diagram(a150, add = TRUE, col = "red")
#  e25 <- equilibrate(a25, loga.balance = -3)
#  e150 <- equilibrate(a150, loga.balance = -3)
#  diagram(e25, ylim = c(-6, 0), dy = 0.15)
#  diagram(e150, add = TRUE, col = "red")
#  diagram(e25, alpha = TRUE, dy = -0.25)
#  diagram(e150, alpha = TRUE, add = TRUE, col = "red")

## ----groups_basis, results="hide", message=FALSE------------------------------
basis("CHNOS+")
ii <- species(c("CO2", "HCO3-"), index.return = TRUE)

## ----groups_species, message=FALSE--------------------------------------------
seq2 <- function(x) seq(x[1], x[2])
ia <- species(seq2(info(c("methanol", "octanol"))), index.return = TRUE)
ik <- species(seq2(info(c("acetone", "2-octanone"))), index.return = TRUE)
ic <- species(seq2(info(c("acetic acid","n-dodecanoic acid"))),index.return=TRUE)
ica <- species(seq2(info(c("acetate", "n-dodecanoate"))), index.return = TRUE)
ie <- species(seq2(info(c("ethylene", "octene"))), index.return = TRUE)

## ----groups_data--------------------------------------------------------------
O2dat <- read.csv(system.file(
  "extdata/cpetc/SS98_Fig5a.csv", package = "CHNOSZ"))
pHdat <- read.csv(system.file(
  "extdata/cpetc/SS98_Fig5b.csv", package = "CHNOSZ"))
T <- seq(8, 350)
O2 <- predict(smooth.spline(O2dat$T, O2dat$logfO2), T)$y
pH <- predict(smooth.spline(pHdat$T, pHdat$pH), T)$y

## ----groups_affinity, message=FALSE, cache=TRUE-------------------------------
a <- affinity(T = T, O2 = O2, pH = pH)
e <- equilibrate(a, loga.balance = -2.5)

## ----groups_diagram, echo=1:4, eval=FALSE-------------------------------------
#  par(mfrow = c(1, 3))
#  groups <- list(inorganic = ii, alcohols = ia, ketones = ik,
#                 `carboxylic acids` = c(ic, ica), alkenes = ie)
#  diagram(e, alpha = TRUE, groups = groups, col = 1:5)
#  # plot only alcohols
#  names <- within(species(), name[-ia] <- "")$name
#  lty <- ifelse(names == "", 0, 1)
#  diagram(e, alpha = TRUE, ylim = c(0, 0.32), lty = lty, names = names)
#  # plot only ketones
#  names <- within(species(), name[-ik] <- "")$name
#  lty <- ifelse(names == "", 0, 1)
#  diagram(e, alpha = TRUE, ylim = c(0, 0.16), lty = lty, names = names)

## ----groups_diagram, echo=-(1:4), eval=FALSE----------------------------------
#  par(mfrow = c(1, 3))
#  groups <- list(inorganic = ii, alcohols = ia, ketones = ik,
#                 `carboxylic acids` = c(ic, ica), alkenes = ie)
#  diagram(e, alpha = TRUE, groups = groups, col = 1:5)
#  # plot only alcohols
#  names <- within(species(), name[-ia] <- "")$name
#  lty <- ifelse(names == "", 0, 1)
#  diagram(e, alpha = TRUE, ylim = c(0, 0.32), lty = lty, names = names)
#  # plot only ketones
#  names <- within(species(), name[-ik] <- "")$name
#  lty <- ifelse(names == "", 0, 1)
#  diagram(e, alpha = TRUE, ylim = c(0, 0.16), lty = lty, names = names)

## ----groups_diagram, fig.fullwidth=TRUE, fig.width=9, fig.height=3, small.mar=TRUE, dpi=dpi, out.width="85%", echo=FALSE, message=FALSE, results="hide", cache=TRUE, fig.cap="Distribution of inorganic and groups of organic species (left plot) and of alcohols and ketones (middle and right plots) as a function of <i>T</i>, pH, and log<i>f</i><sub>O<sub>2</sub></sub>.", pngquant=pngquant, timeit=timeit----
par(mfrow = c(1, 3))
groups <- list(inorganic = ii, alcohols = ia, ketones = ik,
               `carboxylic acids` = c(ic, ica), alkenes = ie)
diagram(e, alpha = TRUE, groups = groups, col = 1:5)
# plot only alcohols
names <- within(species(), name[-ia] <- "")$name
lty <- ifelse(names == "", 0, 1)
diagram(e, alpha = TRUE, ylim = c(0, 0.32), lty = lty, names = names)
# plot only ketones
names <- within(species(), name[-ik] <- "")$name
lty <- ifelse(names == "", 0, 1)
diagram(e, alpha = TRUE, ylim = c(0, 0.16), lty = lty, names = names)

## ----aminoacids_setup, results="hide", message=FALSE--------------------------
basis("CHNOS")
basis("CO2", "gas")
swap.basis("NH3", "N2")
species(aminoacids(""))
a <- affinity(O2 = c(-50, -25, 200), CO2 = c(-10, 15, 200), T = 250, P = 265)
aa.ZC <- ZC(info(aminoacids("")))
col <- ZC.col(aa.ZC)

## ----aafun, fig.fullwidth=TRUE, fig.width=12.5, fig.height=2.5, small.mar=TRUE, dpi=dpi, out.width="100%", message=FALSE, results="hide", fig.cap="Plots of maximum affinity at 250 °C and 265 bar using different reaction balances for 20 amino acids.", cache=TRUE, pngquant=pngquant, timeit=timeit----
aafun <- function(balance) {
  diagram(a, balance = balance, fill = col)
  blab <- expr.species(balance)
  title(main = substitute("balanced on" ~ b, list(b = blab)))
}
par(mfrow = c(1, 5))
lapply(c("1", "CO2", "H2O", "N2", "volume"), aafun)

## ----Alberty------------------------------------------------------------------
oldnon <- nonideal("Alberty")

## ----subcrt_IS----------------------------------------------------------------
subcrt(c("MgATP-2", "MgHATP-", "MgH2ATP"),
       T = c(25, 100), IS = c(0, 0.25), property = "G")$out

## ----info_ATP, results="hide"-------------------------------------------------
info(" ATP")

## ----T_100--------------------------------------------------------------------
T <- 100

## ----ATP, eval=FALSE, echo=2:6------------------------------------------------
#  par(mfrow = c(1, 4), mar = c(3.1, 3.6, 2.1, 1.6), mgp = c(1.8, 0.5, 0))
#  basis("MgCHNOPS+")
#  species(c("ATP-4", "HATP-3", "H2ATP-2", "H3ATP-", "H4ATP"))
#  a <- affinity(pH = c(3, 9), T = T)
#  e <- equilibrate(a)
#  d <- diagram(e, alpha = TRUE, tplot = FALSE)
#  title(main = describe.property("T", T))
#  alphas <- do.call(rbind, d$plotvals)
#  nH <- alphas * 0:4
#  Hlab <- substitute(italic(N)[H^`+`])
#  plot(a$vals[[1]], colSums(nH), type = "l", xlab = "pH", ylab=Hlab, lty=2, col=2)
#  a <- affinity(pH = c(3, 9), IS = 0.25, T = T)
#  e <- equilibrate(a)
#  d <- diagram(e, alpha = TRUE, plot.it = FALSE)
#  alphas <- do.call(rbind, d$plotvals)
#  nH <- alphas * 0:4
#  lines(a$vals[[1]], colSums(nH))
#  legend("topright", legend = c("I = 0 M", "I = 0.25 M"), lty = 2:1, col = 2:1, cex = 0.8)
#  ATP.H <- substitute("ATP and H"^`+`)
#  title(main = ATP.H)
#  species(c("MgATP-2", "MgHATP-", "MgH2ATP", "Mg2ATP"))
#  Hplot <- function(pMg, IS = 0.25) {
#    basis("Mg+2", -pMg)
#    a <- affinity(pH = c(3, 9), IS = IS, T = T)
#    e <- equilibrate(a)
#    d <- diagram(e, alpha = TRUE, plot.it = FALSE)
#    alphas <- do.call(rbind, d$plotvals)
#    NH <- alphas * c(0:4, 0, 1, 2, 0)
#    lines(a$vals[[1]], colSums(NH), lty = 7 - pMg, col = 7 - pMg)
#  }
#  plot(c(3, 9), c(0, 2), type = "n", xlab = "pH", ylab = Hlab)
#  lapply(2:6, Hplot)
#  legend("topright", legend = paste("pMg = ", 2:6), lty = 5:1, col = 5:1, cex = 0.8)
#  ATP.H.Mg <- substitute("ATP and H"^`+`~"and Mg"^`+2`)
#  title(main = ATP.H.Mg)
#  Mgplot <- function(pH, IS = 0.25) {
#    basis("pH", pH)
#    a <- affinity(`Mg+2` = c(-2, -7), IS = IS, T = T)
#    e <- equilibrate(a)
#    d <- diagram(e, alpha = TRUE, plot.it = FALSE)
#    alphas <- do.call(rbind, d$plotvals)
#    NMg <- alphas * species()$`Mg+`
#    lines(-a$vals[[1]], colSums(NMg), lty = 10 - pH, col = 10 - pH)
#  }
#  Mglab <- substitute(italic(N)[Mg^`+2`])
#  plot(c(2, 7), c(0, 1.2), type = "n", xlab = "pMg", ylab = Mglab)
#  lapply(3:9, Mgplot)
#  legend("topright", legend = paste("pH = ", 3:9), lty = 7:1, col = 7:1, cex = 0.8)
#  title(main = ATP.H.Mg)

## ----ATP, eval=FALSE, echo=8:11-----------------------------------------------
#  par(mfrow = c(1, 4), mar = c(3.1, 3.6, 2.1, 1.6), mgp = c(1.8, 0.5, 0))
#  basis("MgCHNOPS+")
#  species(c("ATP-4", "HATP-3", "H2ATP-2", "H3ATP-", "H4ATP"))
#  a <- affinity(pH = c(3, 9), T = T)
#  e <- equilibrate(a)
#  d <- diagram(e, alpha = TRUE, tplot = FALSE)
#  title(main = describe.property("T", T))
#  alphas <- do.call(rbind, d$plotvals)
#  nH <- alphas * 0:4
#  Hlab <- substitute(italic(N)[H^`+`])
#  plot(a$vals[[1]], colSums(nH), type = "l", xlab = "pH", ylab=Hlab, lty=2, col=2)
#  a <- affinity(pH = c(3, 9), IS = 0.25, T = T)
#  e <- equilibrate(a)
#  d <- diagram(e, alpha = TRUE, plot.it = FALSE)
#  alphas <- do.call(rbind, d$plotvals)
#  nH <- alphas * 0:4
#  lines(a$vals[[1]], colSums(nH))
#  legend("topright", legend = c("I = 0 M", "I = 0.25 M"), lty = 2:1, col = 2:1, cex = 0.8)
#  ATP.H <- substitute("ATP and H"^`+`)
#  title(main = ATP.H)
#  species(c("MgATP-2", "MgHATP-", "MgH2ATP", "Mg2ATP"))
#  Hplot <- function(pMg, IS = 0.25) {
#    basis("Mg+2", -pMg)
#    a <- affinity(pH = c(3, 9), IS = IS, T = T)
#    e <- equilibrate(a)
#    d <- diagram(e, alpha = TRUE, plot.it = FALSE)
#    alphas <- do.call(rbind, d$plotvals)
#    NH <- alphas * c(0:4, 0, 1, 2, 0)
#    lines(a$vals[[1]], colSums(NH), lty = 7 - pMg, col = 7 - pMg)
#  }
#  plot(c(3, 9), c(0, 2), type = "n", xlab = "pH", ylab = Hlab)
#  lapply(2:6, Hplot)
#  legend("topright", legend = paste("pMg = ", 2:6), lty = 5:1, col = 5:1, cex = 0.8)
#  ATP.H.Mg <- substitute("ATP and H"^`+`~"and Mg"^`+2`)
#  title(main = ATP.H.Mg)
#  Mgplot <- function(pH, IS = 0.25) {
#    basis("pH", pH)
#    a <- affinity(`Mg+2` = c(-2, -7), IS = IS, T = T)
#    e <- equilibrate(a)
#    d <- diagram(e, alpha = TRUE, plot.it = FALSE)
#    alphas <- do.call(rbind, d$plotvals)
#    NMg <- alphas * species()$`Mg+`
#    lines(-a$vals[[1]], colSums(NMg), lty = 10 - pH, col = 10 - pH)
#  }
#  Mglab <- substitute(italic(N)[Mg^`+2`])
#  plot(c(2, 7), c(0, 1.2), type = "n", xlab = "pMg", ylab = Mglab)
#  lapply(3:9, Mgplot)
#  legend("topright", legend = paste("pH = ", 3:9), lty = 7:1, col = 7:1, cex = 0.8)
#  title(main = ATP.H.Mg)

## ----ATP, eval=FALSE, echo=12:17----------------------------------------------
#  par(mfrow = c(1, 4), mar = c(3.1, 3.6, 2.1, 1.6), mgp = c(1.8, 0.5, 0))
#  basis("MgCHNOPS+")
#  species(c("ATP-4", "HATP-3", "H2ATP-2", "H3ATP-", "H4ATP"))
#  a <- affinity(pH = c(3, 9), T = T)
#  e <- equilibrate(a)
#  d <- diagram(e, alpha = TRUE, tplot = FALSE)
#  title(main = describe.property("T", T))
#  alphas <- do.call(rbind, d$plotvals)
#  nH <- alphas * 0:4
#  Hlab <- substitute(italic(N)[H^`+`])
#  plot(a$vals[[1]], colSums(nH), type = "l", xlab = "pH", ylab=Hlab, lty=2, col=2)
#  a <- affinity(pH = c(3, 9), IS = 0.25, T = T)
#  e <- equilibrate(a)
#  d <- diagram(e, alpha = TRUE, plot.it = FALSE)
#  alphas <- do.call(rbind, d$plotvals)
#  nH <- alphas * 0:4
#  lines(a$vals[[1]], colSums(nH))
#  legend("topright", legend = c("I = 0 M", "I = 0.25 M"), lty = 2:1, col = 2:1, cex = 0.8)
#  ATP.H <- substitute("ATP and H"^`+`)
#  title(main = ATP.H)
#  species(c("MgATP-2", "MgHATP-", "MgH2ATP", "Mg2ATP"))
#  Hplot <- function(pMg, IS = 0.25) {
#    basis("Mg+2", -pMg)
#    a <- affinity(pH = c(3, 9), IS = IS, T = T)
#    e <- equilibrate(a)
#    d <- diagram(e, alpha = TRUE, plot.it = FALSE)
#    alphas <- do.call(rbind, d$plotvals)
#    NH <- alphas * c(0:4, 0, 1, 2, 0)
#    lines(a$vals[[1]], colSums(NH), lty = 7 - pMg, col = 7 - pMg)
#  }
#  plot(c(3, 9), c(0, 2), type = "n", xlab = "pH", ylab = Hlab)
#  lapply(2:6, Hplot)
#  legend("topright", legend = paste("pMg = ", 2:6), lty = 5:1, col = 5:1, cex = 0.8)
#  ATP.H.Mg <- substitute("ATP and H"^`+`~"and Mg"^`+2`)
#  title(main = ATP.H.Mg)
#  Mgplot <- function(pH, IS = 0.25) {
#    basis("pH", pH)
#    a <- affinity(`Mg+2` = c(-2, -7), IS = IS, T = T)
#    e <- equilibrate(a)
#    d <- diagram(e, alpha = TRUE, plot.it = FALSE)
#    alphas <- do.call(rbind, d$plotvals)
#    NMg <- alphas * species()$`Mg+`
#    lines(-a$vals[[1]], colSums(NMg), lty = 10 - pH, col = 10 - pH)
#  }
#  Mglab <- substitute(italic(N)[Mg^`+2`])
#  plot(c(2, 7), c(0, 1.2), type = "n", xlab = "pMg", ylab = Mglab)
#  lapply(3:9, Mgplot)
#  legend("topright", legend = paste("pH = ", 3:9), lty = 7:1, col = 7:1, cex = 0.8)
#  title(main = ATP.H.Mg)

## ----ATP, eval=FALSE, echo=21-------------------------------------------------
#  par(mfrow = c(1, 4), mar = c(3.1, 3.6, 2.1, 1.6), mgp = c(1.8, 0.5, 0))
#  basis("MgCHNOPS+")
#  species(c("ATP-4", "HATP-3", "H2ATP-2", "H3ATP-", "H4ATP"))
#  a <- affinity(pH = c(3, 9), T = T)
#  e <- equilibrate(a)
#  d <- diagram(e, alpha = TRUE, tplot = FALSE)
#  title(main = describe.property("T", T))
#  alphas <- do.call(rbind, d$plotvals)
#  nH <- alphas * 0:4
#  Hlab <- substitute(italic(N)[H^`+`])
#  plot(a$vals[[1]], colSums(nH), type = "l", xlab = "pH", ylab=Hlab, lty=2, col=2)
#  a <- affinity(pH = c(3, 9), IS = 0.25, T = T)
#  e <- equilibrate(a)
#  d <- diagram(e, alpha = TRUE, plot.it = FALSE)
#  alphas <- do.call(rbind, d$plotvals)
#  nH <- alphas * 0:4
#  lines(a$vals[[1]], colSums(nH))
#  legend("topright", legend = c("I = 0 M", "I = 0.25 M"), lty = 2:1, col = 2:1, cex = 0.8)
#  ATP.H <- substitute("ATP and H"^`+`)
#  title(main = ATP.H)
#  species(c("MgATP-2", "MgHATP-", "MgH2ATP", "Mg2ATP"))
#  Hplot <- function(pMg, IS = 0.25) {
#    basis("Mg+2", -pMg)
#    a <- affinity(pH = c(3, 9), IS = IS, T = T)
#    e <- equilibrate(a)
#    d <- diagram(e, alpha = TRUE, plot.it = FALSE)
#    alphas <- do.call(rbind, d$plotvals)
#    NH <- alphas * c(0:4, 0, 1, 2, 0)
#    lines(a$vals[[1]], colSums(NH), lty = 7 - pMg, col = 7 - pMg)
#  }
#  plot(c(3, 9), c(0, 2), type = "n", xlab = "pH", ylab = Hlab)
#  lapply(2:6, Hplot)
#  legend("topright", legend = paste("pMg = ", 2:6), lty = 5:1, col = 5:1, cex = 0.8)
#  ATP.H.Mg <- substitute("ATP and H"^`+`~"and Mg"^`+2`)
#  title(main = ATP.H.Mg)
#  Mgplot <- function(pH, IS = 0.25) {
#    basis("pH", pH)
#    a <- affinity(`Mg+2` = c(-2, -7), IS = IS, T = T)
#    e <- equilibrate(a)
#    d <- diagram(e, alpha = TRUE, plot.it = FALSE)
#    alphas <- do.call(rbind, d$plotvals)
#    NMg <- alphas * species()$`Mg+`
#    lines(-a$vals[[1]], colSums(NMg), lty = 10 - pH, col = 10 - pH)
#  }
#  Mglab <- substitute(italic(N)[Mg^`+2`])
#  plot(c(2, 7), c(0, 1.2), type = "n", xlab = "pMg", ylab = Mglab)
#  lapply(3:9, Mgplot)
#  legend("topright", legend = paste("pH = ", 3:9), lty = 7:1, col = 7:1, cex = 0.8)
#  title(main = ATP.H.Mg)

## ----ATP, eval=FALSE, echo=22:30----------------------------------------------
#  par(mfrow = c(1, 4), mar = c(3.1, 3.6, 2.1, 1.6), mgp = c(1.8, 0.5, 0))
#  basis("MgCHNOPS+")
#  species(c("ATP-4", "HATP-3", "H2ATP-2", "H3ATP-", "H4ATP"))
#  a <- affinity(pH = c(3, 9), T = T)
#  e <- equilibrate(a)
#  d <- diagram(e, alpha = TRUE, tplot = FALSE)
#  title(main = describe.property("T", T))
#  alphas <- do.call(rbind, d$plotvals)
#  nH <- alphas * 0:4
#  Hlab <- substitute(italic(N)[H^`+`])
#  plot(a$vals[[1]], colSums(nH), type = "l", xlab = "pH", ylab=Hlab, lty=2, col=2)
#  a <- affinity(pH = c(3, 9), IS = 0.25, T = T)
#  e <- equilibrate(a)
#  d <- diagram(e, alpha = TRUE, plot.it = FALSE)
#  alphas <- do.call(rbind, d$plotvals)
#  nH <- alphas * 0:4
#  lines(a$vals[[1]], colSums(nH))
#  legend("topright", legend = c("I = 0 M", "I = 0.25 M"), lty = 2:1, col = 2:1, cex = 0.8)
#  ATP.H <- substitute("ATP and H"^`+`)
#  title(main = ATP.H)
#  species(c("MgATP-2", "MgHATP-", "MgH2ATP", "Mg2ATP"))
#  Hplot <- function(pMg, IS = 0.25) {
#    basis("Mg+2", -pMg)
#    a <- affinity(pH = c(3, 9), IS = IS, T = T)
#    e <- equilibrate(a)
#    d <- diagram(e, alpha = TRUE, plot.it = FALSE)
#    alphas <- do.call(rbind, d$plotvals)
#    NH <- alphas * c(0:4, 0, 1, 2, 0)
#    lines(a$vals[[1]], colSums(NH), lty = 7 - pMg, col = 7 - pMg)
#  }
#  plot(c(3, 9), c(0, 2), type = "n", xlab = "pH", ylab = Hlab)
#  lapply(2:6, Hplot)
#  legend("topright", legend = paste("pMg = ", 2:6), lty = 5:1, col = 5:1, cex = 0.8)
#  ATP.H.Mg <- substitute("ATP and H"^`+`~"and Mg"^`+2`)
#  title(main = ATP.H.Mg)
#  Mgplot <- function(pH, IS = 0.25) {
#    basis("pH", pH)
#    a <- affinity(`Mg+2` = c(-2, -7), IS = IS, T = T)
#    e <- equilibrate(a)
#    d <- diagram(e, alpha = TRUE, plot.it = FALSE)
#    alphas <- do.call(rbind, d$plotvals)
#    NMg <- alphas * species()$`Mg+`
#    lines(-a$vals[[1]], colSums(NMg), lty = 10 - pH, col = 10 - pH)
#  }
#  Mglab <- substitute(italic(N)[Mg^`+2`])
#  plot(c(2, 7), c(0, 1.2), type = "n", xlab = "pMg", ylab = Mglab)
#  lapply(3:9, Mgplot)
#  legend("topright", legend = paste("pH = ", 3:9), lty = 7:1, col = 7:1, cex = 0.8)
#  title(main = ATP.H.Mg)

## ----ATP, eval=FALSE, echo=31:32----------------------------------------------
#  par(mfrow = c(1, 4), mar = c(3.1, 3.6, 2.1, 1.6), mgp = c(1.8, 0.5, 0))
#  basis("MgCHNOPS+")
#  species(c("ATP-4", "HATP-3", "H2ATP-2", "H3ATP-", "H4ATP"))
#  a <- affinity(pH = c(3, 9), T = T)
#  e <- equilibrate(a)
#  d <- diagram(e, alpha = TRUE, tplot = FALSE)
#  title(main = describe.property("T", T))
#  alphas <- do.call(rbind, d$plotvals)
#  nH <- alphas * 0:4
#  Hlab <- substitute(italic(N)[H^`+`])
#  plot(a$vals[[1]], colSums(nH), type = "l", xlab = "pH", ylab=Hlab, lty=2, col=2)
#  a <- affinity(pH = c(3, 9), IS = 0.25, T = T)
#  e <- equilibrate(a)
#  d <- diagram(e, alpha = TRUE, plot.it = FALSE)
#  alphas <- do.call(rbind, d$plotvals)
#  nH <- alphas * 0:4
#  lines(a$vals[[1]], colSums(nH))
#  legend("topright", legend = c("I = 0 M", "I = 0.25 M"), lty = 2:1, col = 2:1, cex = 0.8)
#  ATP.H <- substitute("ATP and H"^`+`)
#  title(main = ATP.H)
#  species(c("MgATP-2", "MgHATP-", "MgH2ATP", "Mg2ATP"))
#  Hplot <- function(pMg, IS = 0.25) {
#    basis("Mg+2", -pMg)
#    a <- affinity(pH = c(3, 9), IS = IS, T = T)
#    e <- equilibrate(a)
#    d <- diagram(e, alpha = TRUE, plot.it = FALSE)
#    alphas <- do.call(rbind, d$plotvals)
#    NH <- alphas * c(0:4, 0, 1, 2, 0)
#    lines(a$vals[[1]], colSums(NH), lty = 7 - pMg, col = 7 - pMg)
#  }
#  plot(c(3, 9), c(0, 2), type = "n", xlab = "pH", ylab = Hlab)
#  lapply(2:6, Hplot)
#  legend("topright", legend = paste("pMg = ", 2:6), lty = 5:1, col = 5:1, cex = 0.8)
#  ATP.H.Mg <- substitute("ATP and H"^`+`~"and Mg"^`+2`)
#  title(main = ATP.H.Mg)
#  Mgplot <- function(pH, IS = 0.25) {
#    basis("pH", pH)
#    a <- affinity(`Mg+2` = c(-2, -7), IS = IS, T = T)
#    e <- equilibrate(a)
#    d <- diagram(e, alpha = TRUE, plot.it = FALSE)
#    alphas <- do.call(rbind, d$plotvals)
#    NMg <- alphas * species()$`Mg+`
#    lines(-a$vals[[1]], colSums(NMg), lty = 10 - pH, col = 10 - pH)
#  }
#  Mglab <- substitute(italic(N)[Mg^`+2`])
#  plot(c(2, 7), c(0, 1.2), type = "n", xlab = "pMg", ylab = Mglab)
#  lapply(3:9, Mgplot)
#  legend("topright", legend = paste("pH = ", 3:9), lty = 7:1, col = 7:1, cex = 0.8)
#  title(main = ATP.H.Mg)

## ----ATP, eval=FALSE, echo=36:44----------------------------------------------
#  par(mfrow = c(1, 4), mar = c(3.1, 3.6, 2.1, 1.6), mgp = c(1.8, 0.5, 0))
#  basis("MgCHNOPS+")
#  species(c("ATP-4", "HATP-3", "H2ATP-2", "H3ATP-", "H4ATP"))
#  a <- affinity(pH = c(3, 9), T = T)
#  e <- equilibrate(a)
#  d <- diagram(e, alpha = TRUE, tplot = FALSE)
#  title(main = describe.property("T", T))
#  alphas <- do.call(rbind, d$plotvals)
#  nH <- alphas * 0:4
#  Hlab <- substitute(italic(N)[H^`+`])
#  plot(a$vals[[1]], colSums(nH), type = "l", xlab = "pH", ylab=Hlab, lty=2, col=2)
#  a <- affinity(pH = c(3, 9), IS = 0.25, T = T)
#  e <- equilibrate(a)
#  d <- diagram(e, alpha = TRUE, plot.it = FALSE)
#  alphas <- do.call(rbind, d$plotvals)
#  nH <- alphas * 0:4
#  lines(a$vals[[1]], colSums(nH))
#  legend("topright", legend = c("I = 0 M", "I = 0.25 M"), lty = 2:1, col = 2:1, cex = 0.8)
#  ATP.H <- substitute("ATP and H"^`+`)
#  title(main = ATP.H)
#  species(c("MgATP-2", "MgHATP-", "MgH2ATP", "Mg2ATP"))
#  Hplot <- function(pMg, IS = 0.25) {
#    basis("Mg+2", -pMg)
#    a <- affinity(pH = c(3, 9), IS = IS, T = T)
#    e <- equilibrate(a)
#    d <- diagram(e, alpha = TRUE, plot.it = FALSE)
#    alphas <- do.call(rbind, d$plotvals)
#    NH <- alphas * c(0:4, 0, 1, 2, 0)
#    lines(a$vals[[1]], colSums(NH), lty = 7 - pMg, col = 7 - pMg)
#  }
#  plot(c(3, 9), c(0, 2), type = "n", xlab = "pH", ylab = Hlab)
#  lapply(2:6, Hplot)
#  legend("topright", legend = paste("pMg = ", 2:6), lty = 5:1, col = 5:1, cex = 0.8)
#  ATP.H.Mg <- substitute("ATP and H"^`+`~"and Mg"^`+2`)
#  title(main = ATP.H.Mg)
#  Mgplot <- function(pH, IS = 0.25) {
#    basis("pH", pH)
#    a <- affinity(`Mg+2` = c(-2, -7), IS = IS, T = T)
#    e <- equilibrate(a)
#    d <- diagram(e, alpha = TRUE, plot.it = FALSE)
#    alphas <- do.call(rbind, d$plotvals)
#    NMg <- alphas * species()$`Mg+`
#    lines(-a$vals[[1]], colSums(NMg), lty = 10 - pH, col = 10 - pH)
#  }
#  Mglab <- substitute(italic(N)[Mg^`+2`])
#  plot(c(2, 7), c(0, 1.2), type = "n", xlab = "pMg", ylab = Mglab)
#  lapply(3:9, Mgplot)
#  legend("topright", legend = paste("pH = ", 3:9), lty = 7:1, col = 7:1, cex = 0.8)
#  title(main = ATP.H.Mg)

## ----ATP, eval=FALSE, echo=45:47----------------------------------------------
#  par(mfrow = c(1, 4), mar = c(3.1, 3.6, 2.1, 1.6), mgp = c(1.8, 0.5, 0))
#  basis("MgCHNOPS+")
#  species(c("ATP-4", "HATP-3", "H2ATP-2", "H3ATP-", "H4ATP"))
#  a <- affinity(pH = c(3, 9), T = T)
#  e <- equilibrate(a)
#  d <- diagram(e, alpha = TRUE, tplot = FALSE)
#  title(main = describe.property("T", T))
#  alphas <- do.call(rbind, d$plotvals)
#  nH <- alphas * 0:4
#  Hlab <- substitute(italic(N)[H^`+`])
#  plot(a$vals[[1]], colSums(nH), type = "l", xlab = "pH", ylab=Hlab, lty=2, col=2)
#  a <- affinity(pH = c(3, 9), IS = 0.25, T = T)
#  e <- equilibrate(a)
#  d <- diagram(e, alpha = TRUE, plot.it = FALSE)
#  alphas <- do.call(rbind, d$plotvals)
#  nH <- alphas * 0:4
#  lines(a$vals[[1]], colSums(nH))
#  legend("topright", legend = c("I = 0 M", "I = 0.25 M"), lty = 2:1, col = 2:1, cex = 0.8)
#  ATP.H <- substitute("ATP and H"^`+`)
#  title(main = ATP.H)
#  species(c("MgATP-2", "MgHATP-", "MgH2ATP", "Mg2ATP"))
#  Hplot <- function(pMg, IS = 0.25) {
#    basis("Mg+2", -pMg)
#    a <- affinity(pH = c(3, 9), IS = IS, T = T)
#    e <- equilibrate(a)
#    d <- diagram(e, alpha = TRUE, plot.it = FALSE)
#    alphas <- do.call(rbind, d$plotvals)
#    NH <- alphas * c(0:4, 0, 1, 2, 0)
#    lines(a$vals[[1]], colSums(NH), lty = 7 - pMg, col = 7 - pMg)
#  }
#  plot(c(3, 9), c(0, 2), type = "n", xlab = "pH", ylab = Hlab)
#  lapply(2:6, Hplot)
#  legend("topright", legend = paste("pMg = ", 2:6), lty = 5:1, col = 5:1, cex = 0.8)
#  ATP.H.Mg <- substitute("ATP and H"^`+`~"and Mg"^`+2`)
#  title(main = ATP.H.Mg)
#  Mgplot <- function(pH, IS = 0.25) {
#    basis("pH", pH)
#    a <- affinity(`Mg+2` = c(-2, -7), IS = IS, T = T)
#    e <- equilibrate(a)
#    d <- diagram(e, alpha = TRUE, plot.it = FALSE)
#    alphas <- do.call(rbind, d$plotvals)
#    NMg <- alphas * species()$`Mg+`
#    lines(-a$vals[[1]], colSums(NMg), lty = 10 - pH, col = 10 - pH)
#  }
#  Mglab <- substitute(italic(N)[Mg^`+2`])
#  plot(c(2, 7), c(0, 1.2), type = "n", xlab = "pMg", ylab = Mglab)
#  lapply(3:9, Mgplot)
#  legend("topright", legend = paste("pH = ", 3:9), lty = 7:1, col = 7:1, cex = 0.8)
#  title(main = ATP.H.Mg)

## ----ATP, fig.fullwidth=TRUE, fig.width=10, fig.height=2.5, dpi=ifelse(dpi==50, 50, 100), out.width="100%", echo=FALSE, message=FALSE, results="hide", fig.cap="Binding of H<sup>+</sup> and Mg<sup>+2</sup> to ATP at 100 °C and *I* = 0 M (first plot) or *I* = 0.25 M (third and fourth plots).", cache=TRUE, pngquant=pngquant, timeit=timeit----
par(mfrow = c(1, 4), mar = c(3.1, 3.6, 2.1, 1.6), mgp = c(1.8, 0.5, 0))
basis("MgCHNOPS+")
species(c("ATP-4", "HATP-3", "H2ATP-2", "H3ATP-", "H4ATP"))
a <- affinity(pH = c(3, 9), T = T)
e <- equilibrate(a)
d <- diagram(e, alpha = TRUE, tplot = FALSE)
title(main = describe.property("T", T))
alphas <- do.call(rbind, d$plotvals)
nH <- alphas * 0:4
Hlab <- substitute(italic(N)[H^`+`])
plot(a$vals[[1]], colSums(nH), type = "l", xlab = "pH", ylab=Hlab, lty=2, col=2)
a <- affinity(pH = c(3, 9), IS = 0.25, T = T)
e <- equilibrate(a)
d <- diagram(e, alpha = TRUE, plot.it = FALSE)
alphas <- do.call(rbind, d$plotvals)
nH <- alphas * 0:4
lines(a$vals[[1]], colSums(nH))
legend("topright", legend = c("I = 0 M", "I = 0.25 M"), lty = 2:1, col = 2:1, cex = 0.8)
ATP.H <- substitute("ATP and H"^`+`)
title(main = ATP.H)
species(c("MgATP-2", "MgHATP-", "MgH2ATP", "Mg2ATP"))
Hplot <- function(pMg, IS = 0.25) {
  basis("Mg+2", -pMg)
  a <- affinity(pH = c(3, 9), IS = IS, T = T)
  e <- equilibrate(a)
  d <- diagram(e, alpha = TRUE, plot.it = FALSE)
  alphas <- do.call(rbind, d$plotvals)
  NH <- alphas * c(0:4, 0, 1, 2, 0)
  lines(a$vals[[1]], colSums(NH), lty = 7 - pMg, col = 7 - pMg)
}
plot(c(3, 9), c(0, 2), type = "n", xlab = "pH", ylab = Hlab)
lapply(2:6, Hplot)
legend("topright", legend = paste("pMg = ", 2:6), lty = 5:1, col = 5:1, cex = 0.8)
ATP.H.Mg <- substitute("ATP and H"^`+`~"and Mg"^`+2`)
title(main = ATP.H.Mg)
Mgplot <- function(pH, IS = 0.25) {
  basis("pH", pH)
  a <- affinity(`Mg+2` = c(-2, -7), IS = IS, T = T)
  e <- equilibrate(a)
  d <- diagram(e, alpha = TRUE, plot.it = FALSE)
  alphas <- do.call(rbind, d$plotvals)
  NMg <- alphas * species()$`Mg+`
  lines(-a$vals[[1]], colSums(NMg), lty = 10 - pH, col = 10 - pH)
}
Mglab <- substitute(italic(N)[Mg^`+2`])
plot(c(2, 7), c(0, 1.2), type = "n", xlab = "pMg", ylab = Mglab)
lapply(3:9, Mgplot)
legend("topright", legend = paste("pH = ", 3:9), lty = 7:1, col = 7:1, cex = 0.8)
title(main = ATP.H.Mg)

## ----oldnon-------------------------------------------------------------------
nonideal(oldnon)

## ----pinfo_LYSC_CHICK---------------------------------------------------------
p1 <- pinfo("LYSC_CHICK")
p2 <- pinfo(c("SHH", "OLIG2"), "HUMAN")
pinfo(c(p1, p2))

## ----formula_LYSC_CHICK-------------------------------------------------------
pl <- protein.length("LYSC_CHICK")
pf <- protein.formula("LYSC_CHICK")
list(length = pl, protein = pf, residue = pf / pl,
     ZC_protein = ZC(pf), ZC_residue = ZC(pf / pl))

## ----subcrt_LYSC_CHICK, message=FALSE-----------------------------------------
subcrt("LYSC_CHICK")$out[[1]][1:6, ]

## ----protein_Cp, fig.margin=TRUE, fig.width=4, fig.height=4, small.mar=TRUE, dpi=dpi, out.width="100%", echo=FALSE, message=FALSE, fig.cap='The heat capacity calculated by group additivity closely approximates experimental values for aqueous proteins. For a related figure showing the effects of ionization in the calculations, see <span style="color:blue">?ionize.aa</span>.', cache=TRUE, pngquant=pngquant, timeit=timeit----
PM90 <- read.csv(system.file("extdata/cpetc/PM90.csv", package = "CHNOSZ"))
plength <- protein.length(colnames(PM90)[2:5])
Cp_expt <- t(t(PM90[, 2:5]) / plength)
matplot(PM90[, 1], convert(Cp_expt, "cal"), type = "p", pch = 19,
        xlab = axis.label("T"), ylab = axis.label("Cp0"), ylim = c(28, 65))
for(i in 1:4) {
  pname <- colnames(Cp_expt)[i]
  aq <- subcrt(pname, "aq", T = seq(0, 150))$out[[1]]
  cr <- subcrt(pname, "cr", T = seq(0, 150))$out[[1]]
  lines(aq$T, aq$Cp / plength[i], col = i)
  lines(cr$T, cr$Cp / plength[i], col = i, lty = 2)
}
legend("right", legend = colnames(Cp_expt),
       col = 1:4, pch = 19, lty = 1, bty = "n", cex = 0.9)
legend("bottomright", legend = c("experimental", "calculated (aq)",
       "calculated (cr)"), lty = c(NA, 1, 2), pch = c(19, NA, NA), bty = "n")

## ----protein_Cp, eval=FALSE, echo=1:5-----------------------------------------
#  PM90 <- read.csv(system.file("extdata/cpetc/PM90.csv", package = "CHNOSZ"))
#  plength <- protein.length(colnames(PM90)[2:5])
#  Cp_expt <- t(t(PM90[, 2:5]) / plength)
#  matplot(PM90[, 1], convert(Cp_expt, "cal"), type = "p", pch = 19,
#          xlab = axis.label("T"), ylab = axis.label("Cp0"), ylim = c(28, 65))
#  for(i in 1:4) {
#    pname <- colnames(Cp_expt)[i]
#    aq <- subcrt(pname, "aq", T = seq(0, 150))$out[[1]]
#    cr <- subcrt(pname, "cr", T = seq(0, 150))$out[[1]]
#    lines(aq$T, aq$Cp / plength[i], col = i)
#    lines(cr$T, cr$Cp / plength[i], col = i, lty = 2)
#  }
#  legend("right", legend = colnames(Cp_expt),
#         col = 1:4, pch = 19, lty = 1, bty = "n", cex = 0.9)
#  legend("bottomright", legend = c("experimental", "calculated (aq)",
#         "calculated (cr)"), lty = c(NA, 1, 2), pch = c(19, NA, NA), bty = "n")

## ----protein_Cp, eval=FALSE, echo=-(1:5)--------------------------------------
#  PM90 <- read.csv(system.file("extdata/cpetc/PM90.csv", package = "CHNOSZ"))
#  plength <- protein.length(colnames(PM90)[2:5])
#  Cp_expt <- t(t(PM90[, 2:5]) / plength)
#  matplot(PM90[, 1], convert(Cp_expt, "cal"), type = "p", pch = 19,
#          xlab = axis.label("T"), ylab = axis.label("Cp0"), ylim = c(28, 65))
#  for(i in 1:4) {
#    pname <- colnames(Cp_expt)[i]
#    aq <- subcrt(pname, "aq", T = seq(0, 150))$out[[1]]
#    cr <- subcrt(pname, "cr", T = seq(0, 150))$out[[1]]
#    lines(aq$T, aq$Cp / plength[i], col = i)
#    lines(cr$T, cr$Cp / plength[i], col = i, lty = 2)
#  }
#  legend("right", legend = colnames(Cp_expt),
#         col = 1:4, pch = 19, lty = 1, bty = "n", cex = 0.9)
#  legend("bottomright", legend = c("experimental", "calculated (aq)",
#         "calculated (cr)"), lty = c(NA, 1, 2), pch = c(19, NA, NA), bty = "n")

## ----protein_ionization, fig.margin=TRUE, fig.width=4, fig.height=4, small.mar=TRUE, dpi=dpi, out.width="100%", echo=FALSE, results="hide", message=FALSE, fig.cap='Affinity of ionization of proteins. See [<span style="color:blue">demo(ionize)</span>](../demo) for ionization properties calculated as a function of temperature and pH.', cache=TRUE, pngquant=pngquant, timeit=timeit----
ip <- pinfo(c("CYC_BOVIN", "LYSC_CHICK", "MYG_PHYCA", "RNAS1_BOVIN"))
basis("CHNOS+")
a_ion <- affinity(pH = c(0, 14), iprotein = ip)
basis("CHNOS")
a_nonion <- affinity(iprotein = ip)
plot(c(0, 14), c(50, 300), xlab = "pH", ylab = axis.label("A"), type = "n")
for(i in 1:4) {
  A_ion <- as.numeric(a_ion$values[[i]])
  A_nonion <- as.numeric(a_nonion$values[[i]])
  lines(a_ion$vals[[1]], A_ion - A_nonion, col=i)
}
legend("topright", legend = a_ion$species$name,
       col = 1:4, lty = 1, bty = "n", cex = 0.9)

## ----protein_ionization, eval=FALSE-------------------------------------------
#  ip <- pinfo(c("CYC_BOVIN", "LYSC_CHICK", "MYG_PHYCA", "RNAS1_BOVIN"))
#  basis("CHNOS+")
#  a_ion <- affinity(pH = c(0, 14), iprotein = ip)
#  basis("CHNOS")
#  a_nonion <- affinity(iprotein = ip)
#  plot(c(0, 14), c(50, 300), xlab = "pH", ylab = axis.label("A"), type = "n")
#  for(i in 1:4) {
#    A_ion <- as.numeric(a_ion$values[[i]])
#    A_nonion <- as.numeric(a_nonion$values[[i]])
#    lines(a_ion$vals[[1]], A_ion - A_nonion, col=i)
#  }
#  legend("topright", legend = a_ion$species$name,
#         col = 1:4, lty = 1, bty = "n", cex = 0.9)

## ----basis_CHNOS, echo=FALSE, results="hide"----------------------------------
basis("CHNOS")

## ----species_protein, results="hide", message=FALSE, echo=1:2-----------------
species(c("CYC_BOVIN", "LYSC_CHICK", "MYG_PHYCA", "RNAS1_BOVIN"))
a_nonion_species <- affinity()

## ----nonion_species_values----------------------------------------------------
unlist(a_nonion_species$values)

## ----nonion_values------------------------------------------------------------
unlist(a_nonion$values)

## ----rubisco_svg, echo=FALSE, results="hide", fig.margin=TRUE, fig.width=4, fig.height=4, small.mar=TRUE, out.width="100%", fig.ext='svg', custom.plot=TRUE, embed.tag=TRUE, fig.cap='Average oxidation state of carbon in Rubisco compared with optimal growth temperature of organisms. **This is an interactive image.** Move the mouse over the points to show the names of the organisms, and click to open a reference in a new window. (Made with [**RSVGTipsDevice**](https://cran.r-project.org/package=RSVGTipsDevice) using code that can be found in the source of this document.)'----
## copies the premade SVG image to the knitr figure path
file.copy("rubisco.svg", fig_path(".svg"))
## the code for making the SVG image -- not "live" in the vignette because RSVGTipsDevice isn't available on Windows
#if(require(RSVGTipsDevice)) {
#  datfile <- system.file("extdata/cpetc/rubisco.csv", package = "CHNOSZ")
#  fastafile <- system.file("extdata/fasta/rubisco.fasta", package = "CHNOSZ")
#  dat <- read.csv(datfile)
#  aa <- read.fasta(fastafile)
#  Topt <- (dat$T1 + dat$T2) / 2
#  idat <- match(dat$ID, substr(aa$protein, 4, 9))
#  aa <- aa[idat, ]
#  ZC <- ZC(protein.formula(aa))
#  pch <- match(dat$domain, c("E", "B", "A")) - 1
#  col <- match(dat$domain, c("A", "B", "E")) + 1
#  # because the tooltip titles in the SVG file are shown by recent browsers,
#  # we do not need to draw the tooltips explicitly, so set toolTipMode=0
#  devSVGTips("rubisco.svg", toolTipMode=0, title="Rubisco")
#  par(cex=1.4)
#  # unfortunately, plotmath can't be used with devSVGTips,
#  # so axis labels here don't contain italics.
#  plot(Topt, ZC, type="n", xlab="T, &#176;C", ylab="ZC")
#  n <- rep(1:9, 3)
#  for(i in seq_along(Topt)) {
#    # adjust cex to make the symbols look the same size
#    cex <- ifelse(pch[i]==1, 2.5, 3.5)
#    points(Topt[i], ZC[i], pch=pch[i], cex=cex, col=col[i])
#    URL <- dat$URL[i]
#    setSVGShapeURL(URL, target="_blank")
#    setSVGShapeContents(paste0("<title>", dat$species[i], "</title>"))
#    text(Topt[i], ZC[i], n[i], cex = 1.2)
#  }
#  abline(v = c(36, 63), lty = 2, col = "grey")
#  legend("topright", legend = c("Archaea", "Bacteria", "Eukaryota"),
#         pch = c(2, 1, 0), col = 2:4, cex=1.5, pt.cex = c(3, 2.3, 3), bty="n")
#  dev.off()
#}

## ----rubisco_ZC, fig.keep="none", message=FALSE-------------------------------
datfile <- system.file("extdata/cpetc/rubisco.csv", package = "CHNOSZ")
fastafile <- system.file("extdata/fasta/rubisco.fasta", package = "CHNOSZ")
dat <- read.csv(datfile)
aa <- read.fasta(fastafile)
Topt <- (dat$T1 + dat$T2) / 2
idat <- match(dat$ID, substr(aa$protein, 4, 9))
aa <- aa[idat, ]
ZC <- ZC(protein.formula(aa))
pch <- match(dat$domain, c("E", "B", "A")) - 1
col <- match(dat$domain, c("A", "B", "E")) + 1
plot(Topt, ZC, pch = pch, cex = 2, col = col,
     xlab = expression(list(italic(T)[opt], degree*C)),
     ylab = expression(italic(Z)[C]))
text(Topt, ZC, rep(1:9, 3), cex = 0.8)
abline(v = c(36, 63), lty = 2, col = "grey")
legend("topright", legend = c("Archaea", "Bacteria", "Eukaryota"),
       pch = c(2, 1, 0), col = 2:4, pt.cex = 2)

## ----rubisco_O2, fig.margin=TRUE, fig.width=4, fig.height=4, small.mar=TRUE, dpi=dpi, out.width="100%", echo=FALSE, results="hide", message=FALSE, fig.cap="Compositions of proteins projected into different sets of basis species.", cache=TRUE, pngquant=pngquant, timeit=timeit----
layout(matrix(1:4, nrow = 2))
par(mgp = c(1.8, 0.5, 0))
pl <- protein.length(aa)
ZClab <- axis.label("ZC")
nO2lab <- expression(bar(italic(n))[O[2]])
nH2Olab <- expression(bar(italic(n))[H[2]*O])
lapply(c("CHNOS", "QEC"), function(thisbasis) {
  basis(thisbasis)
  pb <- protein.basis(aa)
  nO2 <- pb[, "O2"] / pl
  plot(ZC, nO2, pch = pch, col = col, xlab = ZClab, ylab = nO2lab)
  nH2O <- pb[, "H2O"] / pl
  plot(ZC, nH2O, pch = pch, col = col, xlab = ZClab, ylab = nH2Olab)
  mtext(thisbasis, font = 2)
})

## ----rubisco_O2, eval=FALSE---------------------------------------------------
#  layout(matrix(1:4, nrow = 2))
#  par(mgp = c(1.8, 0.5, 0))
#  pl <- protein.length(aa)
#  ZClab <- axis.label("ZC")
#  nO2lab <- expression(bar(italic(n))[O[2]])
#  nH2Olab <- expression(bar(italic(n))[H[2]*O])
#  lapply(c("CHNOS", "QEC"), function(thisbasis) {
#    basis(thisbasis)
#    pb <- protein.basis(aa)
#    nO2 <- pb[, "O2"] / pl
#    plot(ZC, nO2, pch = pch, col = col, xlab = ZClab, ylab = nO2lab)
#    nH2O <- pb[, "H2O"] / pl
#    plot(ZC, nH2O, pch = pch, col = col, xlab = ZClab, ylab = nH2Olab)
#    mtext(thisbasis, font = 2)
#  })

## ----yeastgfp-----------------------------------------------------------------
y <- yeastgfp("ER.to.Golgi")
ina <- is.na(y$abundance)

## ----add_protein_yeast, message=FALSE-----------------------------------------
aa <- yeast.aa(y$protein[!ina])
ip <- add.protein(aa)

## ----unitize------------------------------------------------------------------
pl <- protein.length(ip)
logact <- unitize(numeric(5), pl)
logabundance <- unitize(log10(y$abundance[!ina]), pl)

## ----yeastplot, eval=FALSE, echo=1:6------------------------------------------
#  par(mfrow = c(1, 3))
#  basis("CHNOS+")
#  #mod.obigt("[Met]", G = -35245, H = -59310)
#  a <- affinity(O2 = c(-80, -73), iprotein = ip, loga.protein = logact)
#  e <- equilibrate(a)
#  diagram(e, ylim = c(-5, -2), col = 1:5, lwd = 2)
#  e <- equilibrate(a, normalize = TRUE)
#  diagram(e, ylim = c(-5, -2.5), col = 1:5, lwd = 2)
#  abline(h = logabundance, lty = 1:5, col = 1:5)
#  revisit(e, "DGinf", logabundance)

## ----yeastplot, eval=FALSE, echo=7:9------------------------------------------
#  par(mfrow = c(1, 3))
#  basis("CHNOS+")
#  #mod.obigt("[Met]", G = -35245, H = -59310)
#  a <- affinity(O2 = c(-80, -73), iprotein = ip, loga.protein = logact)
#  e <- equilibrate(a)
#  diagram(e, ylim = c(-5, -2), col = 1:5, lwd = 2)
#  e <- equilibrate(a, normalize = TRUE)
#  diagram(e, ylim = c(-5, -2.5), col = 1:5, lwd = 2)
#  abline(h = logabundance, lty = 1:5, col = 1:5)
#  revisit(e, "DGinf", logabundance)

## ----yeastplot, eval=FALSE, echo=10-------------------------------------------
#  par(mfrow = c(1, 3))
#  basis("CHNOS+")
#  #mod.obigt("[Met]", G = -35245, H = -59310)
#  a <- affinity(O2 = c(-80, -73), iprotein = ip, loga.protein = logact)
#  e <- equilibrate(a)
#  diagram(e, ylim = c(-5, -2), col = 1:5, lwd = 2)
#  e <- equilibrate(a, normalize = TRUE)
#  diagram(e, ylim = c(-5, -2.5), col = 1:5, lwd = 2)
#  abline(h = logabundance, lty = 1:5, col = 1:5)
#  revisit(e, "DGinf", logabundance)

## ----yeastplot, fig.fullwidth=TRUE, fig.width=7.5, fig.height=2.5, small.mar=TRUE, dpi=ifelse(dpi==50, 50, 100), out.width="85%", echo=FALSE, message=FALSE, results="hide", cache=TRUE, fig.cap="ER-to-Golgi proteins: calculations without and with length normalization, and free energy difference between experimental and calculated abundances in metastable equilibrium with normalization.", pngquant=pngquant, timeit=timeit----
par(mfrow = c(1, 3))
basis("CHNOS+")
#mod.obigt("[Met]", G = -35245, H = -59310)
a <- affinity(O2 = c(-80, -73), iprotein = ip, loga.protein = logact)
e <- equilibrate(a)
diagram(e, ylim = c(-5, -2), col = 1:5, lwd = 2)
e <- equilibrate(a, normalize = TRUE)
diagram(e, ylim = c(-5, -2.5), col = 1:5, lwd = 2)
abline(h = logabundance, lty = 1:5, col = 1:5)
revisit(e, "DGinf", logabundance)

## ----Shh_pname----------------------------------------------------------------
pname <- c("SHH", "OLIG2", "NKX22", "FOXA2", "IRX3",
  "PAX6", "NKX62", "DBX1", "DBX2", "NKX61", "PAX7")
ip <- pinfo(pname, "HUMAN")

## ----Shh_basis, results="hide"------------------------------------------------
basis("CHNOS")
basis("NH3", -7)

## ----Shh_affinity, message=FALSE----------------------------------------------
O2 <- seq(-70, -106, length.out = 50)
H2O <- seq(0.5, -5.5, length.out = 50)
a <- affinity(H2O = H2O, O2 = O2, iprotein = ip)

## ----Shh_residue--------------------------------------------------------------
pl <- protein.length(ip)
for(i in seq_along(a$values)) a$values[[i]] <- a$values[[i]] / pl[i]

## ----Shh_minusShh-------------------------------------------------------------
a.Shh <- a$values[[1]]
for(i in 1:length(a$values)) a$values[[i]] <- a$values[[i]] - a.Shh

## ----Shh_diagram, fig.margin=TRUE, fig.width=4, fig.height=4, small.mar=TRUE, dpi=dpi, out.width="100%", echo=FALSE, results="hide", message=FALSE, fig.cap="Per-residue affinities for formation of transcription factors relative to Shh.", cache=TRUE, pngquant=pngquant, timeit=timeit----
# line type, width, and color
twc <- lapply(c(3, 1, 1), rep, length(pname))
ihigh <- c(2, 5, 7, 8, 1)
twc[[1]][ihigh] <- 1
twc[[2]][ihigh] <- 3
col <- c("#f9a330", "#63c54e", "#f24e33", "#d4e94e", "#0f0f0f")
twc[[3]][ihigh] <- col
names <- rep("", length(pname))
names[ihigh] <- c("Olig2", "Irx3", "Nkx6.2", "Dbx1", "Shh")
ylab <- substitute(italic(A) / (2.303 * italic(RT)) * " relative to Shh")
diagram(a, balance = 1, ylim = c(-0.5, 5), xlim = c(0.5, -5.5),
  lty = twc[[1]], lwd=twc[[2]], col = twc[[3]], ylab = ylab,
  names = names, adj = 0, dy = 0.1, format.names = FALSE)
par(usr = c(-70, -106, -0.5, 5), tcl = -0.3)
axis(3, at = seq(-70, -106, by = -10))
mtext(axis.label("O2"), line = 1.2)

## ----Shh_diagram, eval=FALSE--------------------------------------------------
#  # line type, width, and color
#  twc <- lapply(c(3, 1, 1), rep, length(pname))
#  ihigh <- c(2, 5, 7, 8, 1)
#  twc[[1]][ihigh] <- 1
#  twc[[2]][ihigh] <- 3
#  col <- c("#f9a330", "#63c54e", "#f24e33", "#d4e94e", "#0f0f0f")
#  twc[[3]][ihigh] <- col
#  names <- rep("", length(pname))
#  names[ihigh] <- c("Olig2", "Irx3", "Nkx6.2", "Dbx1", "Shh")
#  ylab <- substitute(italic(A) / (2.303 * italic(RT)) * " relative to Shh")
#  diagram(a, balance = 1, ylim = c(-0.5, 5), xlim = c(0.5, -5.5),
#    lty = twc[[1]], lwd=twc[[2]], col = twc[[3]], ylab = ylab,
#    names = names, adj = 0, dy = 0.1, format.names = FALSE)
#  par(usr = c(-70, -106, -0.5, 5), tcl = -0.3)
#  axis(3, at = seq(-70, -106, by = -10))
#  mtext(axis.label("O2"), line = 1.2)

## ----read_csv-----------------------------------------------------------------
file <- system.file("extdata/protein/DS11.csv", package = "CHNOSZ")
aa_bison <- read.csv(file, as.is = TRUE, nrows = 5)

## ----yeast_aa-----------------------------------------------------------------
aa_YML020W <- yeast.aa("YML020W")

## ----read_fasta, message=FALSE------------------------------------------------
file <- system.file("extdata/fasta/EF-Tu.aln", package = "CHNOSZ")
aa_Ef <- read.fasta(file, iseq = 1:2)

## ----seq2aa-------------------------------------------------------------------
aa_PRIO <- seq2aa("PRIO_HUMAN", "
MANLGCWMLVLFVATWSDLGLCKKRPKPGGWNTGGSRYPGQGSPGGNRYPPQGGGGWGQP
HGGGWGQPHGGGWGQPHGGGWGQPHGGGWGQGGGTHSQWNKPSKPKTNMKHMAGAAAAGA
VVGGLGGYMLGSAMSRPIIHFGSDYEDRYYRENMHRYPNQVYYRPMDEYSNQNNFVHDCV
NITIKQHTVTTTTKGENFTETDVKMMERVVEQMCITQYERESQAYYQRGSSMVLFSSPPV
ILLISFLIFLIVG
")

## ----uniprot_aa, eval=FALSE---------------------------------------------------
#  IDs <- c("ALAT1_HUMAN", "P02452")
#  aa <- lapply(IDs, uniprot.aa)
#  ## uniprot.aa: trying http://www.uniprot.org/uniprot/ALAT1_HUMAN ... accession P24298 ...
#  ## >sp|P24298|ALAT1_HUMAN Alanine aminotransferase 1 OS=Homo sapiens GN=GPT PE=1 SV=3 (length 496)
#  ## uniprot.aa: trying http://www.uniprot.org/uniprot/P02452 ... accession P02452 ...
#  ## >sp|P02452|CO1A1_HUMAN Collagen alpha-1(I) chain OS=Homo sapiens GN=COL1A1 PE=1 SV=5 (length 1464)
#  aa_UniProt <- do.call(rbind, aa)

## ----uniprot_aa_offline, echo=FALSE-------------------------------------------
aa_ALAT1 <- seq2aa("sp|P24298_HUMAN", "
MASSTGDRSQAVRHGLRAKVLTLDGMNPRVRRVEYAVRGPIVQRALELEQELRQGVKKPF
TEVIRANIGDAQAMGQRPITFLRQVLALCVNPDLLSSPNFPDDAKKRAERILQACGGHSL
GAYSVSSGIQLIREDVARYIERRDGGIPADPNNVFLSTGASDAIVTVLKLLVAGEGHTRT
GVLIPIPQYPLYSATLAELGAVQVDYYLDEERAWALDVAELHRALGQARDHCRPRALCVI
NPGNPTGQVQTRECIEAVIRFAFEERLFLLADEVYQDNVYAAGSQFHSFKKVLMEMGPPY
AGQQELASFHSTSKGYMGECGFRGGYVEVVNMDAAVQQQMLKLMSVRLCPPVPGQALLDL
VVSPPAPTDPSFAQFQAEKQAVLAELAAKAKLTEQVFNEAPGISCNPVQGAMYSFPRVQL
PPRAVERAQELGLAPDMFFCLRLLEETGICVVPGSGFGQREGTYHFRMTILPPLEKLRLL
LEKLSRFHAKFTLEYS
")
aa_CO1A1 <- seq2aa("sp|P02452_HUMAN", "
MFSFVDLRLLLLLAATALLTHGQEEGQVEGQDEDIPPITCVQNGLRYHDRDVWKPEPCRI
CVCDNGKVLCDDVICDETKNCPGAEVPEGECCPVCPDGSESPTDQETTGVEGPKGDTGPR
GPRGPAGPPGRDGIPGQPGLPGPPGPPGPPGPPGLGGNFAPQLSYGYDEKSTGGISVPGP
MGPSGPRGLPGPPGAPGPQGFQGPPGEPGEPGASGPMGPRGPPGPPGKNGDDGEAGKPGR
PGERGPPGPQGARGLPGTAGLPGMKGHRGFSGLDGAKGDAGPAGPKGEPGSPGENGAPGQ
MGPRGLPGERGRPGAPGPAGARGNDGATGAAGPPGPTGPAGPPGFPGAVGAKGEAGPQGP
RGSEGPQGVRGEPGPPGPAGAAGPAGNPGADGQPGAKGANGAPGIAGAPGFPGARGPSGP
QGPGGPPGPKGNSGEPGAPGSKGDTGAKGEPGPVGVQGPPGPAGEEGKRGARGEPGPTGL
PGPPGERGGPGSRGFPGADGVAGPKGPAGERGSPGPAGPKGSPGEAGRPGEAGLPGAKGL
TGSPGSPGPDGKTGPPGPAGQDGRPGPPGPPGARGQAGVMGFPGPKGAAGEPGKAGERGV
PGPPGAVGPAGKDGEAGAQGPPGPAGPAGERGEQGPAGSPGFQGLPGPAGPPGEAGKPGE
QGVPGDLGAPGPSGARGERGFPGERGVQGPPGPAGPRGANGAPGNDGAKGDAGAPGAPGS
QGAPGLQGMPGERGAAGLPGPKGDRGDAGPKGADGSPGKDGVRGLTGPIGPPGPAGAPGD
KGESGPSGPAGPTGARGAPGDRGEPGPPGPAGFAGPPGADGQPGAKGEPGDAGAKGDAGP
PGPAGPAGPPGPIGNVGAPGAKGARGSAGPPGATGFPGAAGRVGPPGPSGNAGPPGPPGP
AGKEGGKGPRGETGPAGRPGEVGPPGPPGPAGEKGSPGADGPAGAPGTPGPQGIAGQRGV
VGLPGQRGERGFPGLPGPSGEPGKQGPSGASGERGPPGPMGPPGLAGPPGESGREGAPGA
EGSPGRDGSPGAKGDRGETGPAGPPGAPGAPGAPGPVGPAGKSGDRGETGPAGPTGPVGP
VGARGPAGPQGPRGDKGETGEQGDRGIKGHRGFSGLQGPPGPPGSPGEQGPSGASGPAGP
RGPPGSAGAPGKDGLNGLPGPIGPPGPRGRTGDAGPVGPPGPPGPPGPPGPPSAGFDFSF
LPQPPQEKAHDGGRYYRADDANVVRDRDLEVDTTLKSLSQQIENIRSPEGSRKNPARTCR
DLKMCHSDWKSGEYWIDPNQGCNLDAIKVFCNMETGETCVYPTQPSVAQKNWYISKNPKD
KRHVWFGESMTDGFQFEYGGQGSDPADVAIQLTFLRLMSTEASQNITYHCKNSVAYMDQQ
TGNLKKALLLQGSNEIEIRAEGNSRFTYSVTVDGCTSHTGAWGKTVIEYKTTKTSRLPII
DVAPLDVGAPDQEFGFDVGPVCFL
")
aa_UniProt <- rbind(aa_ALAT1, aa_CO1A1)
aa_UniProt$abbrv <- c("ALAT1", "CO1A1")

## ----aa_UniProt, cache=TRUE---------------------------------------------------
aa_UniProt

## ----protein_length-----------------------------------------------------------
myaa <- rbind(aa_YML020W, aa_Ef, aa_PRIO)
protein.length(myaa)

## ----add_protein--------------------------------------------------------------
add.protein(myaa)

## ----subcrt_PRIO, message=FALSE-----------------------------------------------
subcrt("PRIO_HUMAN", T = 25)

## ----basis_CHNOS, results="hide"----------------------------------------------
basis("CHNOS")

## ----YML020W_affinity, message=FALSE------------------------------------------
species("YML020W_Sce")
a <- affinity()

## ----affinity_iprotein, message=FALSE-----------------------------------------
ip <- add.protein(aa_UniProt)
a <- affinity(iprotein = ip)

## ----bison_transferase, fig.margin=TRUE, fig.width=4, fig.height=4, small.mar=TRUE, dpi=dpi, out.width="100%", echo=FALSE, results="hide", message=FALSE, fig.cap='Potential diagram for metagenomically identified sequences of transferases in Bison Pool hot spring. See also the vignette [<span style="color:blue">*Hot-spring proteins in CHNOSZ*</span>](hotspring.pdf).', cache=TRUE, pngquant=pngquant, timeit=timeit----
file <- system.file("extdata/protein/DS11.csv", package = "CHNOSZ")
aa <- read.csv(file, as.is = TRUE)
aa <- aa[grep("transferase", aa$protein), ]
ip <- add.protein(aa)
basis(c("HCO3-", "H2O", "NH3", "HS-", "H2", "H+"))
basis(c("HCO3-", "NH3", "HS-", "H+"), c(-3, -4, -7, -7.9))
T <- c(50, 100)
res <- 300
a <- affinity(T = c(T, res), H2 = c(-8, -3, res), iprotein = ip)
fill <- ZC.col(ZC(protein.formula(ip)))
diagram(a, normalize = TRUE, fill = fill, names = 1:5)
T <- c(93.3, 79.4, 67.5, 65.3, 57.1)
logaH2 <- c(-3.38, -4.14, -5.66, -7.47, -10.02)
lines(T, logaH2, lty = 2, lwd = 2)
points(T, logaH2, pch = 21, bg = "white", cex = 1.5)

## ----bison_transferase, eval=FALSE, echo=1:11---------------------------------
#  file <- system.file("extdata/protein/DS11.csv", package = "CHNOSZ")
#  aa <- read.csv(file, as.is = TRUE)
#  aa <- aa[grep("transferase", aa$protein), ]
#  ip <- add.protein(aa)
#  basis(c("HCO3-", "H2O", "NH3", "HS-", "H2", "H+"))
#  basis(c("HCO3-", "NH3", "HS-", "H+"), c(-3, -4, -7, -7.9))
#  T <- c(50, 100)
#  res <- 300
#  a <- affinity(T = c(T, res), H2 = c(-8, -3, res), iprotein = ip)
#  fill <- ZC.col(ZC(protein.formula(ip)))
#  diagram(a, normalize = TRUE, fill = fill, names = 1:5)
#  T <- c(93.3, 79.4, 67.5, 65.3, 57.1)
#  logaH2 <- c(-3.38, -4.14, -5.66, -7.47, -10.02)
#  lines(T, logaH2, lty = 2, lwd = 2)
#  points(T, logaH2, pch = 21, bg = "white", cex = 1.5)

## ----bison_transferase, eval=FALSE, echo=12:15--------------------------------
#  file <- system.file("extdata/protein/DS11.csv", package = "CHNOSZ")
#  aa <- read.csv(file, as.is = TRUE)
#  aa <- aa[grep("transferase", aa$protein), ]
#  ip <- add.protein(aa)
#  basis(c("HCO3-", "H2O", "NH3", "HS-", "H2", "H+"))
#  basis(c("HCO3-", "NH3", "HS-", "H+"), c(-3, -4, -7, -7.9))
#  T <- c(50, 100)
#  res <- 300
#  a <- affinity(T = c(T, res), H2 = c(-8, -3, res), iprotein = ip)
#  fill <- ZC.col(ZC(protein.formula(ip)))
#  diagram(a, normalize = TRUE, fill = fill, names = 1:5)
#  T <- c(93.3, 79.4, 67.5, 65.3, 57.1)
#  logaH2 <- c(-3.38, -4.14, -5.66, -7.47, -10.02)
#  lines(T, logaH2, lty = 2, lwd = 2)
#  points(T, logaH2, pch = 21, bg = "white", cex = 1.5)

## ----smoker_vars--------------------------------------------------------------
vars <- list(O2 = c(-50, -25), NH3 = c(-15, 10), H2O = c(-15, 10))

## ----smoker_aa, message=FALSE-------------------------------------------------
aa <- c("D", "T", "S", "E", "G", "A", "K", "H")
AA <- aminoacids("", aa)
AA.formula <- do.call(rbind, makeup(info(AA)))
AA

## ----smoker_uM----------------------------------------------------------------
uM <- c(1.10, 0.70, 3.73, 0.39, 3.04, 1.83, 0.27, 0.21)
loga2 <- log10(uM * 1e-6)
nC <- AA.formula[, "C"]
Ctot <- sum(nC * uM * 1e-6)

## ----smoker_basis, results="hide"---------------------------------------------
basis("CHNOS")
species(AA)
T <- 270
res <- 64
objective <- "RMSD"

## ----smoker_plot, eval=FALSE, echo=1:6----------------------------------------
#  layout(matrix(1:6, nrow = 2))
#  a <- affinity(O2 = c(vars[[1]], res), T = T)
#  e <- equilibrate(a, loga.balance = log10(Ctot))
#  r <- revisit(e, objective, loga2)
#  d.basis <- describe.basis(ibasis = 1:4)
#  legend("topleft", d.basis)
#  ourfun <- function(ibasis = 1:5, x = "bottomright") {
#    a <- affinity(T = T)
#    e <- equilibrate(a, loga.balance = log10(Ctot))
#    revisit(e, objective, loga2, cex = 2.7, pch = 21)
#    text(loga2, unlist(e$loga.equil), aa)
#    d.basis <- describe.basis(ibasis = ibasis)
#    legend(x, d.basis)
#  }
#  basis("O2", r$xopt)
#  ourfun(5)
#  a <- affinity(O2 = c(vars[[1]], res), NH3 = c(vars[[2]], res), T = T)
#  e <- equilibrate(a, loga.balance = log10(Ctot))
#  r <- revisit(e, objective, loga2)
#  basis("O2", r$xopt)
#  basis("NH3", r$yopt)
#  ourfun(c(3, 5))
#  findit(vars[1:3], objective, loga2 = loga2, loga.balance = log10(Ctot),
#         T = T, res = 8, niter = 3, rat = 0.6)
#  ourfun(c(2, 3, 5), "right")

## ----smoker_plot, eval=FALSE, echo=7:14---------------------------------------
#  layout(matrix(1:6, nrow = 2))
#  a <- affinity(O2 = c(vars[[1]], res), T = T)
#  e <- equilibrate(a, loga.balance = log10(Ctot))
#  r <- revisit(e, objective, loga2)
#  d.basis <- describe.basis(ibasis = 1:4)
#  legend("topleft", d.basis)
#  ourfun <- function(ibasis = 1:5, x = "bottomright") {
#    a <- affinity(T = T)
#    e <- equilibrate(a, loga.balance = log10(Ctot))
#    revisit(e, objective, loga2, cex = 2.7, pch = 21)
#    text(loga2, unlist(e$loga.equil), aa)
#    d.basis <- describe.basis(ibasis = ibasis)
#    legend(x, d.basis)
#  }
#  basis("O2", r$xopt)
#  ourfun(5)
#  a <- affinity(O2 = c(vars[[1]], res), NH3 = c(vars[[2]], res), T = T)
#  e <- equilibrate(a, loga.balance = log10(Ctot))
#  r <- revisit(e, objective, loga2)
#  basis("O2", r$xopt)
#  basis("NH3", r$yopt)
#  ourfun(c(3, 5))
#  findit(vars[1:3], objective, loga2 = loga2, loga.balance = log10(Ctot),
#         T = T, res = 8, niter = 3, rat = 0.6)
#  ourfun(c(2, 3, 5), "right")

## ----smoker_plot, eval=FALSE, echo=15:16--------------------------------------
#  layout(matrix(1:6, nrow = 2))
#  a <- affinity(O2 = c(vars[[1]], res), T = T)
#  e <- equilibrate(a, loga.balance = log10(Ctot))
#  r <- revisit(e, objective, loga2)
#  d.basis <- describe.basis(ibasis = 1:4)
#  legend("topleft", d.basis)
#  ourfun <- function(ibasis = 1:5, x = "bottomright") {
#    a <- affinity(T = T)
#    e <- equilibrate(a, loga.balance = log10(Ctot))
#    revisit(e, objective, loga2, cex = 2.7, pch = 21)
#    text(loga2, unlist(e$loga.equil), aa)
#    d.basis <- describe.basis(ibasis = ibasis)
#    legend(x, d.basis)
#  }
#  basis("O2", r$xopt)
#  ourfun(5)
#  a <- affinity(O2 = c(vars[[1]], res), NH3 = c(vars[[2]], res), T = T)
#  e <- equilibrate(a, loga.balance = log10(Ctot))
#  r <- revisit(e, objective, loga2)
#  basis("O2", r$xopt)
#  basis("NH3", r$yopt)
#  ourfun(c(3, 5))
#  findit(vars[1:3], objective, loga2 = loga2, loga.balance = log10(Ctot),
#         T = T, res = 8, niter = 3, rat = 0.6)
#  ourfun(c(2, 3, 5), "right")

## ----smoker_plot, eval=FALSE, echo=17:22--------------------------------------
#  layout(matrix(1:6, nrow = 2))
#  a <- affinity(O2 = c(vars[[1]], res), T = T)
#  e <- equilibrate(a, loga.balance = log10(Ctot))
#  r <- revisit(e, objective, loga2)
#  d.basis <- describe.basis(ibasis = 1:4)
#  legend("topleft", d.basis)
#  ourfun <- function(ibasis = 1:5, x = "bottomright") {
#    a <- affinity(T = T)
#    e <- equilibrate(a, loga.balance = log10(Ctot))
#    revisit(e, objective, loga2, cex = 2.7, pch = 21)
#    text(loga2, unlist(e$loga.equil), aa)
#    d.basis <- describe.basis(ibasis = ibasis)
#    legend(x, d.basis)
#  }
#  basis("O2", r$xopt)
#  ourfun(5)
#  a <- affinity(O2 = c(vars[[1]], res), NH3 = c(vars[[2]], res), T = T)
#  e <- equilibrate(a, loga.balance = log10(Ctot))
#  r <- revisit(e, objective, loga2)
#  basis("O2", r$xopt)
#  basis("NH3", r$yopt)
#  ourfun(c(3, 5))
#  findit(vars[1:3], objective, loga2 = loga2, loga.balance = log10(Ctot),
#         T = T, res = 8, niter = 3, rat = 0.6)
#  ourfun(c(2, 3, 5), "right")

## ----smoker_plot, eval=FALSE, echo=23:25--------------------------------------
#  layout(matrix(1:6, nrow = 2))
#  a <- affinity(O2 = c(vars[[1]], res), T = T)
#  e <- equilibrate(a, loga.balance = log10(Ctot))
#  r <- revisit(e, objective, loga2)
#  d.basis <- describe.basis(ibasis = 1:4)
#  legend("topleft", d.basis)
#  ourfun <- function(ibasis = 1:5, x = "bottomright") {
#    a <- affinity(T = T)
#    e <- equilibrate(a, loga.balance = log10(Ctot))
#    revisit(e, objective, loga2, cex = 2.7, pch = 21)
#    text(loga2, unlist(e$loga.equil), aa)
#    d.basis <- describe.basis(ibasis = ibasis)
#    legend(x, d.basis)
#  }
#  basis("O2", r$xopt)
#  ourfun(5)
#  a <- affinity(O2 = c(vars[[1]], res), NH3 = c(vars[[2]], res), T = T)
#  e <- equilibrate(a, loga.balance = log10(Ctot))
#  r <- revisit(e, objective, loga2)
#  basis("O2", r$xopt)
#  basis("NH3", r$yopt)
#  ourfun(c(3, 5))
#  findit(vars[1:3], objective, loga2 = loga2, loga.balance = log10(Ctot),
#         T = T, res = 8, niter = 3, rat = 0.6)
#  ourfun(c(2, 3, 5), "right")

## ----smoker_plot, fig.fullwidth=TRUE, fig.width=9, fig.height=5, small.mar=TRUE, dpi=100, out.width="85%", echo=FALSE, message=FALSE, results="hide", cache=TRUE, fig.cap="Optimization of a thermodynamic model for relative abundances of amino acids in a 270 °C black smoker fluid using 1, 2, or 3 variables (left to right).", pngquant=pngquant, timeit=timeit----
layout(matrix(1:6, nrow = 2))
a <- affinity(O2 = c(vars[[1]], res), T = T)
e <- equilibrate(a, loga.balance = log10(Ctot))
r <- revisit(e, objective, loga2)
d.basis <- describe.basis(ibasis = 1:4)
legend("topleft", d.basis)
ourfun <- function(ibasis = 1:5, x = "bottomright") {
  a <- affinity(T = T)
  e <- equilibrate(a, loga.balance = log10(Ctot))
  revisit(e, objective, loga2, cex = 2.7, pch = 21)
  text(loga2, unlist(e$loga.equil), aa)
  d.basis <- describe.basis(ibasis = ibasis)
  legend(x, d.basis)
}
basis("O2", r$xopt)
ourfun(5)
a <- affinity(O2 = c(vars[[1]], res), NH3 = c(vars[[2]], res), T = T)
e <- equilibrate(a, loga.balance = log10(Ctot))
r <- revisit(e, objective, loga2)
basis("O2", r$xopt)
basis("NH3", r$yopt)
ourfun(c(3, 5))
findit(vars[1:3], objective, loga2 = loga2, loga.balance = log10(Ctot),
       T = T, res = 8, niter = 3, rat = 0.6)
ourfun(c(2, 3, 5), "right")

## ----thermo_refs_table, eval=FALSE--------------------------------------------
#  thermo.refs()  ## shows table in a browser

## ----width180, include=FALSE------------------------------------------------------------------------------------------------------------------------------------------------------
options(width = 180)

## ----thermo_refs_numeric----------------------------------------------------------------------------------------------------------------------------------------------------------
iATP <- info("ATP-4")
iMgATP <- info("MgATP-2")
thermo.refs(c(iATP, iMgATP))

## ----thermo_refs_character--------------------------------------------------------------------------------------------------------------------------------------------------------
thermo.refs(c("HDNB78", "MGN03"))

## ----thermo_refs_subcrt, message=FALSE--------------------------------------------------------------------------------------------------------------------------------------------
substuff <- subcrt(c("C2H5OH", "O2", "CO2", "H2O"), c(-1, -3, 2, 3))
thermo.refs(substuff)

## ----width80, include=FALSE---------------------------------------------------
options(width = 80)

## ----thermo_refs_browse, eval=FALSE-------------------------------------------
#  iFo <- info("forsterite")
#  ref <- thermo.refs(iFo)
#  browseURL(ref$URL)  ## opens a link to worldcat.org

## ----BZA10, echo=1:2----------------------------------------------------------
file <- system.file("extdata/thermo/BZA10.csv", package = "CHNOSZ")
read.csv(file, as.is = TRUE)

## ----mod_obigt_S3_ghs, echo=1:2-----------------------------------------------
mod.obigt("S3-", formula = "S3-", state = "aq", ref1 = "PD15", date = today(),
          G = 13160, H = 10840, S = 28.6, Cp = 62.3, V = 37.7)

## ----mod_obigt_S3_eos, echo=1:2-----------------------------------------------
mod.obigt("S3-", state = "aq", a1 = 2.5, a2 = 19.9, a3 = 9.2, a4 = -3.6,
          c1 = 50.2, c2 = 9.6, omega = 0.8, z = -1)

## ----S3_reaction, message=FALSE-----------------------------------------------
basis(c("S3-", "O2", "H2O", "H+"), c("aq", "gas", "liq", "aq"))
subcrt(c("H2S", "SO4-2"), c(-2, -1), T = c(25, 500), P = c(1, 700))

## ----info_S3------------------------------------------------------------------
iS3 <- info("S3-")
info(iS3)

## ----info_cyclohexane, message=FALSE, results="hide"--------------------------
info(info("cyclohexane"))
## checkEOS: Cp of cyclohexane aq (1762) differs by 9.35 cal K-1 mol-1 from tabulated value
## checkEOS: V of cyclohexane aq (1762) differs by 6.64 cm3 mol-1 from tabulated value

## ----check_obigt--------------------------------------------------------------
file <- system.file("extdata/thermo/obigt_check.csv", package = "CHNOSZ")
dat <- read.csv(file, as.is = TRUE)
nrow(dat)

## ----affinity_error, error=TRUE, message=FALSE, results="hide"----------------
basis("CHNOS")
aa <- c("D", "T", "S", "E", "G", "A", "K", "H")
species(aminoacids("", aa))
a <- affinity(O2 = seq(-80, -50), T = seq(0, 100))

## ----message_example, results="hide"------------------------------------------
a <- affinity(O2 = seq(-80, -50, length.out = 101), T = seq(0, 100))
e <- equilibrate(a)
#diagram(e, alpha=TRUE, legend.x=NA)

## ----message_subcrt, results="hide"-------------------------------------------
subcrt(c("C2H5OH", "O2", "CO2", "H2O"), c(-1, -3, 2, 3))

## ----equilibrate_error, error=TRUE, results="hide", warning=FALSE-------------
basis("QEC")
species(aminoacids("", aa))
a <- affinity()
e <- equilibrate(a)
## Warning in logafun(logactfun(Abar, i)): NaNs produced

## ----file_tests, eval=FALSE---------------------------------------------------
#  system.file("tests/testthat/", package = "CHNOSZ")

## ----test_package, eval=FALSE-------------------------------------------------
#  test_package("CHNOSZ")

## ----citation_CHNOSZ, results="asis"------------------------------------------
cref <- citation("CHNOSZ")
print(cref, style = "html")

## ----maintainer_CHNOSZ--------------------------------------------------------
maintainer("CHNOSZ")

## ----file_edit_anintro, eval=FALSE--------------------------------------------
#  file.edit(system.file("doc/anintro.Rmd", package = "CHNOSZ"))

## ----the_end------------------------------------------------------------------
   ######    ##   ##    ##   ##    ######     #####  #####
 ##         ##===##    ## \\##   ##    ##     \\       //
 ######    ##   ##    ##   ##    ######    #####      #####

## ----sessionInfo--------------------------------------------------------------
sessionInfo()

