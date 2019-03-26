## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(GCalcium)

## ------------------------------------------------------------------------
GCaMP.form <- format_data(GCaMP)

### Old table
GCaMP[1:5, 1:5]

### New table
GCaMP.form[1:5, 1:5]

## ------------------------------------------------------------------------
peak.indices <- find_peaks(GCaMP.form$Trial1, n.points = 10)

## Subset using indexing
peaks.df <- data.frame(
  times = GCaMP.form$Time[peak.indices],
  vals = GCaMP.form$Trial1[peak.indices]
)

head(peaks.df, 4)

## ------------------------------------------------------------------------
inf.pts <- inflect_points(GCaMP.form$Trial1)

print(inf.pts[1:46])

## ------------------------------------------------------------------------
df.1thru5 <- averaged_trials(GCaMP.form, 1:5)

plot(x = df.1thru5$Time, df.1thru5$Values, type = 'l',
     xlab = 'Time (s)', ylab = 'Values')

## ------------------------------------------------------------------------
avg.slopes <- avg_curve_slope(Dataframe = GCaMP.form, Trial = 2)
print(avg.slopes[1:25])

## ------------------------------------------------------------------------
between_trial_change(Dataframe = GCaMP.form, TrialRange1 = c(1, 5), TrialRange2 = c(6, 10), Time.period = c(0, 4))

## ------------------------------------------------------------------------
### Trial 2
centered_AUC(Dataframe = GCaMP.form, Trial = 2, FUN = mean)[1:10,]

### Trial 4
centered_AUC(Dataframe = GCaMP.form, Trial = 4, FUN = mean)[1:10,]

## ------------------------------------------------------------------------
consecutive_trial_change(Dataframe = GCaMP.form, Trials = c(1, 10), Time.period = c(0, 4)) 

## ------------------------------------------------------------------------
inf.pts.df <- inflect_points_df(Dataframe = GCaMP.form, Trial = 1)
head(inf.pts.df, 6)

## ------------------------------------------------------------------------
moving_window(Dataframe = GCaMP.form, Trial = 5, Window.length = 1, FUN = mean)

## ------------------------------------------------------------------------
perc_baseline(Dataframe = GCaMP.form, Baseline.times = c(-3, -1), Baseline.frame = FALSE)[1:3, 1:4]

## ------------------------------------------------------------------------
within_trial_change(Dataframe = GCaMP.form, Trial = 1, Beg.period = c(-2, 0), End.period = c(0, 2))

## ------------------------------------------------------------------------
### Extract values
basevals <- GCaMP.form$Trial1[GCaMP.form$Time <= 0]
eventvals <- GCaMP.form$Trial1[GCaMP.form$Time > 0]

### Find baseline (pre-epoc) values
base.mu <- mean(basevals)
base.sigma <- sd(basevals)

### Compute centered z-scores
z.scores <- z_score(x = eventvals, mu = base.mu, sigma = base.sigma)

print(z.scores[1:30])

## ----fig4, fig.height = 4, fig.width = 7---------------------------------
my.trials <- c(1, 2, 9, 10)
plot_trials(Dataframe = GCaMP.form, Trials = my.trials)

