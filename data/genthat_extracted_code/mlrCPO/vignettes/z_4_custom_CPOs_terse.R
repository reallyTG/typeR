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
#  !cpoPca()

## -----------------------------------------------------------------------------
#  xmpSample = makeCPORetrafoless("exsample",  # nolint
#    pSS(fraction: numeric[0, 1]),
#    dataformat = "df.all",
#    cpo.trafo = function(data, target, fraction) {
#      newsize = round(nrow(data) * fraction)
#      row.indices = sample(nrow(data), newsize)
#      data[row.indices, ]
#    })
#
#  cpo = xmpSample(0.01)

## -----------------------------------------------------------------------------
#  iris %>>% cpo

## -----------------------------------------------------------------------------
#  xmpSampleHeadless = makeCPORetrafoless("exsample",  # nolint
#    pSS(fraction: numeric[0, 1]),
#    dataformat = "df.all",
#    cpo.trafo = {
#      newsize = round(nrow(data) * fraction)
#      row.indices = sample(nrow(data), newsize)
#      data[row.indices, ]
#    })

## -----------------------------------------------------------------------------
#  xmpFilterVar = makeCPO("exemplvar",  # nolint
#    pSS(n.col: integer[0, ]),
#    dataformat = "numeric",
#    cpo.train = function(data, target, n.col) {
#      cat("*** cpo.train ***\n")
#      sapply(data, var, na.rm = TRUE)
#    },
#    cpo.retrafo = function(data, control, n.col) {
#      cat("*** cpo.retrafo ***\n")
#      cat("Control:\n")
#      print(control)
#      cat("\n")
#      greatest = order(-control)  # columns, ordered greatest to smallest var
#      data[greatest[seq_len(n.col)]]
#    })
#
#  cpo = xmpFilterVar(2)

## -----------------------------------------------------------------------------
#  (trafd = head(iris) %>>% cpo)

## -----------------------------------------------------------------------------
#  head(iris %>>% cpo)

## -----------------------------------------------------------------------------
#  head(iris %>>% retrafo(trafd))

## -----------------------------------------------------------------------------
#  getCPOTrainedState(retrafo(trafd))

## -----------------------------------------------------------------------------
#  xmpFilterVarFunc = makeCPO("exemplvar.func",  # nolint
#    pSS(n.col: integer[0, ]),
#    dataformat = "numeric",
#    cpo.retrafo = NULL,
#    cpo.train = function(data, target, n.col) {
#      cat("*** cpo.train ***\n")
#      ctrl = sapply(data, var, na.rm = TRUE)
#      function(x) {  # the data is given to the only present parameter: 'x'
#        cat("*** cpo.retrafo ***\n")
#        cat("Control:\n")
#        print(ctrl)
#        cat("\ndata:\n")
#        print(data)  # 'data' is deleted: NULL
#        cat("target:\n")
#        print(target)  # 'target' is deleted: NULL
#        greatest = order(-ctrl)  # columns, ordered greatest to smallest var
#        x[greatest[seq_len(n.col)]]
#      }
#    })
#
#  cpo = xmpFilterVarFunc(2)

## -----------------------------------------------------------------------------
#  (trafd = head(iris) %>>% cpo)

## -----------------------------------------------------------------------------
#  getCPOTrainedState(retrafo(trafd))

## -----------------------------------------------------------------------------
#  xmpAsNum = makeCPO("asnum",  # nolint
#    cpo.train = NULL,
#    cpo.retrafo = function(data) {
#      data.frame(lapply(data, as.numeric))
#    })
#
#  cpo = xmpAsNum()

## -----------------------------------------------------------------------------
#  (trafd = head(iris) %>>% cpo)

## -----------------------------------------------------------------------------
#  getCPOTrainedState(retrafo(trafd))

## -----------------------------------------------------------------------------
#  xmpPca = makeCPOExtendedTrafo("simple.pca",  # nolint
#    pSS(n.col: integer[0, ]),
#    dataformat = "numeric",
#    cpo.trafo = function(data, target, n.col) {
#      cat("*** cpo.trafo ***\n")
#      pcr = prcomp(as.matrix(data), center = FALSE, scale. = FALSE, rank = n.col)
#      # save the rotation matrix as 'control' variable
#      control = pcr$rotation
#      pcr$x
#    },
#    cpo.retrafo = function(data, control, n.col) {
#      cat("*** cpo.retrafo ***\n")
#      # rotate the data by the rotation matrix
#      as.matrix(data) %*% control
#    })
#
#  cpo = xmpPca(2)

