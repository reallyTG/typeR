## ----vignette-setup, include = FALSE---------------------------------------
library(knitr)
eval_all <- FALSE # evaluate all timings and pltree?
# if render using rmarkdown, use output format to decide table format
table.format <- opts_knit$get("rmarkdown.pandoc.to")
if (!identical(table.format, "latex")) table.format <- "html"
opts_knit$set(knitr.table.format = table.format)
opts_chunk$set(message = FALSE)

## ---- echo = FALSE---------------------------------------------------------
as.matrix(data.frame(choice = c(1, 1, 1, 2, 2),
                     `item 1` = c(1, 0, 0, 1, 0),
                     `item 2` = c(0, 1, 0, 0, 1),
                     `item 3` = c(0, 0, 1, 0, 0),
                     count = c(0, 0, 1, 1, 0), check.names = FALSE))


## ----soc, eval = eval_all, echo = FALSE------------------------------------
#  library(PlackettLuce)
#  # read in example data sets
#  preflib <- "http://www.preflib.org/data/election/"
#  netflix <- read.soc(file.path(preflib, "netflix/ED-00004-00000101.soc"))
#  tshirt <- read.soc(file.path(preflib, "shirt/ED-00012-00000001.soc"))
#  sushi <- read.soc(file.path(preflib, "sushi/ED-00014-00000001.soc"))

## ----wrappers, eval = eval_all, echo = FALSE-------------------------------
#  pl <- function(dat, ...){
#      # convert ordered items to ranking
#      R <- as.rankings(dat[,-1], "ordering")
#      # fit without adding pseudo-rankings, weight rankings by count
#      PlackettLuce(R, npseudo = 0, weights = dat$n)
#  }
#  hyper2 <- function(dat, ...){
#      requireNamespace("hyper2")
#      # create likelihood object based on ordered items and counts
#      H <- hyper2::hyper2(pnames = paste0("p", seq_len(ncol(dat) - 1)))
#      for (i in seq_len(nrow(dat))){
#          x <-  dat[i, -1][dat[i, -1] > 0]
#          H <- H + hyper2::order_likelihood(x, times = dat[i, 1])
#      }
#      # find parameters to maximise likelihood
#      p <- hyper2::maxp(H)
#      structure(p, loglik = hyper2::lhyper2(H, p[-length(p)]))
#  }
#  plmix <- function(dat, ...){
#      requireNamespace("PLMIX")
#      # disaggregate data (no functionality for weights or counts)
#      r <- rep(seq_len(nrow(dat)), dat$n)
#      # maximum a posteriori estimate, with non-informative prior
#      # K items in each ranking, single component distribution
#      # default starting values do not always work so specify as uniform
#      K <- ncol(dat)
#      PLMIX::mapPLMIX(as.matrix(dat[r, -1]), K = K, G = 1,
#                      init = list(p = rep.int(1/K, K)), plot_objective = FALSE)
#  }
#  pmr <- function(dat, ...){
#      requireNamespace("pmr")
#      # convert ordered items to ranking
#      R <- as.rankings(dat[,-1], "ordering")
#      # create data frame with counts as required by pl
#      X <- as.data.frame(unclass(R))
#      X$n <- dat$n
#      capture.output(res <- pmr::pl(X))
#      res
#  }
#  statrank <- function(dat, iter){
#      requireNamespace("StatRank")
#      # disaggregate data (no functionality for weights or counts)
#      r <- rep(seq_len(nrow(dat)), dat$n)
#      capture.output(res <- StatRank::Estimation.PL.MLE(as.matrix(dat[r, -1]),
#                                                        iter = iter))
#      res
#  }

