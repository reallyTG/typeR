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
#  getCPOClass(cpoPca)
#  getCPOClass(cpoPca())
#  getCPOClass(pid.task %>|% cpoPca())
#  getCPOClass(inverter(bh.task %>>% cpoLogTrafoRegr()))
#  getCPOClass(NULLCPO)

## -----------------------------------------------------------------------------
#  print(cpoAsNumeric)  # example CPOConstructor
#  print(cpoAsNumeric, verbose = TRUE)  # alternative: !cpoAsNumeric
#  class(cpoAsNumeric)
#  getCPOName(cpoPca)  # same as getCPOName() of the *constructed* CPO
#  getCPOClass(cpoPca)

## -----------------------------------------------------------------------------
#  names(formals(cpoPca))

## -----------------------------------------------------------------------------
#  (cpo = cpoScale()) # construct CPO with default Hyperparameter values
#  print(cpo, verbose = TRUE)  # detailed printing. Alternative: !cpo
#  class(cpo)  # CPOs that are not compound are "CPOPrimitive"
#  getCPOClass(cpo)

## -----------------------------------------------------------------------------
#  getParamSet(cpo)
#  getHyperPars(cpo)
#  setHyperPars(cpo, scale.center = FALSE)
#  getCPOId(cpo)
#  setCPOId(cpo, "MYID")
#  getCPOName(cpo)
#  getCPOAffect(cpo)  # empty, since no affect set
#  getCPOAffect(cpoPca(affect.pattern = "Width$"))
#  getCPOConstructor(cpo)  # the constructor used to create the CPO
#  getCPOProperties(cpo)  # see properties explanation below
#  getCPOPredictType(cpo)
#  getCPOClass(cpo)
#  getCPOOperatingType(cpo)  # Operating on feature, target, retrafoless?

## -----------------------------------------------------------------------------
#  getCPOPredictType(cpoResponseFromSE())
#  getCPOOperatingType(cpoResponseFromSE())
#  getCPOOperatingType(cpoSample())

## -----------------------------------------------------------------------------
#  identicalCPO(cpoScale(scale = TRUE), cpoScale(scale = FALSE))
#  identicalCPO(cpoScale(), cpoPca())

## -----------------------------------------------------------------------------
#  head(iris) %>>% cpoPca()
#  task = applyCPO(cpoPca(), iris.task)
#  head(getTaskData(task))

## -----------------------------------------------------------------------------
#  scale = cpoScale()
#  pca = cpoPca()

## -----------------------------------------------------------------------------
#  compound = scale %>>% pca
#  composeCPO(scale, pca)  # same
#  class(compound)
#  !compound
#  getCPOName(compound)
#  getHyperPars(compound)
#  setHyperPars(compound, scale.center = TRUE, pca.center = FALSE)

## ---- error = TRUE------------------------------------------------------------
#  getCPOId(compound)  # error: no ID for compound CPOs
#  getCPOAffect(compound)  # error: no affect for compound CPOs

## -----------------------------------------------------------------------------
#  getCPOOperatingType(NULLCPO)
#  getCPOOperatingType(cpoScale())
#  getCPOOperatingType(cpoScale() %>>% cpoLogTrafoRegr() %>>% cpoSample())

## -----------------------------------------------------------------------------
#  as.list(compound)
#  pipeCPO(as.list(compound))  # chainCPO: (list of CPO) -> CPO
#  pipeCPO(list())

## -----------------------------------------------------------------------------
#  lrn = makeLearner("classif.logreg")
#  (cpolrn = cpo %>>% lrn)  # the new learner has the CPO hyperparameters
#  attachCPO(compound, lrn)  # attaching compound CPO

## -----------------------------------------------------------------------------
#  class(lrn)

## -----------------------------------------------------------------------------
#  lrn = cpoLogTrafoRegr() %>>% makeLearner("regr.lm")
#  model = train(lrn, subsetTask(bh.task, 1:300))
#  predict(model, subsetTask(bh.task, 301:500))

## -----------------------------------------------------------------------------
#  trafo = subsetTask(bh.task, 1:300) %>>% cpoLogTrafoRegr()
#  model = train("regr.lm", trafo)
#
#  newdata = subsetTask(bh.task, 301:500) %>>% retrafo(trafo)
#  pred = predict(model, newdata)
#  invert(inverter(newdata), pred)

## -----------------------------------------------------------------------------
#  getLearnerCPO(cpolrn)  # the CPO
#  getLearnerBare(cpolrn)  # the Learner

## -----------------------------------------------------------------------------
#  transformed = iris %>>% cpoScale()
#  head(transformed)
#  (ret = retrafo(transformed))

## -----------------------------------------------------------------------------
#  head(getTaskTargets(bh.task))
#  transformed = bh.task %>>% cpoLogTrafoRegr()
#  head(getTaskTargets(transformed))
#  (inv = inverter(transformed))
#  head(invert(inv, getTaskTargets(transformed)))

## -----------------------------------------------------------------------------
#  attributes(transformed)

## -----------------------------------------------------------------------------
#  bh2 = bh.task
#  retrafo(bh2) = ret
#  attributes(bh2)

## -----------------------------------------------------------------------------
#  retrafo(bh2) = NULLCPO
#  # equivalent:
#  # retrafo(bh2) = NULL
#  attributes(bh2)

## -----------------------------------------------------------------------------
#  # clearRI returns the object without retrafo or inverter attributes
#  bh3 = clearRI(transformed)
#  attributes(bh3)

## -----------------------------------------------------------------------------
#  getCPOName(ret)
#  getParamSet(ret)
#  getHyperPars(ret)
#  getCPOProperties(ret)
#  getCPOPredictType(ret)
#  getCPOOperatingType(ret)  # Operating on feature, target, both?
#  getCPOOperatingType(inv)

