library(sjPlot)


### Name: sjt.stackfrq
### Title: Summary of stacked frequencies as HTML table
### Aliases: sjt.stackfrq

### ** Examples

# -------------------------------
# random sample
# -------------------------------
# prepare data for 4-category likert scale, 5 items
likert_4 <- data.frame(
  as.factor(sample(1:4, 500, replace = TRUE, prob = c(0.2, 0.3, 0.1, 0.4))),
  as.factor(sample(1:4, 500, replace = TRUE, prob = c(0.5, 0.25, 0.15, 0.1))),
  as.factor(sample(1:4, 500, replace = TRUE, prob = c(0.25, 0.1, 0.4, 0.25))),
  as.factor(sample(1:4, 500, replace = TRUE, prob = c(0.1, 0.4, 0.4, 0.1))),
  as.factor(sample(1:4, 500, replace = TRUE, prob = c(0.35, 0.25, 0.15, 0.25)))
)

# create labels
levels_4 <- c("Independent", "Slightly dependent",
              "Dependent", "Severely dependent")

# create item labels
items <- c("Q1", "Q2", "Q3", "Q4", "Q5")

# plot stacked frequencies of 5 (ordered) item-scales
## Not run: 
##D sjt.stackfrq(likert_4, value.labels = levels_4, var.labels = items)
##D 
##D # -------------------------------
##D # Data from the EUROFAMCARE sample dataset
##D # Auto-detection of labels
##D # -------------------------------
##D data(efc)
##D # recveive first item of COPE-index scale
##D start <- which(colnames(efc) == "c82cop1")
##D # recveive first item of COPE-index scale
##D end <- which(colnames(efc) == "c90cop9")
##D 
##D sjt.stackfrq(efc[, c(start:end)], alternate.rows = TRUE)
##D 
##D sjt.stackfrq(efc[, c(start:end)], alternate.rows = TRUE,
##D              show.n = TRUE, show.na = TRUE)
##D 
##D # --------------------------------
##D # User defined style sheet
##D # --------------------------------
##D sjt.stackfrq(efc[, c(start:end)], alternate.rows = TRUE,
##D              show.total = TRUE, show.skew = TRUE, show.kurtosis = TRUE,
##D              CSS = list(css.ncol = "border-left:1px dotted black;",
##D                         css.summary = "font-style:italic;"))
## End(Not run)




