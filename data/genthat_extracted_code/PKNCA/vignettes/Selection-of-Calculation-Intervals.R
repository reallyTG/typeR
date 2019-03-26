## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo=TRUE,
                      fig.width=6,
                      fig.height=4)
library(cowplot)
library(PKNCA)
library(knitr)
source("../tests/testthat/generate.data.R")

## ----intro_interval_plot, echo=FALSE-------------------------------------
# Simulate concentration-time data and setup the PKNCAconc object
d.conc <-
  PKNCAconc(
    generate.conc(nsub=1,
                  ntreat=1,
                  time.points=c(0, 1, 2, 4, 6, 8, 12, 24, 36, 48),
                  nstudies=1,
                  nanalytes=1,
                  resid=0),
    conc~time|treatment+ID)
print(d.conc)
# Use superposition to simulate multiple doses
d.conc.multi <-
  superposition(d.conc,
                tau=168,
                dose.times=seq(0, 168-24, by=24),
                n.tau=1)
# Plot the concentration-time data and the interval
ggplot(d.conc.multi, aes(x=time, y=conc)) +
  geom_ribbon(data=d.conc.multi[d.conc.multi$time >= 144,],
              aes(ymax=conc, ymin=0),
              fill="skyblue") +
  geom_point() + geom_line() +
  scale_x_continuous(breaks=seq(0, 168, by=12)) +
  scale_y_continuous(limits=c(0, NA)) +
  labs(x="Time Since First Dose (hr)",
       y="Concentration\n(arbitrary units)")

## ----intro_interval_spec-------------------------------------------------
my.intervals <- data.frame(start=144, end=168, auclast=TRUE)
knitr::kable(my.intervals)

PKNCAdata(d.conc, intervals=my.intervals)

## ----select_group--------------------------------------------------------
my.intervals <- data.frame(treatment=c("Drug 1 Single", "Drug 1 Multiple", "Drug 1 Multiple"),
                           start=c(0, 0, 216),
                           end=c(Inf, 24, 240),
                           aucinf.obs=c(TRUE, FALSE, FALSE),
                           auclast=c(FALSE, TRUE, TRUE))
knitr::kable(my.intervals)

## ----infinity_interval_plot, echo=FALSE----------------------------------
# Simulate concentration-time data and setup the PKNCAconc object
d.conc <-
  PKNCAconc(
    generate.conc(nsub=1,
                  ntreat=1,
                  time.points=c(0, 1, 2, 4, 6, 8, 12, 24, 36, 48),
                  nstudies=1,
                  nanalytes=1,
                  resid=0),
    conc~time|treatment+ID)
print(d.conc)
# Use superposition to simulate multiple doses
ggplot(d.conc$data[d.conc$data$time <= 48,], aes(x=time, y=conc)) +
  geom_ribbon(data=d.conc$data,
              aes(ymax=conc, ymin=0),
              fill="skyblue") +
  geom_point() + geom_line() +
  scale_x_continuous(breaks=seq(0, 72, by=12)) +
  scale_y_continuous(limits=c(0, NA)) +
  labs(x="Time Since First Dose (hr)",
       y="Concentration\n(arbitrary units)")

## ----infinity_interval_spec----------------------------------------------
my.intervals <- data.frame(start=0,
                           end=Inf,
                           auclast=TRUE,
                           aucinf.obs=TRUE)
print(my.intervals)

my.data <- PKNCAdata(d.conc, intervals=my.intervals)

## ----multiple_intervals_plot, echo=FALSE---------------------------------
# Simulate concentration-time data and setup the PKNCAconc object
d.conc <-
  PKNCAconc(
    generate.conc(nsub=1,
                  ntreat=1,
                  time.points=c(0, 1, 2, 4, 6, 8, 12, 24, 36, 48),
                  nstudies=1,
                  nanalytes=1,
                  resid=0),
    conc~time|treatment+ID)
print(d.conc)
# Use superposition to simulate multiple doses
d.conc.multi <-
  superposition(d.conc,
                tau=168,
                dose.times=seq(0, 168-24, by=24),
                n.tau=1)
