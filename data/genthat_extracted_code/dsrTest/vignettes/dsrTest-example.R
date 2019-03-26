## ----example-data--------------------------------------------------------
library(dsrTest)
# the data are in `downs.mi`
data("downs.mi", package = "dsrTest")
# Birth order 5 +
b5 <- downs.mi[downs.mi$BirthOrder == 5, ]
# Gamma Method
with(b5, dsrTest(Cases, Births, Standard, mult = 1e5, method = "gamma"))
# Gamma Mid-p
with(b5, dsrTest(Cases, Births, Standard, mult = 1e5, method = "gamma",
                 control = list(midp = TRUE)))
# Dobson (exact)
with(b5, dsrTest(Cases, Births, Standard, mult = 1e5, method = "dobson"))
# Dobson (Mid-p)
with(b5, dsrTest(Cases, Births, Standard, mult = 1e5, method = "dobson",
                 control = list(midp = TRUE)))
# Asymptotic (no transformation)
with(b5, dsrTest(Cases, Births, Standard, mult = 1e5, method = "asymptotic"))
# Asymptotic (log transformation)
with(b5, dsrTest(Cases, Births, Standard, mult = 1e5, method = "asymptotic",
                 control = list(trans = "log")))
# Beta Method
with(b5, dsrTest(Cases, Births, Standard, mult = 1e5, method = "beta"))
# Approximate Bootstrap Method
with(b5, dsrTest(Cases, Births, Standard, mult = 1e5, method = "bootstrap"))

## ----summaries-----------------------------------------------------------
# A list of methods to implement
methods_list <- list(
  gamma = list(
    list(wmtype = "max"),
    list(midp = TRUE),
    list(wmtype = "tcz"),
    list(wmtype = "mean"),
    list(wmtype = "minmaxavg")),
  asymptotic = list(
    list(trans = "none"),
    list(trans = "log"),
    list(trans = "loglog"),
    list(trans = "logit")),
  dobson = list(
    list(midp = FALSE),
    list(midp = TRUE)),
  beta = list(
    list(wmtype = "none"),
    list(wmtype = "tcz"),
    list(wmtype = "mean"),
    list(wmtype = "minmaxavg"),
    list(wmtype = "max")),
  bootstrap = list(list())
)
# split out to allow call to mapply
methods <-rep(names(methods_list), times = lengths(methods_list))
controls <- do.call(c, unname(methods_list))
all_methods <- mapply(dsrTest,
  method = methods, control = controls,
  MoreArgs = list(mult = 1e5, x = b5$Cases, n = b5$Births, w = b5$Standard),
  SIMPLIFY = FALSE)
# create some "short" names
control_types <- unlist(controls)
control_names <- c(gsub("midp=FALSE", "Exact CI",
  gsub("=TRUE", "",
       sprintf("[%s=%s]", names(control_types), control_types))), "")
names(all_methods) <- paste(methods, control_names)
# combine CI into one data.frame
results <- do.call(rbind,lapply(all_methods,
  function(data) data.frame(
    estimate = data$estimate,
    lci = data$conf.int[1], 
    uci = data$conf.int[2])))
# and display
knitr::kable(results, digits = 3)

