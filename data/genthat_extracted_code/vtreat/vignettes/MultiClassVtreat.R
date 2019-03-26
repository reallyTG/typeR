## ----libs----------------------------------------------------------------
library("vtreat")

## ----mkex----------------------------------------------------------------
# create example data
set.seed(326346)
sym_bonuses <- rnorm(3)
names(sym_bonuses) <- c("a", "b", "c")
sym_bonuses3 <- rnorm(3)
names(sym_bonuses3) <- as.character(seq_len(length(sym_bonuses3)))
n_row <- 1000
d <- data.frame(
  x1 = rnorm(n_row),
  x2 = sample(names(sym_bonuses), n_row, replace = TRUE),
  x3 = sample(names(sym_bonuses3), n_row, replace = TRUE),
  y = "NoInfo",
  stringsAsFactors = FALSE)
d$y[sym_bonuses[d$x2] > 
      pmax(d$x1, sym_bonuses3[d$x3], runif(n_row))] <- "Large1"
d$y[sym_bonuses3[d$x3] > 
      pmax(sym_bonuses[d$x2], d$x1, runif(n_row))] <- "Large2"

knitr::kable(head(d))

## ----tdef----------------------------------------------------------------
# define problem
vars <- c("x1", "x2", "x3")
y_name <- "y"

# build the multi-class cross frame and treatments
cfe_m <- mkCrossFrameMExperiment(d, vars, y_name)

## ----crossframe----------------------------------------------------------
# look at the data we would train models on
str(cfe_m$cross_frame)

## ----treatment_plan------------------------------------------------------
# pretend original data is new data to be treated
# NA out top row to show processing
for(vi in vars) {
  d[[vi]][[1]] <- NA
}
str(prepare(cfe_m$treat_m, d))

## ----varimp--------------------------------------------------------------
knitr::kable(
  cfe_m$score_frame[, 
                    c("varName", "rsq", "sig", "outcome_level"), 
                    drop = FALSE])

## ----varagg--------------------------------------------------------------

tapply(cfe_m$score_frame$rsq, 
       cfe_m$score_frame$origName, 
       max)

tapply(cfe_m$score_frame$sig, 
       cfe_m$score_frame$origName, 
       min)