## ----timings, eval = eval_all, echo = FALSE, message = FALSE, warning = FALSE----
#  timings <- function(dat, iter = NULL,
#                      fun = c("pl", "hyper2", "plmix", "pmr", "statrank")){
#      res <- list()
#      for (nm in c("pl", "hyper2", "plmix", "pmr", "statrank")){
#          if (nm %in% fun){
#              res[[nm]] <- suppressWarnings(
#                  system.time(do.call(nm, list(dat, iter)))[["elapsed"]])
#          } else res[[nm]] <- NA
#      }
#      res
#  }
#  netflix_timings <- timings(netflix, 6)
#  tshirt_timings <- timings(tshirt, 341,
#                            fun = c("pl", "hyper2", "plmix", "statrank"))
#  sushi_timings <- timings(sushi, 5,
#                           fun = c("pl", "hyper2", "plmix", "statrank"))

## ----save-timings, echo = FALSE--------------------------------------------
if (eval_all){
    saveRDS(netflix_timings, "netflix_timings.rds")
    saveRDS(tshirt_timings, "tshirt_timings.rds")
    saveRDS(sushi_timings, "sushi_timings.rds")
} else {
    netflix_timings <- readRDS("netflix_timings.rds")
    tshirt_timings <- readRDS("tshirt_timings.rds")
    sushi_timings <- readRDS("sushi_timings.rds")
}

## ----data-features, echo = FALSE-------------------------------------------
features <- cbind(c(1256, 30, 5000),
                  c(24, 30, 4926),
                  c(4, 11, 10))
dimnames(features) <- list(c("Netflix", "T-shirt", "Sushi"),
                           c("Rankings", "Unique rankings", "Items"))
kab <- kable(features,
             caption = "(ref:features)",
             booktabs = TRUE) 
if (requireNamespace("kableExtra")){
    kableExtra::kable_styling(kab)
} else kab

## ----timings-kable, echo = FALSE, results = "asis"-------------------------
res <- data.frame(netflix = round(unlist(netflix_timings), 3),
                  tshirt = format(unlist(tshirt_timings), 3),
                  sushi = round(unlist(sushi_timings), 3),
                  stringsAsFactors = FALSE)
res["pmr", "tshirt"] <- "a"
res["pmr", "sushi"] <- "a"
res <- t(as.matrix(res))
dimnames(res) <- list(c("Netflix", "T-shirt", "Sushi"),
                      c("PlackettLuce",
                        "hyper2", "PLMIX", "pmr", "StatRank"))

kab <- kable(res, booktabs = TRUE, align = rep("r", 6), caption = "(ref:timings)",
             escape = FALSE)
if (requireNamespace("kableExtra")){
    kab <- kableExtra::kable_styling(kab)
    kab <- kableExtra::add_header_above(kab, c(" " = 1, "Time elapsed (s)" = 5))
    kableExtra::add_footnote(kab, "Function fails to complete.", 
                             notation = "alphabet")
} else {
    cat("**Time elapsed (s)**\n", kab, "\n^a Function fails to complete.", 
        sep = "\n")
}

## ----timings-sub, eval = eval_all, echo = FALSE, message = FALSE, warning = FALSE----
#  data(Data.Nascar, package = "StatRank")
#  # add column of frequencies so the format the same as before
#  nascar <- cbind(n = 1, Data.Nascar)
#  nascar_timings <- timings(nascar, fun = c("pl", "hyper2"))

## ----save-timings-sub, echo = FALSE----------------------------------------
if (eval_all){
    saveRDS(nascar_timings, "nascar_timings.rds")
} else {
    nascar_timings <- readRDS("nascar_timings.rds")
}

## ----nascar, echo = FALSE--------------------------------------------------
res <- round(unlist(nascar_timings)[c("pl", "hyper2")], 3)
res <- data.frame(Rankings = 36,
                  Items = 83,
                  `Items per ranking` = "42-43",
                  PlackettLuce = res[1],
                  hyper2 = res[2],
                  check.names = FALSE, row.names = NULL)
kab <- kable(res, booktabs = TRUE, align = rep("r", 5),
      caption = "(ref:nascar)") 
if (requireNamespace("kableExtra")){
    kab <- kableExtra::kable_styling(kab)
    kableExtra::add_header_above(kab, c("Features of NASCAR data" = 3, 
                                        "Time elapsed (s)" = 2))
} else kab

