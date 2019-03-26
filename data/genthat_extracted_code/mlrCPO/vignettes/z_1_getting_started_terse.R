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



## ---- eval = TRUE, echo = FALSE, results = 'asis'-----------------------------
printToc(4)

## -----------------------------------------------------------------------------
#  cpoScale  # a cpo constructor

## -----------------------------------------------------------------------------
#  cpoAddCols

## -----------------------------------------------------------------------------
#  cpoScale(center = FALSE)  # create a CPO object that scales, but does not center, data

## -----------------------------------------------------------------------------
#  cpoAddCols(Sepal.Area = Sepal.Length * Sepal.Width)  #  this would add a column

## -----------------------------------------------------------------------------
#  iris.demo = iris[c(1, 2, 3, 51, 52, 102, 103), ]
#  tail(iris.demo %>>% cpoQuantileBinNumerics())  # bin the data in below & above median

## -----------------------------------------------------------------------------
#  # first create three quantile bins, then as.numeric() all columns to
#  # get 1, 2 or 3 as the bin number
#  quantilenum = cpoQuantileBinNumerics(numsplits = 3) %>>% cpoAsNumeric()
#  iris.demo %>>% quantilenum

## -----------------------------------------------------------------------------
#  quantilenum.restricted = cpoQuantileBinNumerics(numsplits = 3) %>>%
#    cpoAsNumeric(affect.names = "Species", affect.invert = TRUE)
#  iris.demo %>>% quantilenum.restricted

## -----------------------------------------------------------------------------
#  demo.task = makeClassifTask(data = iris.demo, target = "Species")
#  result = demo.task %>>% quantilenum
#  getTaskData(result)

## -----------------------------------------------------------------------------
#  cpo = cpoScale()
#  cpo

## -----------------------------------------------------------------------------
#  getHyperPars(cpo)  # list of parameter names and values

## -----------------------------------------------------------------------------
#  getParamSet(cpo)  # more detailed view of parameters and their type / range

## -----------------------------------------------------------------------------
#  !cpo  # equivalent to print(cpo, verbose = TRUE)

## -----------------------------------------------------------------------------
#  cpo2 = setHyperPars(cpo, scale.scale = FALSE)
#  cpo2

## -----------------------------------------------------------------------------
#  iris.demo %>>% cpo  # scales and centers

## -----------------------------------------------------------------------------
#  iris.demo %>>% cpo2 # only centers

## -----------------------------------------------------------------------------
#  cpo = cpoScale(id = "a") %>>% cpoScale(id = "b")  # not very useful example
#  getHyperPars(cpo)

## -----------------------------------------------------------------------------
#  cpo = cpoPca(export = c("center", "rank"))
#  getParamSet(cpo)

## -----------------------------------------------------------------------------
#  transformed = iris.demo %>>% cpoPca(rank = 3)
#  transformed

## -----------------------------------------------------------------------------
#  ret = retrafo(transformed)
#  ret

## -----------------------------------------------------------------------------
#  iris.demo[1, ] %>>% ret

## -----------------------------------------------------------------------------
#  iris.demo[1, ] %>>% cpoPca(rank = 3)

## -----------------------------------------------------------------------------
#  t2 = transformed %>>% cpoScale()
#  retrafo(t2)

## -----------------------------------------------------------------------------
#  t3 = clearRI(transformed) %>>% cpoScale()
#  retrafo(t3)

## -----------------------------------------------------------------------------
#  all.equal(t2, t3, check.attributes = FALSE)

## -----------------------------------------------------------------------------
#  retrafo(transformed) %>>% retrafo(t3)  # is the same as retrafo(t2) above.

## -----------------------------------------------------------------------------
#  iris.regr = makeRegrTask(data = iris.demo, target = "Petal.Width")
#  iris.logd = iris.regr %>>% cpoLogTrafoRegr()
#
#  getTaskData(iris.logd)  # log-transformed target 'Petal.Width'

## -----------------------------------------------------------------------------
#  inv = inverter(iris.logd)  # inverter object
#  inv

## -----------------------------------------------------------------------------
#  logmodel = train("regr.lm", iris.logd)
#  pred = predict(logmodel, iris.logd)  # prediction on the task itself
#  pred

## -----------------------------------------------------------------------------
#  invert(inv, pred)

## -----------------------------------------------------------------------------
#  newdata = makeRegrTask("newiris", iris[7:9, ], target = "Petal.Width",
#    fixup.data = "no", check.data = FALSE)

## -----------------------------------------------------------------------------
#  # the retrafo does the same transformation(s) on newdata that were
#  # done on the training data of the model, iris.logd. In general, this
#  # could be more than just the target log transformation.
#  newdata.transformed = newdata %>>% retrafo(iris.logd)
#  getTaskData(newdata.transformed)

## -----------------------------------------------------------------------------
#  pred = predict(logmodel, newdata.transformed)
#  pred

## -----------------------------------------------------------------------------
#  # the inverter of the newly transformed data contains information specific
#  # to the newly transformed data. In the current case, that is just the
#  # new "truth" column for the new data.
#  inv.newdata = inverter(newdata.transformed)
#  invert(inv.newdata, pred)

## -----------------------------------------------------------------------------
#  invert(retrafo(iris.logd), pred)