## -----------------------------------------------------------------------------
#  (trafd = head(iris) %>>% cpo)

## -----------------------------------------------------------------------------
#  tail(iris) %>>% retrafo(trafd)

## -----------------------------------------------------------------------------
#  getCPOTrainedState(retrafo(trafd))

## -----------------------------------------------------------------------------
#  xmpPcaFunc = makeCPOExtendedTrafo("simple.pca.func",  # nolint
#    pSS(n.col: integer[0, ]),
#    dataformat = "numeric",
#    cpo.retrafo = NULL,
#    cpo.trafo = function(data, target, n.col) {
#      cat("*** cpo.trafo ***\n")
#      pcr = prcomp(as.matrix(data), center = FALSE, scale. = FALSE, rank = n.col)
#      # save the rotation matrix as 'control' variable
#      cpo.retrafo = function(data) {
#        cat("*** cpo.retrafo ***\n")
#        # rotate the data by the rotation matrix
#        as.matrix(data) %*% pcr$rotation
#      }
#      pcr$x
#    })
#
#  cpo = xmpPcaFunc(2)

## -----------------------------------------------------------------------------
#  (trafd = head(iris) %>>% cpo)

## -----------------------------------------------------------------------------
#  getCPOTrainedState(retrafo(trafd))$pcr$x

## ---- eval = FALSE------------------------------------------------------------
#  c(response = "response", se = "prob")

## -----------------------------------------------------------------------------
#  xmpMetaLearn = makeCPOTargetOp("xmp.meta",  # nolint
#    pSS(lrn: untyped),
#    dataformat = "task",
#    properties.target = c("classif", "twoclass"),
#    predict.type.map = c(response = "response", prob = "prob"),
#    cpo.train = function(data, target, lrn) {
#      cat("*** cpo.train ***\n")
#      lrn = setPredictType(lrn, "prob")
#      train(lrn, data)
#    },
#    cpo.retrafo = function(data, target, control, lrn) {
#      cat("*** cpo.retrafo ***\n")
#      prediction = predict(control, target)
#      tname = getTaskTargetNames(target)
#      tdata = getTaskData(target)
#      tdata[[tname]] = factor(prediction$data$response == prediction$data$truth)
#      makeClassifTask(getTaskId(target), tdata, tname, positive = "TRUE",
#        fixup.data = "no", check.data = FALSE)
#    },
#    cpo.train.invert = function(data, control, lrn) {
#      cat("*** cpo.train.invert ***\n")
#      predict(control, newdata = data)$data
#    },
#    cpo.invert = function(target, control.invert, predict.type, lrn) {
#      cat("*** cpo.invert ***\n")
#      if (predict.type == "prob") {
#        outmat = as.matrix(control.invert[grep("^prob\\.", names(control.invert))])
#        revmat = outmat[, c(2, 1)]
#        outmat * target[, "prob.TRUE", drop = TRUE] +
#          revmat * target[, "prob.FALSE", drop = TRUE]
#      } else {
#        stopifnot(levels(target) == c("FALSE", "TRUE"))
#        numeric.prediction = as.numeric(control.invert$response)
#        numeric.res = ifelse(target == "TRUE",
#          numeric.prediction,
#          3 - numeric.prediction)
#        factor(levels(control.invert$response)[numeric.res],
#          levels(control.invert$response))
#      }
#    })
#
#  cpo = xmpMetaLearn(makeLearner("classif.logreg"))

## -----------------------------------------------------------------------------
#  set.seed(12)
#  split = makeResampleInstance(hout, pid.task)
#  train.task = subsetTask(pid.task, split$train.inds[[1]])
#  test.task = subsetTask(pid.task, split$predict.inds[[1]])

## -----------------------------------------------------------------------------
#  trafd = train.task %>>% cpo
#  attributes(trafd)

## -----------------------------------------------------------------------------
#  head(getTaskData(trafd))

## -----------------------------------------------------------------------------
#  model = train(makeLearner("classif.logreg", predict.type = "prob"), train.task)
#  head(predict(model, train.task)$data[c("truth", "response")])

## -----------------------------------------------------------------------------
#  retr = test.task %>>% retrafo(trafd)
#  attributes(retr)

## -----------------------------------------------------------------------------
#  retr.df = getTaskData(test.task, target.extra = TRUE)$data %>>% retrafo(trafd)
#  names(attributes(retr.df))