## ----package-summary, echo = FALSE-----------------------------------------
tab <- data.frame(Feature = c("Inference", "Disconnected networks",
                              "Ties", "Teams", "Heterogenous case"),
                  PlackettLuce = c("Frequentist", "Yes", "Yes", "No", "Trees"),
                  hyper2 = c("No", "No", "No", "Yes", "No"),
                  pmr = c("No", "No", "No", "No", "No"),
                  StatRank = c("No", "No", "No", "No", "No"),
                  PLMIX = c("Bayesian", "Yes", "No", "No", "Mixtures"))
kab <- kable(tab, booktabs = TRUE,
      caption = "Features of packages for fitting the Plackett-Luce model.")
if (requireNamespace("kableExtra")){
    kableExtra::kable_styling(kab)
} else kab

## --------------------------------------------------------------------------
library(PlackettLuce)
head(pudding)

## --------------------------------------------------------------------------
nr <- 3*nrow(pudding)
R <- matrix(0, nrow = nr, ncol = 6,
            dimnames = list(NULL, seq_len(6)))
i <- rep(pudding$i, 3)
j <- rep(pudding$j, 3)
R[cbind(seq_len(nr), i)] <- rep(c(1, 2, 1), each = nrow(pudding))
R[cbind(seq_len(nr), j)] <- rep(c(2, 1, 1), each = nrow(pudding))
head(R, 3)
tail(R, 3)

## --------------------------------------------------------------------------
R <- as.rankings(R)
head(R)
tail(R)

## --------------------------------------------------------------------------
w <- unlist(pudding[c("w_ij", "w_ji", "t_ij")])

## --------------------------------------------------------------------------
mod <- PlackettLuce(R, weights = w, npseudo = 0, maxit = 7)
coef(mod, log = FALSE)

## --------------------------------------------------------------------------
summary(mod)

## --------------------------------------------------------------------------
summary(mod, ref = NULL)

## --------------------------------------------------------------------------
qv <- qvcalc(mod)
summary(qv)

## ----pudding-qv, fig.cap = "Worth of brands of chocolate pudding. Intervals based on quasi-standard errors."----
plot(qv, xlab = "Brand of pudding", ylab = "Worth (log)", main = NULL)

## --------------------------------------------------------------------------
R <- matrix(c(1, 2, 0, 0,
              2, 0, 1, 0,
              1, 0, 0, 2,
              2, 1, 0, 0,
              0, 1, 2, 0), byrow = TRUE, ncol = 4,
            dimnames = list(NULL, LETTERS[1:4]))
R <- as.rankings(R)

## --------------------------------------------------------------------------
A <- adjacency(R)
A

## ----always-loses, fig.cap = "Network representation of toy rankings.", fig.small = TRUE, fig.width = 3.5, fig.height = 3.5----
library(igraph)
net <- graph_from_adjacency_matrix(A)
plot(net, edge.arrow.size = 0.5, vertex.size = 30)

## --------------------------------------------------------------------------
connectivity(A)

## --------------------------------------------------------------------------
R2 <- R[, -4]
R2
mod <- PlackettLuce(R2, npseudo = 0)
summary(mod)

## --------------------------------------------------------------------------
mod2 <- PlackettLuce(R)
coef(mod2)

## --------------------------------------------------------------------------
data(nascar)
nascar[1:2, 1:45]

## --------------------------------------------------------------------------
R <- as.rankings(nascar, input = "ordering")
R[1:2,]

## --------------------------------------------------------------------------
colnames(R) <- attr(nascar, "drivers")
R[1:3, 1:3, as.rankings = FALSE]
R[1:3]

## --------------------------------------------------------------------------
keep <- seq_len(83)
R2 <- R[, keep]
mod <- PlackettLuce(R2, npseudo = 0)

## --------------------------------------------------------------------------
avRank <- apply(R, 2, function(x) mean(x[x > 0]))
coefs <- round(coef(mod)[order(avRank[keep])], 2)
head(coefs, 3)
tail(coefs, 3)

