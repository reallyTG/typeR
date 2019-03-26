## ---- results = "asis", echo = FALSE------------------------------------------

# output format should be of the form
#> output
#> output
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

# initialize: load library, make everything deterministic
library("mlrCPO")
set.seed(123)

# get the path of the parent document
# path = names(knitr::opts_knit$get("encoding"))[1]
base = knitr::opts_knit$get("output.dir")
file = sys.frame(min(grep("knit", sapply(sys.calls(), function(x) as.character(x)[1]))))$input
path = file.path(base, file)
rpath = gsub("\\.[^.]*$", ".R", path)

# strip whitespace from lines in tangle (R file) output for lintr
knitr::knit_hooks$set(document = function(x) {
  if (file_test("-f", rpath)) {
    lines = readLines(rpath)
    lines = gsub(" *(\n|$)", "\\1", lines)
    cat(lines, file = rpath, sep = "\n", append = FALSE)
  }
  x
})

#############################
# do the trans-vignette ToC #
#############################
fullfile = file

allfiles = list.files(path = base, pattern = ".*\\.Rmd$")
stopifnot(file %in% allfiles)

# collect information (title, url, main / compact) for each file in vignette dir
fileinfolist = list()
for (cf in allfiles) {
  ismain = TRUE
  if (grepl("^z_", cf)) {
    infoslot = gsub("^z_", "", cf)
    infoslot = gsub("_terse\\.Rmd$", "", infoslot)
    subslot = "compact"
  } else {
    infoslot = gsub("^a_", "", cf)
    infoslot = gsub("\\.Rmd$", "", infoslot)
    subslot = "main"
  }

  content = scan(paste(base, cf, sep = "/"), what = "character", quiet = TRUE)
  pos = min(c(which(content == "title:"), Inf))
  if (is.infinite(pos)) {
    stop(sprintf("parsing error: %s", cf))
  }
  infolist = list(title = content[pos + 1], url = cf, iscurrent = cf == file)

  applist = list(infolist)
  names(applist) = subslot
  fileinfolist[[infoslot]] = c(fileinfolist[[infoslot]], applist)
}

# helper function that creates a link for all files except the current one
linkify = function(info, title) {
  if (info$iscurrent) {
    title
  } else {
    sprintf("[%s](%s)", title, gsub("\\.Rmd$", ".html", info$url))
  }
}

# output ToC
for (idx in seq_along(fileinfolist)) {
  content = fileinfolist[[sort(names(fileinfolist))[idx]]]
  if (!is.null(content$compact)) {
    if (paste(content$main$title, "(No Output)") != content$compact$title) {
      stop(sprintf("File %s and its compact version %s have incompatible titles\nThe compact version must be paste(main_title, \"(No Output)\")",
        content$main$url, content$compact$url))
    }
    line = sprintf("%s (%s)", linkify(content$main, content$main$title), linkify(content$compact, "compact version"))
  } else {
    line = linkify(content$main, content$main$title)
  }
  cat(sprintf("%s. %s\n", idx, line))
  if (content$main$iscurrent || content$compact$iscurrent) {
    fullfile = content$main$url
  }
}

fullpath = file.path(base, fullfile)

#############################
# Optional Document TOC     #
#############################

# print everything up to level `print.level`.
# level is the number of '#' prefixes. The lowest level is usually 2.
printToc = function(print.level = 3) {
  owncontent = readLines(fullpath)
  tripletic = grepl("^```", owncontent)
  owncontent = owncontent[cumsum(tripletic) %% 2 == 0]  # exclude ```-delimited code
  headlines = grep("^#+ +", owncontent, value = TRUE)
  headlevels = nchar(gsub(" .*", "", headlines))
  headlines = gsub("^[#]+ +", "", headlines)

  links = gsub("[^-a-z. ]", "", tolower(headlines))
  links = gsub(" +", "-", links)
  links = gsub("-$", "", links)

  if (!sum(headlevels <= print.level)) {
    return(invisible(NULL))
  }

  cat("<h", headlevels[1], ">Table of Contents</h", headlevels[1], ">\n<div id=\"TOC\">\n", sep = "")

  lastlevel = headlevels[1] - 1
  for (idx in seq_along(headlines)) {
    line = headlines[idx]
    level = headlevels[idx]
    link = links[idx]
    if (level > print.level) {
      next
    }
    if (level < headlevels[1]) {
      stop("First headline level must be the lowest one used, but '", line, "' is lower.")
    }
    lvldiff = level - lastlevel
    if (lvldiff > 1) {
      stop("Cannot jump headline levels. Error on: ", line)
    }
    if (lvldiff > 0) {
      # higher level -> open a <ul>
      cat("<ul>")
    } else {
      cat("</li>\n")
    }
    if (lvldiff < 0) {
      # lower level -> close a few <ul>
      for (l in seq_len(-lvldiff)) {
        cat("</ul></li>")
      }
    }
    cat("<li><a href=\"#", link, "\">", line, "</a>", sep = "")
    lastlevel = level
  }
  # if the last level is greater than the first level, close a few <ul>
  lvldiff = lastlevel - headlevels[1]

  cat("</li></ul>\n</div>\n")
}