## -----------------------------------------------------------------------------
#  ext.model = train("classif.svm", trafd)
#  ext.pred = predict(ext.model, retr)
#  newpred = invert(inverter(retr), ext.pred)
#  performance(newpred)

## -----------------------------------------------------------------------------
#  cpo.learner = cpo %>>% makeLearner("classif.svm")
#  cpo.model = train(cpo.learner, train.task)

## -----------------------------------------------------------------------------
#  lrnpred = predict(cpo.model, test.task)
#  performance(lrnpred)

## -----------------------------------------------------------------------------
#
#  xmpMetaLearn = makeCPOTargetOp("xmp.meta.fnc",  # nolint
#    pSS(lrn: untyped),
#    dataformat = "task",
#    properties.target = c("classif", "twoclass"),
#    predict.type.map = c(response = "response", prob = "prob"),
#    # set the cpo.* parameters not needed to NULL:
#    cpo.retrafo = NULL, cpo.train.invert = NULL, cpo.invert = NULL,
#    cpo.train = function(data, target, lrn) {
#      cat("*** cpo.train ***\n")
#      lrn = setPredictType(lrn, "prob")
#      model = train(lrn, data)
#      cpo.retrafo = function(data, target) {
#        cat("*** cpo.retrafo ***\n")
#        prediction = predict(model, target)
#        tname = getTaskTargetNames(target)
#        tdata = getTaskData(target)
#        tdata[[tname]] = factor(prediction$data$response == prediction$data$truth)
#        makeClassifTask(getTaskId(target), tdata, tname, positive = "TRUE",
#          fixup.data = "no", check.data = FALSE)
#      }
#      cpo.train.invert = function(data) {
#        cat("*** cpo.train.invert ***\n")
#        prediction = predict(model, newdata = data)$data
#        function(target, predict.type) {  # this is returned as cpo.invert
#          cat("*** cpo.invert ***\n")
#          if (predict.type == "prob") {
#            outmat = as.matrix(prediction[grep("^prob\\.", names(prediction))])
#            revmat = outmat[, c(2, 1)]
#            outmat * target[, "prob.TRUE", drop = TRUE] +
#              revmat * target[, "prob.FALSE", drop = TRUE]
#          } else {
#            stopifnot(levels(target) == c("FALSE", "TRUE"))
#            numeric.prediction = as.numeric(prediction$response)
#            numeric.res = ifelse(target == "TRUE",
#              numeric.prediction,
#              3 - numeric.prediction)
#            factor(levels(prediction$response)[numeric.res],
#              levels(prediction$response))
#          }
#        }
#      }
#    })

## -----------------------------------------------------------------------------
#  xmpRegCenter = makeCPOTargetOp("xmp.center",  # nolint
#    constant.invert = TRUE,
#    cpo.train.invert = NULL,  # necessary for constant.invert = TRUE
#    dataformat = "df.feature",
#    properties.target = "regr",
#    cpo.train = function(data, target) {
#      # control value is just the mean of the target column
#      mean(target[[1]])
#    },
#    cpo.retrafo = function(data, target, control) {
#      # subtract mean from target column in retrafo
#      target[[1]] = target[[1]] - control
#      target
#    },
#    cpo.invert = function(target, predict.type, control.invert) {
#      target + control.invert
#    })
#
#  cpo = xmpRegCenter()

## -----------------------------------------------------------------------------
#  train.task = subsetTask(bh.task, 150:155)
#  getTaskTargets(train.task)

## -----------------------------------------------------------------------------
#  predict.task = subsetTask(bh.task, 156:160)
#  getTaskTargets(predict.task)

## -----------------------------------------------------------------------------
#  trafd = train.task %>>% cpo
#  getTaskTargets(trafd)

## -----------------------------------------------------------------------------
#  getTaskTargets(predict.task)

## -----------------------------------------------------------------------------
#  retr = retrafo(trafd)
#  predict.traf = predict.task %>>% retr
#  getTaskTargets(predict.traf)

## ---- warnings = FALSE--------------------------------------------------------
#  model = train("regr.lm", trafd)
#  pred = predict(model, predict.traf)
#  pred

## -----------------------------------------------------------------------------
#  invert(inverter(predict.traf), pred)

## ---- warnings = FALSE--------------------------------------------------------
#  model = train("regr.lm", train.task)
#  predict(model, predict.task)

## -----------------------------------------------------------------------------
#  getCPOTrainedCapability(retr)

