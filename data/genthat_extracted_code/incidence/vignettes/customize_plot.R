## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width=7,
  fig.height=5
)

## ---- data---------------------------------------------------------------
library(outbreaks)
library(ggplot2)
library(incidence)

onset <- ebola_sim_clean$linelist$date_of_onset
class(onset)
head(onset)

## ---- incid1-------------------------------------------------------------
i <- incidence(onset, interval = 7)
i

i.sex <- incidence(onset, interval = 7, group =  ebola_sim_clean$linelist$gender)
i.sex

i.hosp <- incidence(onset, interval = 7, group =  ebola_sim_clean$linelist$hospital)
i.hosp


## ---- default------------------------------------------------------------
plot(i)
plot(i.sex)
plot(i.hosp)

## ---- args---------------------------------------------------------------
args(incidence:::plot.incidence)

## ---- incidence_pal1,   fig.height = 8-----------------------------------
par(mfrow = c(3, 1), mar = c(4,2,1,1))
barplot(1:2, col = incidence_pal1(2))
barplot(1:4, col = incidence_pal1(4))
barplot(1:20, col = incidence_pal1(20))

## ---- pal2, fig.height = 8-----------------------------------------------
par(mfrow = c(3,1))
barplot(1:20, col = incidence_pal1_dark(20), main = "palette:  incidence_pal1_dark")
barplot(1:20, col = incidence_pal1(20), main = "palette:  incidence_pal1")
barplot(1:20, col = incidence_pal1_light(20), main = "palette:  incidence_pal1_light")

## ---- palettes-----------------------------------------------------------
plot(i.hosp, col_pal = rainbow)
plot(i.sex, col_pal = cm.colors)

## ---- colors1------------------------------------------------------------
plot(i, color = "darkred")

## ---- colors2------------------------------------------------------------
plot(i.sex, color = c(m = "orange2", f = "purple3"))

## ---- colors3------------------------------------------------------------
plot(i.hosp, 
     color = c("#ac3973", "#6666ff", "white", "white", "white", "white"))

## ---- scales1------------------------------------------------------------
library(scales)
plot(i, labels_iso_week = FALSE) +
   scale_x_date(labels = date_format("%d %b %Y"))

## ---- scales2------------------------------------------------------------
plot(i[1:50]) +  
  scale_x_date(labels = date_format("%a %d %B %Y")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 12))

## ---- scales3------------------------------------------------------------
rotate.big <- theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 12))

## ---- grid1--------------------------------------------------------------
plot(i.hosp)

## ---- grid2--------------------------------------------------------------
period <- as.Date("2014-10-01") + c(-40, 40)
i.zoom <- subset(i.hosp, from = period[1], to = period[2])
detailed.x <- scale_x_date(labels = date_format("%a %d %B %Y"), 
                           date_breaks = "2 weeks", 
                           date_minor_breaks = "week")

plot(i.zoom, border = "black") + detailed.x + rotate.big

## ---- legend1------------------------------------------------------------
p <- plot(i.zoom, border = "black") + detailed.x + rotate.big
p + theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 12), 
          legend.position = "top", legend.direction = "horizontal", 
          legend.title = element_blank())

## ---- EPIET1-------------------------------------------------------------
i.small <- incidence(onset[160:180])

plot(i.small, border = "white", show_cases = TRUE) +
  theme(panel.background = element_rect(fill = "white")) + 
  coord_equal()

