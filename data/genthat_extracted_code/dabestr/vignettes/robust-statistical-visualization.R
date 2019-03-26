## ----create.data1, message=FALSE, echo=FALSE, results='hide'-------------
library(dplyr)
set.seed(12345)

sampleN     <- 20

control_pop <- rnorm(10000, mean = 3,   sd = 0.5)
test_pop    <- rnorm(10000, mean = 3.2, sd = 0.5)

sample1     <- sample(control_pop, sampleN)
sample2     <- sample(test_pop,    sampleN)

id          <- seq(1: sampleN)
gender      <- c(rep('Male', sampleN/2), rep('Female', sampleN/2))



my.data <-
  tibble::tibble(Control = sample1, Test = sample2, 
                 ID = id, Gender = gender) %>%
  tidyr::gather(key = Group, value = Value, -ID, -Gender)


plot.frame <-
  my.data %>% 
  group_by(Group) %>% 
  summarise(mean = mean(Value),
            max  = max(Value),
            std  = sd(Value),
            sem  = sqrt(var(Value) / length(Value)),
            ci   = 1.96 * sem
            )

t.test.result <- t.test(sample1, sample2)

t.test.result$p.value # check if it is around 0.01.

## ----create.themes, message=FALSE, echo=FALSE----------------------------
library(ggplot2)


estimation.plot.theme <-
  theme_classic() +
  theme(
    text                  =  element_text(family = "Work Sans"),
    axis.text             =  element_text(size = 13),
    axis.title            =  element_text(size = 15),
    
    axis.ticks.length     =  unit(7, "points"),
    axis.line.x.bottom    =  element_blank(),
    axis.ticks.x.bottom   =  element_blank(),
    axis.title.x.bottom   =  element_blank()
    )

non.floating.theme <-
  estimation.plot.theme +
  theme(
    panel.background      =  element_rect(fill = "#fffff8"),
    plot.background       =  element_rect(fill = "#fffff8"),
    legend.background     =  element_rect(fill = "#fffff8"),
    legend.box.background =  element_rect(fill = "#fffff8")
    )

floating.theme <-
  non.floating.theme +
  theme(
    axis.title.x.bottom  =  element_blank(),
    axis.ticks.x.bottom  =  element_blank()
    )

custom.fill   <- scale_fill_manual(values=c("#1F77B4", "#FF7F0E"))
custom.colour <- scale_color_manual(values=c("#1F77B4", "#FF7F0E"))


## ----barplot, message=FALSE, echo=FALSE, fig.width = 7, fig.height = 4----

max.U.connector    <- 5
annotate.x.pos     <- 2.7
annotate.text.size <- 5

ggplot(plot.frame, aes(x = Group, y = mean)) +
  
  estimation.plot.theme +
  
  geom_col(aes(fill = Group), width = 0.5) +
  
  scale_fill_brewer(palette="Dark2") +
  
  geom_errorbar(width = 0.,
                aes(ymin = mean - std, 
                    ymax = mean + std)) +
  
  geom_segment(x    = 1, xend = 1,
               y    = plot.frame$mean[1] + 1, 
               yend = max.U.connector) +
  geom_segment(x    = 1, xend = 2,
               y    = max.U.connector, 
               yend = max.U.connector) +
  geom_segment(x    = 2, xend = 2,
               y    = plot.frame$mean[2] + 1, 
               yend = max.U.connector) +
  
  coord_cartesian(ylim    = c(0, max.U.connector + 0.5),
                  xlim    = c(0.4, 5),
                  expand = FALSE) +
  geom_segment(x    = 0.4,  xend = 2.5,
               y    = 0,  yend = 0) +
  
  
  annotate("text", x = 1.5, y = 5.1, label = "*", vjust = 0,
           family = "Work Sans", size = 8) +
  
  annotate("text", x = annotate.x.pos, size = annotate.text.size, 
           hjust = 0, color = 'red', family = "Work Sans",
           y = 5, label = "Hides all observed values") +
  annotate("text", x = annotate.x.pos, size = annotate.text.size, 
           hjust = 0, color = 'red', family = "Work Sans",
           y = 4, label = "Effect size not shown") +
  annotate("text", x = annotate.x.pos, size = annotate.text.size, 
           hjust = 0, color = 'red', family = "Work Sans",
           y = 3, label = "Effect size precision not shown") +
  annotate("text", x = annotate.x.pos, size = annotate.text.size, 
           hjust = 0, color = 'red', family = "Work Sans",
           y = 2, label = "Effect size confidence interval\nnot shown") +
  annotate("text", x = annotate.x.pos, size = annotate.text.size, 
           hjust = 0, color = 'red', family = "Work Sans",
           y = 0.75, label = "Creates false dichotomy\nwith 'Significance Asterisk'") +
  
  ylab("") + guides(fill=FALSE)
  
  

