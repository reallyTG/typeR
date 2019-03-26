## ----global_options, include=FALSE---------------------------------------
library(ggplot2)
library(gridExtra)
library(itsadug)
knitr::opts_chunk$set(fig.width=6, fig.height=4, fig.align="center", warning=FALSE)

## ---- eval = TRUE, echo=FALSE, results='hide', message=FALSE-------------
library(VWPre)
data(VWdat)
dat <- fasttrack(data = VWdat, Subject = "RECORDING_SESSION_LABEL", Item = "itemid", 
	EventColumns = c("Subject", "TRIAL_INDEX"), NoIA = 4, Adjust = 100, Recording = "LandR", 
  WhenLandR = "Right", BinSize = 50, SamplingRate = 1000,
  ObsPerBin = 50, Constant = 0.5, Output = "ELogit")

## ---- eval= TRUE, fig.show='hold', results='asis', message=FALSE---------
plot_avg(data = dat, type = "proportion", xlim = c(0, 1000), 
    IAColumns = c(IA_1_P = "Target", IA_2_P = "Rhyme", IA_3_P = "OnsetComp", 
                  IA_4_P = "Distractor"),
    Condition1 = NULL, Condition2 = NULL, Cond1Labels = NA, Cond2Labels = NA,
    ErrorBar = TRUE, VWPreTheme = TRUE) 

## ---- eval= TRUE, fig.show='hold', results='asis', message=FALSE---------
plot_avg(data = dat, type = "proportion", xlim = c(0, 1000), 
    IAColumns = c(IA_1_P = "Target", IA_2_P = "Rhyme", IA_3_P = "OnsetComp", 
                  IA_4_P = "Distractor"),
    Condition1 = NULL, Condition2 = NULL, Cond1Labels = NA, Cond2Labels = NA,
    ErrorBar = TRUE, VWPreTheme = TRUE) + ggtitle("Averaged Data")

## ---- eval= TRUE, fig.show='hold', results='asis', message=FALSE---------
plot_avg(data = dat, type = "proportion", xlim = c(0, 1000), 
    IAColumns = c(IA_1_P = "Target", IA_2_P = "Rhyme", IA_3_P = "OnsetComp", 
                  IA_4_P = "Distractor"),
    Condition1 = NULL, Condition2 = NULL, Cond1Labels = NA, Cond2Labels = NA,
    ErrorBar = TRUE, VWPreTheme = FALSE) + theme(axis.text = element_text(size = 15))

## ---- eval= TRUE, fig.show='hold', fig.height=5, results='asis', message=FALSE----
plot_avg(data = dat, type = "proportion", xlim = c(0, 1000), 
    IAColumns = c(IA_1_P = "Target", IA_2_P = "Rhyme", IA_3_P = "OnsetComp", 
                  IA_4_P = "Distractor"), Condition1 = "talker", 
    Condition2 = NULL, Cond1Labels = c(CH1 = "Chinese 1", CH10 = "Chinese 3", 
                                     CH9 = "Chinese 2", EN3 = "English 1"),
    Cond2Labels = NA, ErrorBar = TRUE, VWPreTheme = TRUE)

## ---- eval= TRUE, fig.show='hold', fig.width=7, fig.height=3.5, results='asis', message=FALSE----
plot_avg(data = dat, type = "proportion", xlim = c(0, 1000), 
    IAColumns = c(IA_1_P = "Target", IA_2_P = "Rhyme", IA_3_P = "OnsetComp", 
                  IA_4_P = "Distractor"), Condition1 = NULL, 
    Condition2 = "talker", Cond1Labels = NA, Cond2Labels = c(CH1 = "Chinese 1", 
                                                             CH10 = "Chinese 3", 
                                                             CH9 = "Chinese 2", 
                                                             EN3 = "English 1"), 
    ErrorBar = TRUE, VWPreTheme = TRUE)