#############################
# Some output settings      #
#############################

options(width = 80)


replaceprint = function(ofunc) {
  force(ofunc)
  function(x, ...) {
    cu = capture.output({ret = ofunc(x, ...)})
    cu = grep("time: [-+e0-9.]{1,6}", cu, value = TRUE, invert = TRUE)
    cat(paste(cu, collapse = "\n"))
    if (!grepl("\n$", tail(cu, 1))) {
      cat("\n")
    }
    ret
  }
}

for (pfunc in grep("print\\.", ls(asNamespace("mlr")), value = TRUE)) {
  ofunc = get(pfunc, asNamespace("mlr"))
  assign(pfunc, replaceprint(ofunc))
}



## ---- echo = FALSE------------------------------------------------------------
library("mlrCPO")

## ---- eval = FALSE------------------------------------------------------------
#  listCPO()[, c("name", "category", "subcategory")]

## ---- echo = FALSE, results = 'asis'------------------------------------------
tab = listCPO()[, c("name", "category", "subcategory")]
owncontent = readLines(path)
headlines = grep("^#+ +", owncontent, value = TRUE)
headlines = gsub("^#+ +", "", headlines)
tab[[1]] = sapply(tab[[1]], function(x)
  if (x %in% headlines) sprintf("[%s](#%s)", x, tolower(x)) else x)
knitr::kable(tab, "html")

## -----------------------------------------------------------------------------
NULLCPO
is.nullcpo(NULLCPO)
NULLCPO %>>% cpoScale()
NULLCPO %>>% NULLCPO
print(as.list(NULLCPO))
pipeCPO(list())

## -----------------------------------------------------------------------------
cpa = cpoWrap()
print(cpa, verbose = TRUE)
head(iris %>>% setHyperPars(cpa, wrap.cpo = cpoScale()))
head(iris %>>% setHyperPars(cpa, wrap.cpo = cpoPca()))
# attaching the cpo applicator to a learner gives this learner a "cpo" hyperparameter
# that can be set to any CPO.
getParamSet(cpoWrap() %>>% makeLearner("classif.logreg"))

## -----------------------------------------------------------------------------
cpm = cpoMultiplex(list(cpoScale, cpoPca))
print(cpm, verbose = TRUE)
head(iris %>>% setHyperPars(cpm, selected.cpo = "scale"))
# every CPO's Hyperparameters are exported
head(iris %>>% setHyperPars(cpm, selected.cpo = "scale", scale.center = FALSE))
head(iris %>>% setHyperPars(cpm, selected.cpo = "pca"))

## -----------------------------------------------------------------------------
s.and.p = cpoCase(pSS(logical.param: logical),
  export.cpos = list(cpoScale(),
  cpoPca()),
  cpo.build = function(data, target, logical.param, scale, pca) {
  if (logical.param || mean(data[[1]]) > 10) {
    scale %>>% pca
  } else {
    pca %>>% scale
  }
  })
print(s.and.p, verbose = TRUE)

## -----------------------------------------------------------------------------
scale = cpoScale(id = "scale")
scale.pca = scale %>>% cpoPca()
cbinder = cpoCbind(scaled = scale, pcad = scale.pca, original = NULLCPO)

## -----------------------------------------------------------------------------
# cpoCbind recognises that "scale.scale" happens before "pca.pca" but is also fed to the
# result directly. The summary draws a (crude) ascii-art graph.
print(cbinder, verbose = TRUE)
head(iris %>>% cbinder)

## -----------------------------------------------------------------------------
# the unnecessary copies of "Species" are unfortunate. Remove them with cpoSelect:
selector = cpoSelect(type = "numeric")
cbinder.select = cpoCbind(scaled = selector %>>% scale, pcad = selector %>>% scale.pca, original = NULLCPO)
cbinder.select
head(iris %>>% cbinder)

## -----------------------------------------------------------------------------
# alternatively, we apply the cbinder only to numerical data
head(iris %>>% cpoWrap(cbinder, affect.type = "numeric"))

## -----------------------------------------------------------------------------
cpo = cpoTransformParams(cpoPca(), alist(pca.scale = pca.center))
retr = pid.task %>|% setHyperPars(cpo, pca.center = FALSE)
getCPOTrainedState(retr)$control  # both 'center' and 'scale' are FALSE