## ----boxplot, message=FALSE, echo=FALSE, fig.width = 7, fig.height = 4----
ggplot(my.data, aes(x = Group, y = Value)) +
  
  estimation.plot.theme +
  
  geom_boxplot(aes(fill = Group)) +
  
  scale_fill_brewer(palette="Dark2") +
  
  geom_segment(x    = 1, xend = 1,
               y    = plot.frame$max[1] + 0.15, 
               yend = max.U.connector) +
  geom_segment(x    = 1, xend = 2,
               y    = max.U.connector, 
               yend = max.U.connector) +
  geom_segment(x    = 2, xend = 2,
               y    = plot.frame$max[2] + 0.15, 
               yend = max.U.connector) +
  
  coord_cartesian(ylim    = c(0, max.U.connector + 0.5),
                  xlim    = c(0.4, 5),
                  expand = FALSE) +
  geom_segment(x    = 0.4,  xend = 2.5,
               y    = 0,  yend = 0) +
  
  
  annotate("text", x = 1.5, y = 5.1, label = "P < 0.05", vjust = 0,
           family = "Work Sans", size = 5) +
  
  annotate("text", x = annotate.x.pos, size = annotate.text.size, 
           hjust = 0, color = 'darkgreen', family = "Work Sans",
           y = 5, label = "Medians, quartiles,") +
  annotate("text", x = annotate.x.pos, size = annotate.text.size, 
           hjust = 0, color = 'darkgreen', family = "Work Sans",
           y = 4.7, label = "minima, and maxima shown,") +
  annotate("text", x = annotate.x.pos, size = annotate.text.size, 
           hjust = 0, color = 'red', family = "Work Sans",
           y = 4.4, label = "but all observations not shown") +
  
  annotate("text", x = annotate.x.pos, size = annotate.text.size, 
           hjust = 0, color = 'red', family = "Work Sans",
           y = 3.75, label = "Effect size not shown") +
  annotate("text", x = annotate.x.pos, size = annotate.text.size, 
           hjust = 0, color = 'red', family = "Work Sans",
           y = 3, label = "Effect size precision not shown") +
  annotate("text", x = annotate.x.pos, size = annotate.text.size, 
           hjust = 0, color = 'red', family = "Work Sans",
           y = 2, label = "Effect size confidence interval\nnot shown") +
  annotate("text", x = annotate.x.pos, size = annotate.text.size, 
           hjust = 0, color = 'red', family = "Work Sans",
           y = 1, label = "Creates false dichotomy\nwith P value threshold") +
  
  ylab("") + guides(fill=FALSE)

## ----jitter.plot, message=FALSE, echo=FALSE, fig.width = 7, fig.height = 4----

pval.round <- signif(t.test.result$p.value, 2)

