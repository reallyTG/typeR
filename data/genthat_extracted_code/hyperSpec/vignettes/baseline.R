### R code from vignette source 'baseline.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: startup
###################################################
#system ("mkdir fig")
options(SweaveHooks=list(fig=function() {
  par(mar = c (4.1, 4.1, 1, .6))

  trellis.pars <- trellis.par.get ("layout.heights")
  trellis.pars [grep ("padding", names (trellis.pars))] <- 0
  trellis.par.set(layout.heights = trellis.pars)

  trellis.pars <- trellis.par.get ("layout.widths")
  trellis.pars [grep ("padding", names (trellis.pars))] <- 0
  trellis.par.set(layout.widths = trellis.pars)
}))
options ("width" = 100, "digits" = 5)
library (hyperSpec)

# redefine lattice functions so that the result is printed without external print command
setMethod ("plot",
           signature (x = "hyperSpec", y = "character"),
           function (x, y, ...){
             tmp <- hyperSpec:::.plot (x, y, ...)
             if (is (tmp, "trellis"))
               print (tmp)
             invisible (tmp)
           })


plotmap <- function (...) print (hyperSpec:::plotmap (...))

setMethod ("levelplot", signature (x = "hyperSpec", data = "missing"),
   function (x, data, ...) {
	   l <- hyperSpec:::.levelplot (x = formula (spc ~ x * y), data = x, ...)
		print (l)
	}
)

setMethod ("levelplot", signature (x = "formula", data = "hyperSpec"),
   function (x, data, ...) print (hyperSpec:::.levelplot (x, data, ...))
)

plotc <- function (...){
   call <- match.call ()
   call [[1]] <- hyperSpec:::plotc
   print (eval (call))
}

ploterrormsg <- function (fn, pkg) {
  plot (0, 0, type = "n", axes = FALSE, bty = "n", xlab = "", ylab = "")
  text (0, 0, paste ("Function", fn, "not available:\npackage", pkg, "needed."))
}
griderrormsg <- function (fn, pkg) {
  require (grid)
  grid.text (label = paste ("Function", fn, "not available:\npackage", pkg, "needed."))
  NA
}
texterrormsg <- function (fn, pkg) {
  cat ("Function", fn, "not available:\npackage", pkg, "needed.\n")
}

nice.paste <- function (...){
  fnames <- c (...)

  if (length (fnames) == 2L)
    fnames <- paste (fnames, collapse = " and ")
  if (length (fnames) > 1L){
    fnames [length (fnames)] <- paste ("and", tail (fnames, 1))
    fnames <- paste (fnames, collapse = ", ")
  }

  fnames
}

check.req.pkg <- function (pkg = stop ("pkg needed"),
                           texterrors = NULL, ploterrors = NULL, griderrors = NULL,
                           hynstext = NULL, hynsplot = NULL, hynsgrid = NULL,
                           donothing = NULL, special = NULL, v = TRUE){
  if (v) cat ("\\item[\\Rpackage{", pkg, "}:] ", sep = "")

  dummies <- list ()

  if (pkg.exists (pkg)){
    if (v) cat ("available\n")
  } else {
    for (fn in as.character (texterrors))
      dummies <- c (dummies, bquote (.(fn) <- function (...) texterrormsg (.(fn), .(pkg))))
    for (fn in as.character (ploterrors))
      dummies <- c (dummies, bquote (.(fn) <- function (...) ploterrormsg (.(fn), .(pkg))))
    for (fn in as.character (griderrors))
      dummies <- c (dummies, bquote (.(fn) <- function (...) griderrormsg (.(fn), .(pkg))))

    for (fn in as.character (hynstext))
      assignInNamespace (x = fn,
                         value = eval (bquote (function (...) texterrormsg (.(fn), .(pkg)))),
                         ns = "hyperSpec")
    for (fn in as.character (hynsplot))
      assignInNamespace (x = fn,
                         value = eval (bquote (function (...) ploterrormsg (.(fn), .(pkg)))),
                         ns = "hyperSpec")
    for (fn in as.character (hynsgrid))
      assignInNamespace (x = fn,
                         value = eval (bquote (function (...) griderrormsg (.(fn), .(pkg)))),
                         ns = "hyperSpec")

    fnames <- nice.paste (texterrors, ploterrors, griderrors, hynstext, hynsplot, hynsgrid, names (special))
    if (v && length (fnames) > 0L) cat (fnames, "replaced.")

    for (fn in as.character (donothing))
      dummies <- c (dummies, bquote (.(fn) <- function (...) invisible (NULL)))

    fnames <- nice.paste (donothing)
    if (v && length (fnames) > 0L) cat (fnames, "missing.")

    if (v) cat ("\n")
  }

  invisible (dummies)
}

