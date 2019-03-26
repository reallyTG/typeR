## ----create.data, message=FALSE------------------------------------------
library(dplyr)

set.seed(54321)

N = 40
c1 <- rnorm(N, mean = 100, sd = 25)
c2 <- rnorm(N, mean = 100, sd = 50)
g1 <- rnorm(N, mean = 120, sd = 25)
g2 <- rnorm(N, mean = 80, sd = 50)
g3 <- rnorm(N, mean = 100, sd = 12)
g4 <- rnorm(N, mean = 100, sd = 50)
gender <- c(rep('Male', N/2), rep('Female', N/2))
id <- 1: N


wide.data <- 
  tibble::tibble(
    Control1 = c1, Control2 = c2,
    Group1 = g1, Group2 = g2, Group3 = g3, Group4 = g4,
    Gender = gender, ID = id)


my.data   <- 
  wide.data %>%
  tidyr::gather(key = Group, value = Measurement, -ID, -Gender)

head(my.data)

## ----two.group.unpaired--------------------------------------------------

library(dabestr)

two.group.unpaired <- 
  my.data %>%
  dabest(Group, Measurement, 
         # The idx below passes "Control" as the control group, 
         # and "Group1" as the test group. The mean difference
         # will be computed as mean(Group1) - mean(Control1).
         idx = c("Control1", "Group1"), 
         paired = FALSE)

# Calling the object automatically prints out a summary.
two.group.unpaired 

## ----create.gardner.altman.plot, fig.width = 7, fig.height = 4-----------
plot(two.group.unpaired, color.column = Gender)

## ----two.group.paired, fig.width = 7, fig.height = 4---------------------
two.group.paired <- 
  my.data %>%
  dabest(Group, Measurement, 
         idx = c("Control1", "Group1"), 
         paired = TRUE, id.col = ID)

# The summary indicates this is a paired comparison. 
two.group.paired 

plot(two.group.paired, color.column = Gender)

## ----multi.two.group.unpaired, fig.width = 7, fig.height = 4-------------

multi.two.group.unpaired <- 
  my.data %>%
  dabest(Group, Measurement, 
         idx = list(c("Control1", "Group1"), 
                    c("Control2", "Group2")),
         paired = FALSE
         )

multi.two.group.unpaired 

plot(multi.two.group.unpaired, color.column = Gender)

## ----multi.two.group.unpaired.median.summaries, fig.width = 7, fig.height = 4----
plot(multi.two.group.unpaired, color.column = Gender, 
     group.summaries = "median_quartiles")

## ----multi.two.group.paired, fig.width = 7, fig.height = 4---------------

multi.two.group.paired <- 
  my.data %>%
  dabest(Group, Measurement, 
         idx = list(c("Control1", "Group1"), 
                    c("Control2", "Group2")),
         paired = TRUE, id.col = ID
         )

multi.two.group.paired 

plot(multi.two.group.paired, color.column = Gender, slopegraph = TRUE)

## ----shared.control, fig.width = 7, fig.height = 4-----------------------

shared.control <- 
  my.data %>%
  dabest(Group, Measurement, 
         idx = c("Control2", "Group2", "Group4"),
         paired = FALSE
         )

shared.control 

plot(shared.control, color.column = Gender, rawplot.type = "swarmplot")


## ----multi.group, fig.width = 7, fig.height = 4--------------------------

multi.group <- 
  my.data %>%
  dabest(Group, Measurement, 
         idx = list(c("Control1", "Group1", "Group3"), 
                    c("Control2", "Group2", "Group4")),
         paired = FALSE
        )

multi.group 

plot(multi.group, color.column = Gender)

## ----ylim.demo, fig.width = 7, fig.height = 4----------------------------

plot(multi.group, color.column = Gender,
     rawplot.ylim = c(-100, 200),
     effsize.ylim = c(-60, 60)
    )


## ----markersize.groupwidth.demo, fig.width = 7, fig.height = 4-----------

plot(multi.group, color.column = Gender,
     rawplot.markersize = 1,
     rawplot.groupwidth = 0.4
    )

## ----ylabel.demo, fig.width = 7, fig.height = 4--------------------------

plot(multi.group, color.column = Gender,
     rawplot.ylabel = "Rawplot Title?",
     effsize.ylabel = "My delta plot!"
    )

## ----palette.demo, fig.width = 7, fig.height = 4-------------------------

plot(multi.group, color.column = Gender,
     palette = "Dark2" # The default is "Set2".
     )