## --------------------------------------------------------------------------
mod2 <- PlackettLuce(R)

## --------------------------------------------------------------------------
coefs2 <- round(coef(mod2), 2)
coefs2[names(coefs)[1:3]]
coefs2[names(coefs)[81:83]]

## --------------------------------------------------------------------------
coefs2[84:87]

## --------------------------------------------------------------------------
coef(summary(mod2))[84:87,]

## ----nascar-qv, fig.cap = "Ability of drivers based on NASCAR 2002 season. Intervals based on quasi-standard errors.", fig.wide = TRUE----
qv <- qvcalc(mod2)
qv$qvframe <- qv$qvframe[order(coef(mod2)),]
plot(qv, xlab = NULL, ylab = "Ability (log)", main = NULL, xaxt="n")
axis(1, at = seq_len(87), labels = rownames(qv$qvframe), las = 2, cex.axis = 0.7)

## ----beans-preparation, results = "hide"-----------------------------------
example("beans", package = "PlackettLuce")

## --------------------------------------------------------------------------
G <- grouped_rankings(R, rep(seq_len(nrow(beans)), 4))
format(head(G, 2), width = 50)

## ----pltree, eval = eval_all-----------------------------------------------
#  beans$year <- factor(beans$year)
#  tree <- pltree(G ~ ., data = beans[c("season", "year", "maxTN")],
#                 minsize = 0.05*n, maxdepth = 3)
#  tree

## ----save-tree, echo = FALSE-----------------------------------------------
if (eval_all){
    saveRDS(tree, "pltree.rds")
} else {
    tree <- readRDS("pltree.rds")
}

## ----plot-pltree, fig.wide = TRUE, fig.cap = "Worth parameters for the ten trial varieties and the local variety for each node in the Plackett-Luce tree. Varieties are 1: ALS 0532-6, 2: BRT 103-182, 3: INTA Centro Sur, 4: INTA Ferroso, 5: INTA Matagalpa, 6: INTA Precoz, 7: INTA Rojo, 8: INTA Sequia, 9: Local, 10: PM2 Don Rey, 11: SJC 730-79."----
plot(tree, names = FALSE, abbreviate = 2)

## ----show-soc--------------------------------------------------------------

## ----soc, eval = FALSE-----------------------------------------------------
#  library(PlackettLuce)
#  # read in example data sets
#  preflib <- "http://www.preflib.org/data/election/"
#  netflix <- read.soc(file.path(preflib, "netflix/ED-00004-00000101.soc"))
#  tshirt <- read.soc(file.path(preflib, "shirt/ED-00012-00000001.soc"))
#  sushi <- read.soc(file.path(preflib, "sushi/ED-00014-00000001.soc"))

## ----chunk2----------------------------------------------------------------

## ----wrappers, eval = FALSE------------------------------------------------
#  pl <- function(dat, ...){
#      # convert ordered items to ranking
#      R <- as.rankings(dat[,-1], "ordering")
#      # fit without adding pseudo-rankings, weight rankings by count
#      PlackettLuce(R, npseudo = 0, weights = dat$n)
#  }
#  hyper2 <- function(dat, ...){
#      requireNamespace("hyper2")
#      # create likelihood object based on ordered items and counts
#      H <- hyper2::hyper2(pnames = paste0("p", seq_len(ncol(dat) - 1)))
#      for (i in seq_len(nrow(dat))){
#          x <-  dat[i, -1][dat[i, -1] > 0]
#          H <- H + hyper2::order_likelihood(x, times = dat[i, 1])
#      }
#      # find parameters to maximise likelihood
#      p <- hyper2::maxp(H)
#      structure(p, loglik = hyper2::lhyper2(H, p[-length(p)]))
#  }
#  plmix <- function(dat, ...){
#      requireNamespace("PLMIX")
#      # disaggregate data (no functionality for weights or counts)
#      r <- rep(seq_len(nrow(dat)), dat$n)
#      # maximum a posteriori estimate, with non-informative prior
#      # K items in each ranking, single component distribution
#      # default starting values do not always work so specify as uniform
#      K <- ncol(dat)
#      PLMIX::mapPLMIX(as.matrix(dat[r, -1]), K = K, G = 1,
#                      init = list(p = rep.int(1/K, K)), plot_objective = FALSE)
#  }
#  pmr <- function(dat, ...){
#      requireNamespace("pmr")
#      # convert ordered items to ranking
#      R <- as.rankings(dat[,-1], "ordering")
#      # create data frame with counts as required by pl
#      X <- as.data.frame(unclass(R))
#      X$n <- dat$n
#      capture.output(res <- pmr::pl(X))
#      res
#  }
#  statrank <- function(dat, iter){
#      requireNamespace("StatRank")
#      # disaggregate data (no functionality for weights or counts)
#      r <- rep(seq_len(nrow(dat)), dat$n)
#      capture.output(res <- StatRank::Estimation.PL.MLE(as.matrix(dat[r, -1]),
#                                                        iter = iter))
#      res
#  }