plotvoronoi <- function (...) print (hyperSpec:::plotvoronoi (...))

# set standardized color palettes
seq.palette <- colorRampPalette (c ("white", "dark green"), space = "Lab")

YG.palette <- function (n = 20) rgb (colorRamp (c("#F7FCF5", "#E5F5E0", "#C7E9C0", "#A1D99B", "#74C476",
                                             "#41AB5D", "#238B45", "#006D2C", "#00441B"), space = "Lab")
                                # was: brewer.pal (9, "Greens")
                                (seq (1/3, 1, length.out = n)^2), maxColorValue = 255)


div.palette <- colorRampPalette (c("#00008B", "#351C96", "#5235A2", "#6A4CAE", "#8164BA", "#967CC5",
                                   "#AC95D1", "#C1AFDC", "#D5C9E8", "#E0E3E3", "#F8F8B0", "#F7E6C2",
											  "#EFCFC6", "#E6B7AB", "#DCA091", "#D08977", "#C4725E", "#B75B46",
											  "#A9432F", "#9A2919", "#8B0000"), space = "Lab")

pkgSuggests <- function (...)
  strsplit (packageDescription (..., fields="Suggests"), ",\\s*")[[1]]

pkg.exists <- function (pkg = stop ("package name needed"), lib.loc = NULL){
  dir <- sapply (pkg, function (p) system.file (package = p, lib.loc = lib.loc))
  nzchar (dir) > 0L
}

is.basepkg <- function (pkg){
  pkg.exists (pkg) && grepl ("^base$", packageDescription (pkg, fields = "Priority"))
}

pkg.or.base <- function (pkg){
  pkg [sapply (pkg, is.basepkg)] <- "base"

  pkg
}

citation.or.file <- function (pkg, svd.cit = sprintf ("%s.CITATION", pkg)){
  if (pkg.exists (pkg))
    citation (pkg)
  else if (file.exists (svd.cit))
    readCitationFile (file = svd.cit)
  else
    NULL
}

make.cite.keys <- function (pkg, entries){
  pkg <- pkg.or.base (pkg)

  if (! pkg.exists (pkg))
    return (pkg)

  if (missing (entries))
    entries <- citation.or.file (pkg)

  keys <- sapply (unclass (entries), attr, "key")

  noname <- which (sapply (keys, is.null))

  if (length (keys) == 1L && noname == 1L) {
    keys <- pkg
  } else {
    for (i in noname)
      keys [[i]] <- paste (pkg, i, sep = ".")
  }

  keys <- make.unique (unlist (keys))

  keys
}

citation.with.key <- function (pkg = "base"){
  pkg <- pkg.or.base (pkg)

  tmp <- citation.or.file (pkg)

  keys <- make.cite.keys (pkg, tmp)

  for (entry in seq_along (tmp))
    tmp [entry]$"key" <- keys [[entry]]

  tmp
}

cite.pkg <- function (p, entries, citefun = "cite"){
  paste ("\\\\", citefun, "{", paste (make.cite.keys (p, entries), collapse = ", "), "}", sep = "")
}

make.bib <- function (..., file = NULL) {
  pkg <- c (...)

  if (length (pkg) == 0L) {
    pkg <- loadedNamespaces()

    pkg <- unique (pkg.or.base (pkg))
  }

  l <- lapply (pkg, citation.with.key)
  l <- do.call ("c", l [! sapply (l, is.null)])

  if (!is.null (file))
    if (is.null (l))
      cat (NULL, file = file)           # touches file
    else
      cat (toBibtex (l), file = file, sep = "\n")

  invisible (l)
}



###################################################
### code chunk number 2: mailme
###################################################
cat ("\\newcommand{\\mailme}{\\href{mailto:",
     maintainer ("hyperSpec"),
	  "}{\\texttt{",
	  maintainer ("hyperSpec"),
	  "}}}\n",
	  sep = "")


###################################################
### code chunk number 3: listfunctions
###################################################
texListFun <- function (pattern){
  funs <- ls (envir = getNamespace ("hyperSpec"), pattern = pattern)
  funs <- paste ("\\\\Rfunction{", funs, "}", sep ="")
  nice.paste (funs)
}


###################################################
### code chunk number 4: cleanup (eval = FALSE)
###################################################
## sessionInfo ()
## rm (list = ls ())
## library (tools)