# Plot the concentration-time data and the interval
ggplot(d.conc.multi, aes(x=time, y=conc)) +
  geom_ribbon(data=d.conc.multi[d.conc.multi$time <= 24,],
              aes(ymax=conc, ymin=0),
              fill="skyblue") +
  geom_ribbon(data=d.conc.multi[d.conc.multi$time >= 144,],
              aes(ymax=conc, ymin=0),
              fill="lightgreen") +
  geom_point() + geom_line() +
  scale_x_continuous(breaks=seq(0, 168, by=12)) +
  scale_y_continuous(limits=c(0, NA)) +
  labs(x="Time Since First Dose (hr)",
       y="Concentration\n(arbitrary units)")

## ----multiple_intervals_spec---------------------------------------------
my.intervals <- data.frame(start=c(0, 144),
                           end=c(24, 168),
                           auclast=TRUE)
knitr::kable(my.intervals)

my.data <- PKNCAdata(d.conc, intervals=my.intervals)

## ----overlapping_intervals_plot, echo=FALSE------------------------------
# Simulate concentration-time data and setup the PKNCAconc object
d.conc <-
  PKNCAconc(
    generate.conc(nsub=1,
                  ntreat=1,
                  time.points=c(0, 1, 2, 4, 6, 8, 12, 24, 36, 48),
                  nstudies=1,
                  nanalytes=1,
                  resid=0),
    conc~time|treatment+ID)
print(d.conc)
# Use superposition to simulate multiple doses
ggplot(d.conc$data, aes(x=time, y=conc)) +
  geom_ribbon(data=d.conc$data,
              aes(ymax=conc, ymin=0),
              fill="lightgreen",
              alpha=0.5) +
  geom_ribbon(data=d.conc$data[d.conc$data$time <= 24,],
              aes(ymax=conc, ymin=0),
              fill="skyblue",
              alpha=0.5) +
  geom_point() + geom_line() +
  scale_x_continuous(breaks=seq(0, 168, by=12)) +
  scale_y_continuous(limits=c(0, NA)) +
  labs(x="Time Since First Dose (hr)",
       y="Concentration\n(arbitrary units)")

## ----overlapping_intervals_spec------------------------------------------
my.intervals <- data.frame(start=0,
                           end=c(24, Inf),
                           auclast=TRUE,
                           aucinf.obs=c(FALSE, TRUE))
knitr::kable(my.intervals)

my.data <- PKNCAdata(d.conc, intervals=my.intervals)

## ----interval_yes_no, echo=FALSE-----------------------------------------
ggplot_intervals <- function(definition, intervals) {
  intervals$within <-
    c("No", "Yes")[intervals$interval.start >= min(definition$start.x) &
                     intervals$interval.end >= max(definition$start.x)]
  intervals$within <-
    factor(intervals$within, levels=c("Yes", "No"))
  ggplot(intervals,
         aes(x=interval.start,
             xend=interval.end,
             y=y,
             yend=y,
             linetype=within)) +
    geom_segment() +
    geom_segment(data=definition,
                 mapping=aes(x=start.x, xend=start.x, y=start.y, yend=end.y),
                 arrow=arrow(),
                 inherit.aes=FALSE) +
    geom_point(aes(x=interval.start, y=1),
               shape="|",
               size=4) +
    geom_point(aes(x=max(interval.end), y=1),
               shape="|",
               size=4) +
    scale_y_continuous(breaks=NULL) +
    labs(x="Time",
         y=NULL)
}

interval_definition <-
  data.frame(start.x=c(0, 24),
             start.y=0.5,
             end.y=0.9)
show_intervals <-
  data.frame(interval.start=c(0, 4, 12, 24),
             interval.end=c(4, 12, 24, 48),
             y=1)
ggplot_intervals(interval_definition,
                 show_intervals)

interval_definition <-
  data.frame(start.x=c(0, 16),
             start.y=0.5,
             end.y=0.9)
show_intervals <-
  data.frame(interval.start=c(0, 4, 12, 24),
             interval.end=c(4, 12, 24, 48),
             y=1)
ggplot_intervals(interval_definition,
                 show_intervals)