## ----chunk2----------------------------------------------------------------

## ----timings, eval = FALSE-------------------------------------------------
#  timings <- function(dat, iter = NULL,
#                      fun = c("pl", "hyper2", "plmix", "pmr", "statrank")){
#      res <- list()
#      for (nm in c("pl", "hyper2", "plmix", "pmr", "statrank")){
#          if (nm %in% fun){
#              res[[nm]] <- suppressWarnings(
#                  system.time(do.call(nm, list(dat, iter)))[["elapsed"]])
#          } else res[[nm]] <- NA
#      }
#      res
#  }
#  netflix_timings <- timings(netflix, 6)
#  tshirt_timings <- timings(tshirt, 341,
#                            fun = c("pl", "hyper2", "plmix", "statrank"))
#  sushi_timings <- timings(sushi, 5,
#                           fun = c("pl", "hyper2", "plmix", "statrank"))

## ----beans-1---------------------------------------------------------------
data(beans)
head(beans[c("best", "worst")], 2)

## ----beans-2---------------------------------------------------------------
beans <- within(beans, {
    best <- match(best, c("A", "B", "C"))
    worst <- match(worst, c("A", "B", "C"))
    middle <- 6 - best - worst
})
head(beans[c("best", "middle", "worst")], 2)

## ----beans-3---------------------------------------------------------------
varieties <- as.matrix(beans[c("variety_a", "variety_b", "variety_c")])
head(varieties, 2)

## ----beans-4---------------------------------------------------------------
n <- nrow(beans)
beans <- within(beans, {
    best <- varieties[cbind(seq_len(n), best)]
    worst <- varieties[cbind(seq_len(n), worst)]
    middle <- varieties[cbind(seq_len(n), middle)]
})
head(beans[c("best", "middle", "worst")], 2)

## ----beans-5---------------------------------------------------------------
lab <- c("Local", sort(unique(as.vector(varieties))))
R <- as.rankings(beans[c("best", "middle", "worst")],
                 input = "ordering", labels = lab)
head(R)

## ----beans-6---------------------------------------------------------------
head(beans[c("var_a", "var_b", "var_c")], 2)

## ----beans-7---------------------------------------------------------------
paired <- list()
for (id in c("a", "b", "c")){
    ordering <- matrix("Local", nrow = n, ncol = 2)
    worse <- beans[[paste0("var_", id)]] == "Worse"
    ## put trial variety in column 1 when it is not worse than local
    ordering[!worse, 1] <- beans[[paste0("variety_", id)]][!worse]
    ## put trial variety in column 2 when it is worse than local
    ordering[worse, 2] <- beans[[paste0("variety_", id)]][worse]
    paired[[id]] <- ordering
}
head(paired[["a"]])

## ----beans-8---------------------------------------------------------------
paired <- lapply(paired, as.rankings, input = "ordering", labels = lab)
R <- rbind(R, paired[["a"]], paired[["b"]], paired[["c"]])
head(R)
tail(R)