###################################################
### code chunk number 5: classical-bl
###################################################
getOption("SweaveHooks")[["fig"]]()
bl <- spc.fit.poly (chondro [c (1, 101),, c (633, 1788)], chondro [c (1, 101)])

plot (chondro [c (1, 101)], plot.args = list (ylim = c(200, 600)), col = 1 : 2)
plot (chondro [c (1, 101),, c(633, 1788)], add = TRUE, col = 1:2, 
      lines.args = list (type = "p", pch = 20))
plot (bl, add = TRUE, col = 1 : 2)


###################################################
### code chunk number 6: fig1
###################################################
getOption("SweaveHooks")[["fig"]]()
bl <- spc.fit.poly.below (chondro [1], poly.order = 1, max.iter = 8, npts.min = 2, debuglevel = 3L)


###################################################
### code chunk number 7: figspcrange
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (chondro [3,,1700 ~ 1750], lines.args = list(type = "b"), plot.args = list (ylim = range (chondro [3,,1700 ~ 1750]) + c(-50, 0)))
bl <- spc.fit.poly.below (chondro [3,,1700 ~ 1750], NULL, poly.order = 1)
abline (bl[[]], col ="black")

plot (chondro [3,,1720 ~ 1750], lines.args = list(type = "p", pch = 19, cex = .6), col = "blue", add=T)
bl <- spc.fit.poly.below (chondro [3,,1720 ~ 1750], NULL, poly.order = 1)
abline (bl[[]], col ="blue")


###################################################
### code chunk number 8: fit-apply
###################################################
system.time (spc.fit.poly.below (chondro, NULL, npts.min = 20))
system.time (spc.fit.poly.below (chondro [,, c (min ~ 700, 1700 ~ max)], NULL, npts.min = 20))


###################################################
### code chunk number 9: figorder0
###################################################
getOption("SweaveHooks")[["fig"]]()
bl <- spc.fit.poly.below (chondro [1], poly.order = 0, debuglevel = 2, max.iter = 5)


###################################################
### code chunk number 10: figorder1
###################################################
getOption("SweaveHooks")[["fig"]]()
bl <- spc.fit.poly.below (chondro [1], poly.order = 1, debuglevel = 2, max.iter = 5)


###################################################
### code chunk number 11: figorder2
###################################################
getOption("SweaveHooks")[["fig"]]()
bl <- spc.fit.poly.below (chondro [1], poly.order = 2, debuglevel = 2, max.iter = 5)


###################################################
### code chunk number 12: fig3
###################################################
getOption("SweaveHooks")[["fig"]]()
spc <- new ("hyperSpec", spc = matrix (rnorm (100, mean = 100, sd = 2), ncol = 100))
noise = 4
spc.fit.poly.below (spc, poly.order = 0, noise = noise, debuglevel = 2)
plot (spc.fit.poly.below (spc, poly.order = 0), col = "black", add = T)


###################################################
### code chunk number 13: fig4
###################################################
getOption("SweaveHooks")[["fig"]]()
bl <- spc.fit.poly.below (chondro [1], poly.order = 1, noise = 15, max.iter = 8, debuglevel = 3L)


###################################################
### code chunk number 14: baseline.Rnw:263-264
###################################################
bl <- spc.rubberband (paracetamol [,, 175 ~ 1800], noise = 300, df = 20)


###################################################
### code chunk number 15: rubberband-raw
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (paracetamol [,, 175 ~ 1800])
plot (bl, add = TRUE, col = 2)


###################################################
### code chunk number 16: rubberband
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (paracetamol [,, 175 ~ 1800] - bl)


###################################################
### code chunk number 17: bent-rubberband
###################################################
bend <- 5e4 * wl.eval (paracetamol [,, 175 ~ 1800], function (x) x^2, normalize.wl=normalize01)
bl <- spc.rubberband (paracetamol [,, 175 ~ 1800] + bend) - bend


###################################################
### code chunk number 18: rubberband-bent-raw
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (paracetamol [,, 175 ~ 1800] + bend)
plot (bl + bend, add = T, col = 2)


###################################################
### code chunk number 19: rubberband-bent-corrected
###################################################
getOption("SweaveHooks")[["fig"]]()
plot (paracetamol [,, 175 ~ 1800] - bl)


###################################################
### code chunk number 20: baseline.Rnw:314-316
###################################################
make.bib ("baseline", file = "baseline-pkg.bib")
sessionInfo ()
rm (list = ls ())
library (tools)