ggplot(my.data, aes(x = Group, y = Value)) +
  
  estimation.plot.theme +
  
  geom_jitter(aes(colour = Group), width = 0.25) +
  
  scale_color_brewer(palette="Dark2") +
  
  geom_segment(x    = 1, xend = 1,
               y    = plot.frame$max[1] + 0.15, 
               yend = max.U.connector) +
  geom_segment(x    = 1, xend = 2,
               y    = max.U.connector, 
               yend = max.U.connector) +
  geom_segment(x    = 2, xend = 2,
               y    = plot.frame$max[2] + 0.15, 
               yend = max.U.connector) +
  
  coord_cartesian(ylim    = c(0, max.U.connector + 0.5),
                  xlim    = c(0.4, 5),
                  expand = FALSE) +
  geom_segment(x    = 0.4,  xend = 2.5,
               y    = 0,  yend = 0) +
  
  
  annotate("text", x = 1.5, y = 5.1, size = 4, vjust = 0,
           family = "Work Sans",
           label = stringr::str_interp("P = ${pval.round}")) +
  
  annotate("text", x = annotate.x.pos, size = annotate.text.size, 
           hjust = 0, color = 'darkgreen', family = "Work Sans",
           y = 5, label = "All observed values shown,") +
  annotate("text", x = annotate.x.pos, size = annotate.text.size, 
           hjust = 0, color = 'red', family = "Work Sans",
           y = 4.7, label = "but underlying distribution,") +
  annotate("text", x = annotate.x.pos, size = annotate.text.size, 
           hjust = 0, color = 'red', family = "Work Sans",
           y = 4.4, label = "not accurately depicted") +
  
  annotate("text", x = annotate.x.pos, size = annotate.text.size, 
           hjust = 0, color = 'red', family = "Work Sans",
           y = 3.75, label = "Effect size not shown") +
  annotate("text", x = annotate.x.pos, size = annotate.text.size, 
           hjust = 0, color = 'red', family = "Work Sans",
           y = 3, label = "Effect size precision not shown") +
  annotate("text", x = annotate.x.pos, size = annotate.text.size, 
           hjust = 0, color = 'red', family = "Work Sans",
           y = 2, label = "Effect size confidence interval\nnot shown") +
  annotate("text", x = annotate.x.pos, size = annotate.text.size, 
           hjust = 0, color = 'red', family = "Work Sans",
           y = 1, label = "Creates false dichotomy\nwith P value threshold") +
  
  ylab("") + guides(colour=FALSE)

## ----estimation.plot, warning=FALSE, message=FALSE, echo=FALSE, fig.width = 6, fig.height = 8----
library(dabestr)


gardner.altman <- 
  dabest(my.data, x = Group, y = Value, 
         idx = c("Control", "Test"),
         paired = FALSE) %>%
  plot(palette = "Dark2",
       theme = estimation.plot.theme,
       rawplot.type = 'swarmplot',
       width = 0.1
       # rawplot.markersize = 6,
       # effsize.markersize = 8
       )


annotation <- 
  ggplot() +
  estimation.plot.theme +
  theme(axis.text  = element_blank(),
        axis.line  = element_blank(),
        axis.ticks = element_blank()) +
  coord_cartesian(ylim   = c(0.5, 5.5),
                  xlim   = c(0, 2),
                  expand = FALSE) +
  
  annotate("text", x = 0.1, size = annotate.text.size, 
           hjust = 0, color = 'darkgreen', family = "Work Sans",
           y = 5, label = "All observed values shown")+

  annotate("text", x = 0.1, size = annotate.text.size, 
           hjust = 0, color = 'darkgreen', family = "Work Sans",
           y = 4, label = "Effect size is shown") +
  
  annotate("text", x = 0.1, size = annotate.text.size, 
           hjust = 0, color = 'darkgreen', family = "Work Sans",
           y = 3, label = "Effect size precision is displayed.") +
  
  annotate("text", x = 0.1, size = annotate.text.size, 
           hjust = 0, color = 'darkgreen', family = "Work Sans",
           y = 2, label = "Confidence and likelihood of effect size are shown") +
  
  annotate("text", x = 0.1, size = annotate.text.size, 
           hjust = 0, color = 'darkgreen', family = "Work Sans",
           y = 1, label = "No significance testing shown, so no false dichotomy") +
  
  ylab("") + guides(colour=FALSE)

cowplot::plot_grid(gardner.altman, annotation, nrow = 2)