## -----------------------------------------------------------------------------
#  invert(retr, pred)

## -----------------------------------------------------------------------------
#  xmpLogRegr = makeCPOTargetOp("log.regr",  # nolint
#    constant.invert = TRUE,
#    properties.target = "regr",
#    cpo.train = NULL, cpo.train.invert = NULL,
#    cpo.retrafo = function(data, target) {
#      target[[1]] = log(target[[1]])
#      target
#    },
#    cpo.invert = function(target, predict.type) {
#      exp(target)
#    })
#
#  cpo = xmpLogRegr()

## -----------------------------------------------------------------------------
#  trafd = train.task %>>% cpo
#  getTaskTargets(trafd)

## -----------------------------------------------------------------------------
#  retr = retrafo(trafd)
#  predict.traf = predict.task %>>% retr
#  getTaskTargets(predict.traf)

## ---- warnings = FALSE--------------------------------------------------------
#  model = train("regr.lm", trafd)
#  pred = predict(model, predict.traf)
#  pred

## -----------------------------------------------------------------------------
#  invert(inverter(predict.traf), pred)

## -----------------------------------------------------------------------------
#  invert(retr, pred)

## -----------------------------------------------------------------------------
#  xmpSynCPO = makeCPOExtendedTargetOp("syn.cpo",  # nolint
#    properties.target = "regr",
#    cpo.trafo = function(data, target) {
#      cat("*** cpo.trafo ***\n")
#      target[[1]] = target[[1]] + 1
#      control = "control created in cpo.trafo"
#      control.invert = "control.invert created in cpo.trafo"
#      target
#    },
#    cpo.retrafo = function(data, target, control) {
#      cat("*** cpo.retrafo ***", "control is:", deparse(control), sep = "\n")
#      control.invert = "control.invert created in cpo.retrafo"
#      if (!is.null(target)) {
#        cat("target is non-NULL, performing transformation\n")
#        target[[1]] = target[[1]] - 1
#        return(target)
#      } else {
#        cat("target is NULL, no transformation (but control.invert was created)\n")
#        return(NULL)  # is ignored.
#      }
#    },
#    cpo.invert = function(target, control.invert, predict.type) {
#      cat("*** invert ***", "control.invert is:", deparse(control.invert),
#        sep = "\n")
#      target
#    })
#
#  cpo = xmpSynCPO()

## -----------------------------------------------------------------------------
#  trafd = train.task %>>% cpo
#  getTaskTargets(trafd)

## -----------------------------------------------------------------------------
#  retrafd = train.task %>>% retrafo(trafd)

## -----------------------------------------------------------------------------
#  getTaskTargets(retrafd)

## -----------------------------------------------------------------------------
#  retrafd = getTaskData(train.task, target.extra = TRUE)$data %>>% retrafo(trafd)

## -----------------------------------------------------------------------------
#  inv = invert(inverter(trafd), 1:6)

## -----------------------------------------------------------------------------
#  inv = invert(inverter(retrafd), 1:6)

## ---- echo = FALSE------------------------------------------------------------
#  oscipen = options("scipen")
#  options(scipen = 10)

## -----------------------------------------------------------------------------
#  learners = list(
#      logreg = makeLearner("classif.logreg"),
#      svm = makeLearner("classif.svm"),
#      cpo = xmpMetaLearn(makeLearner("classif.logreg")) %>>%
#        makeLearner("classif.svm")
#  )
#
#  # suppress output of '*** cpo.train ***' etc.
#  configureMlr(show.info = FALSE, show.learner.output = FALSE)
#
#  perfs = sapply(learners, function(lrn) {
#    unname(replicate(20, resample(lrn, pid.task, cv10)$aggr))
#  })
#
#  # reset mlr settings
#  configureMlr()
#
#  boxplot(perfs)

## -----------------------------------------------------------------------------
#  pvals = c(
#      logreg = t.test(perfs[, "logreg"], perfs[, "cpo"], "greater")$p.value,
#      svm = t.test(perfs[, "svm"], perfs[, "cpo"], "greater")$p.value
#  )
#
#  round(p.adjust(pvals), 3)

## ---- echo = FALSE------------------------------------------------------------
#  options(scipen = oscipen$scipen)

## ---- results = "asis", echo = FALSE------------------------------------------
cat(knitr::knit_child("a_4_custom_CPOs.Rmd", options = list(eval = FALSE)), sep = "\n")

