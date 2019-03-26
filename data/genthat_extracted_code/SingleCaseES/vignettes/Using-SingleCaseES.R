## ----setup, include = FALSE----------------------------------------------
library(kableExtra)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  error = TRUE
)

## ------------------------------------------------------------------------
library(SingleCaseES)

## ------------------------------------------------------------------------
args(NAP)

## ------------------------------------------------------------------------
A <- c(20, 20, 26, 25, 22, 23)
B <- c(28, 25, 24, 27, 30, 30, 29)

## ------------------------------------------------------------------------
NAP(A_data = A, B_data = B)

## ------------------------------------------------------------------------
phase <- c(rep("A", 6), rep("B", 7))
phase

outcome_dat <- c(A, B)
outcome_dat 
NAP(condition = phase, outcome = outcome_dat)

## ------------------------------------------------------------------------
phase2 <- c(rep("A", 5), rep("B", 5), rep("C",3))
NAP(condition = phase2, outcome = outcome_dat)

## ------------------------------------------------------------------------
phase_rev <- c(rep("B", 7), rep("A", 6))
outcome_rev <- c(B, A)
NAP(condition = phase_rev, outcome = outcome_rev, baseline_phase = "A")

## ------------------------------------------------------------------------
NAP(A_data = A, B_data = B, improvement = "decrease")

## ------------------------------------------------------------------------
NAP(A_data = A, B_data = B, SE = "unbiased")

NAP(A_data = A, B_data = B, SE = "Hanley")

NAP(A_data = A, B_data = B, SE = "null")

NAP(A_data = A, B_data = B, SE = "none")

## ------------------------------------------------------------------------
NAP(A_data = A, B_data = B)

NAP(A_data = A, B_data = B, confidence = .99)

NAP(A_data = A, B_data = B, confidence = .90)

## ------------------------------------------------------------------------
NAP(A_data = A, B_data = B, confidence = NULL)    

## ------------------------------------------------------------------------
Tau(A_data = A, B_data = B)

PND(A_data = A, B_data = B)

PEM(A_data = A, B_data = B)

PAND(A_data = A, B_data = B)

IRD(A_data = A, B_data = B)

Tau_U(A_data = A, B_data = B)

## ------------------------------------------------------------------------
A <- c(20, 20, 26, 25, 22, 23)
B <- c(28, 25, 24, 27, 30, 30, 29)

SMD(A_data = A, B_data = B, improvement = "increase")

SMD(A_data = A, B_data = B, improvement = "decrease")

## ------------------------------------------------------------------------
SMD(A_data = A, B_data = B, std_dev = "baseline")
SMD(A_data = A, B_data = B, std_dev = "pool")

## ------------------------------------------------------------------------
A <- c(20, 20, 26, 25, 22, 23)
B <- c(28, 25, 24, 27, 30, 30, 29)
LRRi(A_data = A, B_data = B, scale = "percentage")

LRRi(A_data = A, B_data = B, improvement = "decrease", scale = "percentage")

## ------------------------------------------------------------------------
A <- c(20, 20, 26, 25, 22, 23)
B <- c(28, 25, 24, 27, 30, 30, 29)
LRRi(A_data = A, B_data = B, scale = "count")
LRRi(A_data = A, B_data = B, scale = "count", improvement = "decrease")

## ------------------------------------------------------------------------
A <- c(0, 0, 0, 0)
B <- c(28, 25, 24, 27, 30, 30, 29)
LRRd(A_data = A, B_data = B, scale = "rate")
LRRd(A_data = A, B_data = B, scale = "rate", observation_length = 30)

## ------------------------------------------------------------------------
LRRd(A_data = A, B_data = B, scale = "percentage")
LRRd(A_data = A, B_data = B, scale = "percentage", intervals = 180)

## ------------------------------------------------------------------------
A_pct <- c(20, 20, 25, 25, 20, 25)
B_pct <- c(30, 25, 25, 25, 35, 30, 25)

LOR(A_data = A_pct, B_data = B_pct, scale = "percentage")

LOR(A_data = A_pct/100, B_data = B_pct/100, scale = "proportion")

LOR(A_data = A_pct, B_data = B_pct, scale = "count")

LOR(A_data = A_pct, B_data = B_pct, scale = "proportion")


## ------------------------------------------------------------------------
LOR(A_data = A_pct, B_data = B_pct,
    scale = "percentage", improvement = "increase")

LOR(A_data = A_pct, B_data = B_pct,
    scale = "percentage", improvement = "decrease")

## ------------------------------------------------------------------------
LOR(A_data = c(0,0,0), B_data = B_pct,
   scale = "percentage")
LOR(A_data = c(0,0,0), B_data = B_pct,
    scale = "percentage", intervals = 20)

## ------------------------------------------------------------------------
A <- c(20, 20, 26, 25, 22, 23)
B <- c(28, 25, 24, 27, 30, 30, 29)
calc_ES(A_data = A, B_data = B, ES = c("NAP","PND","Tau-U"))

## ------------------------------------------------------------------------
phase <- c(rep("A", length(A)), rep("B", length(B)))
outcome <- c(A, B)
calc_ES(condition = phase, outcome = outcome, baseline_phase = "A", 
        ES = c("NAP","PND","Tau-U"))