## ----gardner.altman.unpaired, warning=FALSE, message=FALSE, echo=FALSE, fig.width = 6, fig.height = 4----


two.group.unpaired <- 
  my.data %>%
  dabest(Group, Value, 
         # The idx below passes "Control" as the control group, 
         # and "Group1" as the test group. The mean difference
         # will be computed as mean(Group1) - mean(Control1).
         idx = c("Control", "Test"), 
         paired = FALSE)

plot(two.group.unpaired, theme = estimation.plot.theme, color.column = Gender)


## ----gardner.altman.paired, warning=FALSE, message=FALSE, echo=FALSE, fig.width = 6, fig.height = 4----
two.group.paired <- 
  my.data %>%
  dabest(Group, Value, 
         idx = c("Control", "Test"), 
         paired = TRUE, id.col = ID)

plot(two.group.paired, theme = estimation.plot.theme, color.column = Gender)

## ----create.data2, message=FALSE, echo=FALSE-----------------------------
set.seed(12345)

N = 20
control1_pop <- rnorm(10000, mean = 3,   sd = 0.5)
control2_pop <- rnorm(10000, mean = 3,   sd = 1  )

test1_pop    <- rnorm(10000, mean = 3.2, sd = 0.5)
test2_pop    <- rnorm(10000, mean = 2.8, sd = 0.5)
test3_pop    <- rnorm(10000, mean = 3.2, sd = 1.5)
test4_pop    <- rnorm(10000, mean = 2.8, sd = 1  )
test5_pop    <- rnorm(10000, mean = 2.8, sd = 0.5)

c1     <- sample(control1_pop, sampleN)
c2     <- sample(control2_pop, sampleN)
g1     <- sample(test1_pop,    sampleN)
g2     <- sample(test2_pop,    sampleN)
g3     <- sample(test3_pop,    sampleN)
g4     <- sample(test4_pop,    sampleN)
g5     <- sample(test5_pop,    sampleN)


id          <- 1: sampleN
gender      <- c(rep('Male', sampleN/2), rep('Female', sampleN/2))


wide.data <- 
  tibble::tibble(
    Control1 = c1, Control2 = c2,
    Group1 = g1, Group2 = g2, Group3 = g3, Group4 = g4, Group5 = g5,
    Gender = gender, ID = id)


tidy.data   <- 
  wide.data %>%
  tidyr::gather(key = Group, value = Value, -ID, -Gender)

## ----multi.two.group.unpaired, warning=FALSE, message=FALSE, echo=FALSE, fig.width = 9, fig.height = 5----

multi.two.group.unpaired <- 
  tidy.data %>%
  dabest(Group, Value, 
         idx = list(c("Control1", "Group1"), 
                    c("Control2", "Group2"),
                    c("Group3", "Group4")),
         paired = FALSE
  )

plot(multi.two.group.unpaired, theme = estimation.plot.theme,
     tick.fontsize = 13, axes.title.fontsize = 15,
     color.column = Gender)

## ----multi.two.group.paired, warning=FALSE, message=FALSE, echo=FALSE, fig.width = 9, fig.height = 5----

multi.two.group.paired <- 
  tidy.data %>%
  dabest(Group, Value, 
         idx = list(c("Control1", "Group1"), 
                    c("Control2", "Group2"),
                    c("Group3", "Group4")),
         paired = TRUE, id.col = ID
  )

plot(multi.two.group.paired, theme = estimation.plot.theme,
     tick.fontsize = 13, axes.title.fontsize = 15,
     color.column = Gender)

## ----shared.control, warning=FALSE, message=FALSE, echo=FALSE, fig.width = 9, fig.height = 5----

shared.control <- 
  tidy.data %>%
  dabest(Group, Value, 
         idx = c("Control1", "Group1", "Group2", "Group3", "Group4"),
         paired = FALSE
  )

plot(shared.control, theme = estimation.plot.theme, 
     tick.fontsize = 13, axes.title.fontsize = 15,
     color.column = Gender)