## -----------------------------------------------------------------------------
mplx = cpoMultiplex(list(cpoIca(export = "n.comp"), cpoPca(export = "rank")))
!mplx
mtx = cpoTransformParams(mplx, alist(ica.n.comp = comp, pca.rank = comp),
  pSS(comp: integer[1, ]), list(comp = 1))
head(iris %>>% setHyperPars(mtx, selected.cpo = "ica", comp = 2))
head(iris %>>% setHyperPars(mtx, selected.cpo = "pca", comp = 3))

## -----------------------------------------------------------------------------
df = data.frame(a = 1:3, b = -(1:3) * 10)
df %>>% cpoScale()
df %>>% cpoScale(scale = FALSE)  # center = TRUE

## -----------------------------------------------------------------------------
df %>>% cpoPca()

## -----------------------------------------------------------------------------
head(iris %>>% cpoDummyEncode())
head(iris %>>% cpoDummyEncode(reference.cat = TRUE))

## -----------------------------------------------------------------------------
head(iris %>>% cpoSelect(pattern = "Width"))
# selection is additive
head(iris %>>% cpoSelect(pattern = "Width", type = "factor"))

## -----------------------------------------------------------------------------
head(iris) %>>% cpoDropConstants()  # drops 'species'
head(iris) %>>% cpoDropConstants(abs.tol = 0.2)  # also drops 'Petal.Width'

## -----------------------------------------------------------------------------
levels(iris$Species)

## -----------------------------------------------------------------------------
irisfix = head(iris) %>>% cpoFixFactors()  # Species only has level 'setosa' in train
levels(irisfix$Species)

## -----------------------------------------------------------------------------
rf = retrafo(irisfix)
iris[c(1, 100, 140), ]
iris[c(1, 100, 140), ] %>>% rf

## -----------------------------------------------------------------------------
impdata = df
impdata[[1]][1] = NA
impdata

## -----------------------------------------------------------------------------
impdata %>>% cpoMissingIndicators()
impdata %>>% cpoCbind(NULLCPO, dummy = cpoMissingIndicators())

## -----------------------------------------------------------------------------
head(iris %>>% cpoApplyFun(function(x) sqrt(x) - 10, affect.type = "numeric"))

## ---- echo = FALSE------------------------------------------------------------
set.seed(123)

## -----------------------------------------------------------------------------
head(iris[sample(nrow(iris), 10), ] %>>% cpoAsNumeric())

## -----------------------------------------------------------------------------
iris2 = iris
iris2$Species = factor(c("a", "b", "c", "b", "b", "c", "b", "c",
                        as.character(iris2$Species[-(1:8)])))
head(iris2, 10)
head(iris2 %>>% cpoCollapseFact(max.collapsed.class.prevalence = 0.2), 10)

## -----------------------------------------------------------------------------
head(iris %>>% cpoModelMatrix(~0 + Species:Petal.Width))
# use . + ... to retain originals
head(iris %>>% cpoModelMatrix(~0 + . + Species:Petal.Width))

## -----------------------------------------------------------------------------
head(iris %>>% cpoScaleRange(-1, 1))

## -----------------------------------------------------------------------------
head(iris %>>% cpoScaleMaxAbs(0.1))

## -----------------------------------------------------------------------------
head(iris %>>% cpoSpatialSign())

## -----------------------------------------------------------------------------
impdata %>>% cpoImpute(cols = list(a = imputeMedian()))

## ---- error = TRUE------------------------------------------------------------
impdata %>>% cpoImpute(cols = list(b = imputeMedian()))  # NAs remain
impdata %>>% cpoImputeAll(cols = list(b = imputeMedian()))  # error, since NAs remain

## ---- error = TRUE------------------------------------------------------------
missing.task = makeRegrTask("missing.task", impdata, target = "b")
# the following gives an error, since 'cpoImpute' does not make sure all missings are removed
# and hence does not add the 'missings' property.
train(cpoImpute(cols = list(a = imputeMedian())) %>>% makeLearner("regr.lm"), missing.task)

## -----------------------------------------------------------------------------
# instead, the following works:
train(cpoImputeAll(cols = list(a = imputeMedian())) %>>% makeLearner("regr.lm"), missing.task)

## -----------------------------------------------------------------------------
impdata %>>% cpoImputeConstant(10)
getTaskData(missing.task %>>% cpoImputeMedian())
# The specialised impute CPOs are:
listCPO()[listCPO()$category == "imputation" & listCPO()$subcategory == "specialised",
          c("name", "description")]

## -----------------------------------------------------------------------------
head(getTaskData(iris.task %>>% cpoFilterFeatures(method = "variance", perc = 0.5)))
head(getTaskData(iris.task %>>% cpoFilterVariance(perc = 0.5)))
# The specialised filter CPOs are:
listCPO()[listCPO()$category == "featurefilter" & listCPO()$subcategory == "specialised",
          c("name", "description")]