## ------------------------------------------------------------------------
calc_ES(A_data = A, B_data = B, ES = "all")

## ------------------------------------------------------------------------
calc_ES(A_data = A, B_data = B, ES = "NOM")

## ------------------------------------------------------------------------
calc_ES(A_data = A, B_data = B, ES = "parametric")

## ------------------------------------------------------------------------
calc_ES(A_data = A, B_data = B, ES = "NOM", improvement = "decrease")


## ------------------------------------------------------------------------
calc_ES(A_data = A, B_data = B, ES = "NOM", improvement = "decrease", confidence = NULL)


## ------------------------------------------------------------------------
calc_ES(A_data = A, B_data = B, ES = "parametric", scale = "count")

## ------------------------------------------------------------------------
calc_ES(A_data = A, B_data = B, ES = c("NAP","PND","SMD"))

calc_ES(A_data = A, B_data = B, ES = c("NAP","PND","SMD"), format = "wide")

## ------------------------------------------------------------------------
data(McKissick)

## ---- echo = FALSE-------------------------------------------------------
knitr::kable(head(McKissick, n = 10))

## ------------------------------------------------------------------------
data(Schmidt2007)

## ---- echo = F-----------------------------------------------------------
knitr::kable(head(Schmidt2007[,c("Case_pseudonym", "Behavior_type", "Session_number", "Outcome", "Condition", "Phase_num", "Metric", "Session_length", "direction", "n_Intervals")], n = 10), longtable = TRUE) %>%
  kable_styling() %>%
  scroll_box(width = "100%")

## ------------------------------------------------------------------------
args(batch_calc_ES)

## ------------------------------------------------------------------------
mckissick_ES <- batch_calc_ES(dat = McKissick,
              grouping = Case_pseudonym, 
              condition = Condition,
              outcome = Outcome, 
              improvement = "decrease",
              ES = c("NAP", "PND"))

## ---- echo = F-----------------------------------------------------------
kable(mckissick_ES) 

## ------------------------------------------------------------------------
schmidt_ES <- batch_calc_ES(dat = Schmidt2007,
              grouping = c(Case_pseudonym, Behavior_type, Phase_num), 
              condition = Condition,
              outcome = Outcome, 
              improvement = direction,
              ES = c("NAP", "PND"))

## ---- echo = F-----------------------------------------------------------
kable(schmidt_ES) %>%
   kable_styling() %>%
  scroll_box(width = "100%", height = "800px")

## ------------------------------------------------------------------------
mckissick_ES <- batch_calc_ES(dat = McKissick,
              grouping = Case_pseudonym, 
              condition = Condition,
              outcome = Outcome, 
              improvement = "decrease",
              scale = "count",
              observation_length = 20,
              ES = "parametric")

## ---- echo = F-----------------------------------------------------------
kable(mckissick_ES)

## ------------------------------------------------------------------------
schmidt_ES <- batch_calc_ES(dat = Schmidt2007,
              grouping = c(Case_pseudonym, Behavior_type, Phase_num), 
              condition = Condition,
              outcome = Outcome, 
              improvement = direction,
              scale = Metric,
              observation_length = Session_length,
              intervals = n_Intervals,
              ES = c("parametric"))

## ------------------------------------------------------------------------
kable(schmidt_ES) %>%
   kable_styling() %>%
  scroll_box(width = "100%", height = "800px")

## ------------------------------------------------------------------------
mckissick_wide_ES <- batch_calc_ES(dat = McKissick,
              grouping = Case_pseudonym, 
              condition = Condition,
              outcome = Outcome, 
              improvement = "decrease",
              ES = c("NAP", "PND"),
              format = "wide")

## ---- echo = F-----------------------------------------------------------
kable(mckissick_wide_ES)

## ------------------------------------------------------------------------
batch_calc_ES(dat = McKissick,
              grouping = Case_pseudonym, 
              condition = Condition,
              outcome = Outcome, 
              improvement = "decrease",
              scale = "count",
              observation_length = 20,
              ES = c("LRRi","LOR"),
              warn = FALSE)

## ------------------------------------------------------------------------
batch_calc_ES(dat = McKissick, 
              grouping = Case_pseudonym, 
              condition = Condition,
              outcome = Outcome, 
              ES = "SMD", 
              improvement = "decrease")

batch_calc_ES(dat = McKissick, 
              grouping = Case_pseudonym, 
              condition = Condition,
              outcome = Outcome, 
              ES = "SMD", 
              improvement = "decrease",
              std_dev = "pool")

## ------------------------------------------------------------------------
batch_calc_ES(dat = McKissick, 
              grouping = Case_pseudonym, 
              condition = Condition,
              outcome = Outcome, 
              ES = "parametric", 
              improvement = "decrease",
              scale = Procedure, 
              observation_length = Session_length,
              bias_correct = FALSE,
              warn = FALSE)

## ------------------------------------------------------------------------
batch_calc_ES(dat = McKissick, 
              grouping = Case_pseudonym, 
              condition = Condition,
              outcome = Outcome, 
              ES = "parametric", 
              improvement = "decrease",
              scale = Procedure, 
              observation_length = Session_length,
              confidence = NULL,
              warn = FALSE)