## -----------------------------------------------------------------------------
#  getCPOTrainedCapability(retrafo(iris.logd))  # can do both retrafo and inversion

## -----------------------------------------------------------------------------
#  getCPOTrainedCapability(inv)  # a pure inverter, can not be used for retrafo

## ---- warnings = FALSE--------------------------------------------------------
#  set.seed(123)  # for reproducibility
#  iris.resid = iris.regr %>>% cpoRegrResiduals("regr.lm")
#  getTaskData(iris.resid)

## -----------------------------------------------------------------------------
#  model.resid = train("regr.randomForest", iris.resid)
#
#  newdata.resid = newdata %>>% retrafo(iris.resid)
#  getTaskData(newdata.resid)  # Petal.Width are now the residuals of lm model predictions

## -----------------------------------------------------------------------------
#  pred = predict(model.resid, newdata.resid)
#  pred

## -----------------------------------------------------------------------------
#  # transforming this prediction back to compare
#  # it to the original 'Petal.Width'
#  inv.newdata = inverter(newdata.resid)
#  invert(inv.newdata, pred)

## -----------------------------------------------------------------------------
#  sampled = iris %>>% cpoSample(size = 3)
#  sampled

## -----------------------------------------------------------------------------
#  retrafo(sampled)
#  inverter(sampled)

## -----------------------------------------------------------------------------
#  set.seed(123)  # for reproducibility
#  lrn = cpoRegrResiduals("regr.lm") %>>% makeLearner("regr.randomForest")
#  lrn

## ---- warnings = FALSE--------------------------------------------------------
#  model = train(lrn, iris.regr)
#
#  pred = predict(model, newdata)
#  pred

## -----------------------------------------------------------------------------
#  retrafo(model)

## -----------------------------------------------------------------------------
#  icalrn = cpoIca() %>>% makeLearner("classif.logreg")
#
#  getParamSet(icalrn)

## -----------------------------------------------------------------------------
#  ps = makeParamSet(
#      makeIntegerParam("ica.n.comp", lower = 1, upper = 8),
#      makeDiscreteParam("ica.alg.typ", values = c("parallel", "deflation")))
#  # shorter version using pSS:
#  # ps = pSS(ica.n.comp: integer[1, 8], ica.alg.typ: discrete[parallel, deflation])

## -----------------------------------------------------------------------------
#  tuneParams(icalrn, pid.task, cv5, par.set = ps,
#    control = makeTuneControlGrid(),
#    show.info = FALSE)

## -----------------------------------------------------------------------------
#  cpoAsNumeric  # plain print
#  !cpoAsNumeric  # verbose print

## -----------------------------------------------------------------------------
#  cpoScale() %>>% cpoIca()  # plain print
#  !cpoScale() %>>% cpoIca()  # verbose print

## -----------------------------------------------------------------------------
#  as.list(cpoScale() %>>% cpoIca())

## -----------------------------------------------------------------------------
#  pipeCPO(list(cpoScale(), cpoIca()))

## -----------------------------------------------------------------------------
#  repca = retrafo(iris.demo %>>% cpoPca())
#  state = getCPOTrainedState(repca)
#  state

## -----------------------------------------------------------------------------
#  state$control$center = FALSE
#  state$control$scale = FALSE
#  nosc.repca = makeCPOTrainedFromState(cpoPca, state)

## -----------------------------------------------------------------------------
#  iris.demo %>>% repca

## -----------------------------------------------------------------------------
#  iris.demo %>>% nosc.repca

## -----------------------------------------------------------------------------
#  NULLCPO

## -----------------------------------------------------------------------------
#  all.equal(iris %>>% NULLCPO, iris)
#  cpoPca() %>>% NULLCPO

## -----------------------------------------------------------------------------
#  cpm = cpoMultiplex(list(cpoIca, cpoPca(export = "export.all")))
#  !cpm

## -----------------------------------------------------------------------------
#  iris.demo %>>% setHyperPars(cpm, selected.cpo = "ica", ica.n.comp = 3)

## -----------------------------------------------------------------------------
#  iris.demo %>>% setHyperPars(cpm, selected.cpo = "pca", pca.rank = 3)

## -----------------------------------------------------------------------------
#  cpa = cpoWrap()
#  !cpa

## -----------------------------------------------------------------------------
#  iris.demo %>>% setHyperPars(cpa, wrap.cpo = cpoScale())

## -----------------------------------------------------------------------------
#  iris.demo %>>% setHyperPars(cpa, wrap.cpo = cpoPca())

## -----------------------------------------------------------------------------
#  getParamSet(cpoWrap() %>>% makeLearner("classif.logreg"))

## -----------------------------------------------------------------------------
#  scale = cpoSelect(pattern = "Sepal", id = "first") %>>% cpoScale(id = "scale")
#  scale.pca = scale %>>% cpoPca()
#  cbinder = cpoCbind(scale, scale.pca, cpoSelect(pattern = "Petal", id = "second"))

## -----------------------------------------------------------------------------
#  !cbinder

## -----------------------------------------------------------------------------
#  iris.demo %>>% cbinder

## ---- results = "asis", echo = FALSE------------------------------------------
cat(knitr::knit_child("a_1_getting_started.Rmd", options = list(eval = FALSE)), sep = "\n")