## ---- eval= TRUE, fig.show='hold', fig.width=7, fig.height=5, results='asis', message=FALSE----
plot_avg(data = dat, type = "proportion", xlim = c(0, 1000), 
    IAColumns = c(IA_1_P = "Target", IA_2_P = "Rhyme", IA_3_P = "OnsetComp", 
                  IA_4_P = "Distractor"), Condition1 = "talker", 
    Condition2 = "Exp", Cond1Labels = c(CH1 = "Chinese 1", CH10 = "Chinese 3", 
                                     CH9 = "Chinese 2", EN3 = "English 1"),
    Cond2Labels = c(High = "High Exp", Low = "Low Exp"), ErrorBar = TRUE, 
    VWPreTheme = TRUE)

## ---- eval= TRUE, fig.show='hold', fig.width=7, fig.height=8, results='asis', message=FALSE----
gridExtra::grid.arrange(

plot_avg(data = dat, type = "proportion", xlim = c(0, 1000), 
    IAColumns = c(IA_1_P = "Target", IA_2_P = "Rhyme", IA_3_P = "OnsetComp", 
                  IA_4_P = "Distractor"),
    Condition1 = NULL, Condition2 = NULL, Cond1Labels = NA, Cond2Labels = NA,
    ErrorBar = TRUE, VWPreTheme = TRUE),

plot_avg(data = dat, type = "proportion", xlim = c(0, 1000), 
    IAColumns = c(IA_1_P = "Target", IA_2_P = "Rhyme", IA_3_P = "OnsetComp", 
                  IA_4_P = "Distractor"),
    Condition1 = NULL, Condition2 = NULL, Cond1Labels = NA, Cond2Labels = NA,
    ErrorBar = FALSE, ErrorBand = TRUE, VWPreTheme = TRUE),
	
nrow=2, ncol=1)

## ---- eval= TRUE, fig.show='hold', fig.width=7, fig.height=8, results='asis', message=TRUE----
gridExtra::grid.arrange(

plot_avg(data = dat, type = "proportion", xlim = c(0, 1000), 
    IAColumns = c(IA_1_P = "Target", IA_2_P = "Rhyme", IA_3_P = "OnsetComp", 
                  IA_4_P = "Distractor"),
    Condition1 = NULL, Condition2 = NULL, Cond1Labels = NA, Cond2Labels = NA,
    ErrorBar = FALSE, ErrorBand = TRUE, ErrorType = "CI", ConfLev = 95, 
	CItype = "pointwise", VWPreTheme = TRUE), 

plot_avg(data = dat, type = "proportion", xlim = c(0, 1000), 
    IAColumns = c(IA_1_P = "Target", IA_2_P = "Rhyme", IA_3_P = "OnsetComp", 
                  IA_4_P = "Distractor"),
    Condition1 = NULL, Condition2 = NULL, Cond1Labels = NA, Cond2Labels = NA,
    ErrorBar = FALSE, ErrorBand = TRUE, ErrorType = "CI", ConfLev = 95, 
	CItype = "simultaneous", VWPreTheme = TRUE),
	
nrow=2, ncol=1)

## ---- eval= TRUE, fig.show='hold', fig.height=5, results='asis', message=FALSE----
plot_avg(data = dat, type = "proportion", xlim = c(0, 1000), 
    IAColumns = c(IA_1_P = "Target"), Condition1 = "talker", 
    Condition2 = NULL, Cond1Labels = c(CH1 = "Chinese 1", CH10 = "Chinese 3", 
                                     CH9 = "Chinese 2", EN3 = "English 1"),
    Cond2Labels = NA, ErrorBar = TRUE, VWPreTheme = TRUE)