## -----------------------------------------------------------------------------
#  getCPOTrainedCapability(ret)
#  getCPOTrainedCapability(inv)
#  getCPOTrainedCapability(NULLCPO)

## -----------------------------------------------------------------------------
#  getCPOClass(ret)
#  getCPOClass(inv)

## -----------------------------------------------------------------------------
#  getCPOTrainedCPO(ret)
#  getCPOConstructor(ret)

## -----------------------------------------------------------------------------
#  (state = getCPOTrainedState(retrafo(iris %>>% cpoScale())))
#  state$control$center[1] = 1000  # will now subtract 1000 from the first column
#  new.retrafo = makeCPOTrainedFromState(cpoScale, state)
#  head(iris %>>% new.retrafo)

## -----------------------------------------------------------------------------
#  data = head(iris) %>>% cpoPca()
#  retrafo(data)
#  data2 = data %>>% cpoScale()

## -----------------------------------------------------------------------------
#  retrafo(data2)

## -----------------------------------------------------------------------------
#  data = clearRI(data)
#  data2 = data %>>% cpoScale()
#  retrafo(data2)

## -----------------------------------------------------------------------------
#  retrafo(data) = NULL
#  inverter(data) = NULL
#  data3 = data %>>% cpoScale()
#  retrafo(data3)

## -----------------------------------------------------------------------------
#  compound.retrafo = retrafo(head(iris) %>>% compound)
#  compound.retrafo

## -----------------------------------------------------------------------------
#  (retrafolist = as.list(compound.retrafo))

## -----------------------------------------------------------------------------
#  retrafolist[[1]] %>>% retrafolist[[2]]
#  pipeCPO(retrafolist)

## -----------------------------------------------------------------------------
#  transformed = iris %>>% cpoScale()
#  head(iris) %>>% retrafo(transformed)

## -----------------------------------------------------------------------------
#  head(transformed)

## ---- eval = FALSE------------------------------------------------------------
#  applyCPO(retrafo(transformed), head(iris))
#  predict(retrafo(transformed), head(iris))

## -----------------------------------------------------------------------------
#  transformed = bh.task %>>% cpoLogTrafoRegr()
#  prediction = predict(train("regr.lm", transformed), transformed)
#  inv = inverter(transformed)
#  invert(inv, prediction)

## -----------------------------------------------------------------------------
#  ret = retrafo(transformed)
#  invert(ret, prediction)

## -----------------------------------------------------------------------------
#  pipeCPO(list())
#  as.list(NULLCPO)  # the inverse of pipeCPO
#  retrafo(bh.task)
#  inverter(bh.task %>>% cpoPca())  # cpoPca is a TOCPO, so no inverter is created

## -----------------------------------------------------------------------------
#  getCPOClass(NULLCPO)
#  getCPOName(NULLCPO)
#  getCPOId(NULLCPO)
#  getHyperPars(NULLCPO)
#  getParamSet(NULLCPO)
#  getCPOAffect(NULLCPO)
#  getCPOOperatingType(NULLCPO)  # operates neither on features nor on targets.
#  getCPOProperties(NULLCPO)
#  # applying NULLCPO leads to a retrafo() of NULLCPO, so it is its own CPOTrainedCPO
#  getCPOTrainedCPO(NULLCPO)
#  # NULLCPO has no effect on applyCPO and invert, so NULLCPO's capabilities are 0.
#  getCPOTrainedCapability(NULLCPO)
#  getCPOTrainedState(NULLCPO)

## -----------------------------------------------------------------------------
#  nullToNullcpo(NULL)
#  nullcpoToNull(NULLCPO)
#  nullToNullcpo(10) # not changed
#  nullcpoToNull(10) # ditto

## -----------------------------------------------------------------------------
#  cpo = cpoPca()
#  getCPOId(cpo)

## -----------------------------------------------------------------------------
#  getParamSet(cpo)

## -----------------------------------------------------------------------------
#  getParamSet(setCPOId(cpo, "my.id"))

## -----------------------------------------------------------------------------
#  getParamSet(setCPOId(cpo, NULL))

## ---- error = TRUE------------------------------------------------------------
#
#  cpo %>>% cpo

## -----------------------------------------------------------------------------
#  cpo %>>% setCPOId(cpo, "two")

## -----------------------------------------------------------------------------
#  getCPOProperties(cpoDummyEncode())

## ---- error = TRUE------------------------------------------------------------
#  train("classif.geoDA", bc.task)  # gives an error

## -----------------------------------------------------------------------------
#  train(cpoDummyEncode(reference.cat = TRUE) %>>% makeLearner("classif.geoDA"), bc.task)

## -----------------------------------------------------------------------------
#  getLearnerProperties("classif.geoDA")

## -----------------------------------------------------------------------------
#  getLearnerProperties(cpoDummyEncode(TRUE) %>>% makeLearner("classif.geoDA"))

## -----------------------------------------------------------------------------
#  getCPOProperties(cpoApplyFun(export = "export.all"), get.internal = TRUE)

## -----------------------------------------------------------------------------
#  # onlhy PCA columns that have '.Length' in their name
#  cpo = cpoPca(affect.pattern = ".Length")
#  getCPOAffect(cpo)

## -----------------------------------------------------------------------------
#  triris = iris %>>% cpo
#  head(triris)

## -----------------------------------------------------------------------------
#  !cpoScale()

## -----------------------------------------------------------------------------
#  !cpoScale(export = "export.none")

## -----------------------------------------------------------------------------
#  !cpoScale(scale = FALSE, export = "export.unset")

## ---- results = "asis", echo = FALSE------------------------------------------
cat(knitr::knit_child("a_2_mlrCPO_core.Rmd", options = list(eval = FALSE)), sep = "\n")