## ---- eval= TRUE, fig.show='hold', results='asis', message=FALSE---------
plot_avg(data = dat, type = "proportion", xlim = c(0, 1000), 
    IAColumns = c(IA_1_P = "Target", IA_2_P = "Rhyme", IA_3_P = "OnsetComp", 
                  IA_4_P = "Distractor"),
    Condition1 = NULL, Condition2 = NULL, Cond1Labels = NA, Cond2Labels = NA,
    Averaging = "Subject", ErrorBar = TRUE, ErrorType = "SE", VWPreTheme = TRUE) 

## ---- eval= TRUE, fig.show='hold', fig.width=7, fig.height=8, results='asis', message=FALSE----
gridExtra::grid.arrange(

plot_avg_diff(data = dat, type = "proportion", xlim = c(0, 1000), 
              DiffCols = c(IA_1_P = "Target", IA_2_P = "Rhyme"), 
            Condition1 = NULL, Condition2 = NULL, Cond1Labels = NA,
            Cond2Labels = NA, ErrorBar = TRUE, VWPreTheme = TRUE),

plot_avg_diff(data = dat, type = "proportion", xlim = c(0, 1000), 
              DiffCols = c(IA_1_P = "Target", IA_2_P = "Rhyme"), 
            Condition1 = "talker", Condition2 = NULL, Cond1Labels = c(CH1 = "Chinese 1", 
            CH10 = "Chinese 3", CH9 = "Chinese 2", EN3 = "English 1"),
            Cond2Labels = NA, ErrorBar = TRUE, VWPreTheme = TRUE),

nrow=2, ncol=1)			

## ---- eval= TRUE, fig.show='hold', results='asis', message=FALSE---------
plot_avg_contour(data = dat, IA = "IA_1_P", type = "proportion", Var = "Rating", 
VarLabel = "Accent Rating", xlim = c(0,1000), VWPreTheme = TRUE, 
Colors = c("gray20", "gray90"))

## ---- eval= TRUE, fig.show='hold', results='asis', message=FALSE---------
plot_avg_contour(data = dat, IA = "IA_1_P", type = "proportion", Var = "Rating", 
VarLabel = "Accent Rating", xlim = c(0,1000), VWPreTheme = TRUE, 
Colors = c("red", "green")) + ggtitle("Looks to target")

## ---- eval= TRUE, results='asis', message=FALSE--------------------------
plt <- plot_avg(data = dat, type = "proportion", xlim = c(0, 1000), 
                IAColumns = c(IA_1_P = "Target", IA_2_P = "Rhyme", IA_3_P = "OnsetComp", 
                              IA_4_P = "Distractor"),
                Condition1 = NULL, Condition2 = NULL, Cond1Labels = NA, Cond2Labels = NA,
                ErrorBar = TRUE, VWPreTheme = TRUE) 

## ---- eval= TRUE, results='asis', message=FALSE--------------------------
df <- plt$data

## ---- eval= TRUE, echo=FALSE, results='asis', message=FALSE--------------
knitr::kable(head(df))

## ---- eval= TRUE, results='asis', message=FALSE--------------------------
model <- mgcv::bam(IA_1_ELogit ~ s(Time), data = dat)
pelogit <- make_pelogit_fnc(ObsPerBin=50, Constant=0.5)

df <- data.frame(Fitted = fitted(model), Backtransformed = pelogit(fitted(model)))

## ---- eval= TRUE, echo=FALSE, results='asis', message=FALSE--------------
knitr::kable(df[10:20,])

## ---- eval= TRUE, results='hide', fig.width=7, fig.height=8, message=FALSE----
par(mfrow=c(2,1))
itsadug::plot_smooth(model, view = "Time")
itsadug::plot_smooth(model, view = "Time", transform = pelogit)

## ---- eval=FALSE, echo=TRUE, results='asis'------------------------------
#  plot_transformation_app()

## ---- eval=FALSE, echo=TRUE, results='asis'------------------------------
#  plot_var_app(dat)

## ---- eval=FALSE, echo=TRUE, results='asis'------------------------------
#  plot_indiv_app(dat)

