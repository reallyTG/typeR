## ---- include = FALSE----------------------------------------------------
library(ggplot2)
library(doremi)
knitr::opts_chunk$set(
  collapse = TRUE,
  warning = FALSE,
  comment = "#>"
)

## ----fig.width = 5, fig.height = 4, fig.align = "center", echo = FALSE----
exc <- rep(c(0,1,0),c(10,30,50))
signal<- generate.remi(10, exc, seq(1:90))
temp <- paste("theta")

ggplot2::ggplot(data = data.frame(signal)) +
ggplot2::ggtitle( "Definition of damping time")+
  ggplot2::geom_line(ggplot2::aes(t,y, colour = "Signal"))+
  ggplot2::geom_line(ggplot2::aes(t,exc, colour = "Excitation"))+
  ggplot2::geom_hline(yintercept=0.63*max(signal$y), linetype="dashed", colour = "gray")+
  ggplot2::geom_hline(yintercept=0.37*max(signal$y), linetype="dashed", colour = "gray")+
  ggplot2::geom_vline(xintercept=signal$t[signal$y==max(signal$y)], colour = "gray")+
  ggplot2::geom_vline(xintercept=50, colour = "gray")+
  ggplot2::geom_vline(xintercept=19, colour = "gray")+
  ggplot2::geom_vline(xintercept=10, colour = "gray")+
  ggplot2::annotate("segment", x = 10, xend = 19, y = -0.5, yend = -0.5, colour = "dark green", size = 1)+
  ggplot2::annotate("text", x = 15, y = -1, label = "tau", parse = TRUE, colour = "dark green")+
  
  ggplot2::annotate("segment", x = 40, xend = 50, y = -0.5, yend = -0.5, colour = "dark green", size = 1)+
  ggplot2::annotate("text", x = 45, y = -1, label = "tau", parse = TRUE, colour = "dark green")+

  ggplot2::annotate("text", x = 75, y = 6.6, label = "63% diff. max and eq. value", colour = "gray")+
  ggplot2::annotate("text", x = 75, y = 4, label = "37% diff. max and eq. value", colour = "gray")+
  
  ggplot2::labs(x = "Time (arb. unit)",
           y = "Signal (arb. unit)",
           colour = "Legend")+
  ggplot2::theme(legend.position = "top", plot.title = ggplot2::element_text(hjust = 0.5))

## ------------------------------------------------------------------------
mydataa1 <- generate.panel.remi(nind = 4, 
                          dampingtime = 10, 
                          amplitude = 1, 
                          nexc = 3, 
                          duration = 10, 
                          deltatf = 0.5,
                          tmax = 100,
                          minspacing = 20,
                          internoise = 0, 
                          intranoise = 0)

## ------------------------------------------------------------------------
mydataa1

## ----fig.width = 7, fig.height = 6, fig.align = "center"-----------------
ggplot2::ggplot( data = mydataa1$data ) +
  ggplot2::geom_line(ggplot2::aes(time,dampedsignalraw, colour = "dampedsignalraw"))+
  ggplot2::geom_point(ggplot2::aes(time,dampedsignal, colour = "dampedsignal"))+
  ggplot2::geom_line(ggplot2::aes(time,excitation,colour = "Excitation"))+
  ggplot2::facet_wrap(~id)+
  ggplot2::labs(x = "Time (s)",
           y = "Signal (arb. unit)",
           colour = "")

## ------------------------------------------------------------------------
# Generation of signals with intra and inter-noise
mydataa2 <- generate.panel.remi(nind = 4, 
                          dampingtime = 10, 
                          amplitude = 1, 
                          nexc = 3, 
                          duration = 10, 
                          deltatf = 0.5,
                          tmax = 100,
                          minspacing = 20,
                          internoise = 0.4, 
                          intranoise = 0.2)

## ----fig.width = 7, fig.height = 6, fig.align = "center"-----------------
# Plotting the data
ggplot2::ggplot( data = mydataa2$data ) +
  ggplot2::geom_line(ggplot2::aes(time,dampedsignalraw, colour = "Signal-no noise"))+
  ggplot2::geom_point(ggplot2::aes(time,dampedsignal, colour = "Signal with 20% intra-noise"))+
  ggplot2::geom_line(ggplot2::aes(time,excitation,colour = "Excitation"))+
  ggplot2::facet_wrap(~id)+
  ggplot2::labs(x = "Time (s)",
           y = "Signal (arb. unit)",
           colour = "")

## ------------------------------------------------------------------------
resultb1 <- remi(data = mydataa2,
                 id = "id",
                 input ="excitation",
                 time ="time",
                 signal = "dampedsignal",
                 embedding = 5)

## ------------------------------------------------------------------------
resultb1 

## ------------------------------------------------------------------------
summary(resultb1) 

## ------------------------------------------------------------------------
head(resultb1$data)

## ------------------------------------------------------------------------
resultb1$regression

## ------------------------------------------------------------------------
resultb1$resultmean

## ------------------------------------------------------------------------
resultb1$resultid

## ----fig.width = 7, fig.height = 6, fig.align = "center"-----------------
plot(resultb1)

## ----fig.width = 7, fig.height = 6, fig.align = "center"-----------------
plot(resultb1, id = 3)
plot(resultb1, id = c(1,4))

## ------------------------------------------------------------------------
#Simulating data with these hypothesis
#Generating the three excitation signals:
e1 <- generate.excitation (amplitude = 10, 
                           nexc = 1, 
                           duration = 10, 
                           deltatf = 1, 
                           tmax = 100,
                           minspacing = 20)
e2 <- generate.excitation (amplitude = 10, 
                           nexc = 1, 
                           duration = 10, 
                           deltatf = 1, 
                           tmax = 100,
                           minspacing = 20)
e3 <- generate.excitation (amplitude = 10, 
                           nexc = 1, 
                           duration = 10, 
                           deltatf = 1, 
                            tmax = 100,
                           minspacing = 20)
# Arbitrarily choosing a = 1, b = 2 and c = 5 for the first individual
et1 <- e1$exc + 3 * e2$exc + 5 * e3$exc
timt1 <- e3$t  #we can use any of the three time vectors as they are identical for the three excitations
y1 <- generate.remi(dampingtime = 10,
                    inputvec = et1,
                    inputtim = timt1)$y 
#as we are using the $y argument ot the object generated

#Signals for the second individual;
# Arbitrarily choosing a = 1, b = 2.5 and c = 4 for the second individual
et2 <- e1$exc + 2.5 * e2$exc + 4 * e3$exc
y2 <- generate.remi(dampingtime = 10,
                    inputvec = et2,
                    inputtim = timt1)$y 

#Generating table with signals
mydatab2 <- data.frame(id = rep(c(1, 2), c(length(et1), length(et2))), 
                 time = c(timt1, timt1),
                 excitation1 = c(e1$exc, e1$exc),
                 excitation2 = c(e2$exc, e2$exc),
                 excitation3 = c(e3$exc, e3$exc),
                 excitation = c(et1, et2), 
                 signalcol = c(y1, y2))

## ----fig.width = 7, fig.height = 4, fig.align = "center"-----------------
#Plotting signals
ggplot2::ggplot( data = data.frame(mydatab2)) +
  ggplot2::geom_line(ggplot2::aes(time,signalcol, colour = "Signal-no noise"))+
  ggplot2::geom_line(ggplot2::aes(time,excitation,colour = "Total excitation"))+
  ggplot2::facet_wrap(~id)+
  ggplot2::labs(x = "Time (s)",
           y = "Signal (arb. unit)",
           colour = "")

## ------------------------------------------------------------------------
#Analyzing signals
resultb2 <- remi(data = mydatab2,
                 id = "id",
                 input = c("excitation1", "excitation2", "excitation3"),
                 time = "time",
                 signal = "signalcol",
                 embedding = 5)

#Looking for the calculation of the coefficients of the excitation
resultb2
resultb2$resultid


## ----fig.width = 7, fig.height = 4, fig.align = "center"-----------------
#Plotting signals
plot(resultb2)

## ------------------------------------------------------------------------
#Simulating data with these hypothesis
mydatab3 <- generate.panel.remi(nind = 6,
                          dampingtime = 10,
                          amplitude = -1,
                          nexc = 1,
                          duration = 50,
                          deltatf = 1,
                          tmax = 50,
                          minspacing = 0,
                          internoise = 0.4,
                          intranoise = 0.2)

## ------------------------------------------------------------------------
#Analysing
resultb3 <- remi(data = mydatab3,
                 id = "id",
                 time = "time",
                 signal = "dampedsignal",
                 embedding = 5)

## ----fig.width = 7, fig.height = 6, fig.align = "center"-----------------
#Plotting
plot(resultb3)

## ------------------------------------------------------------------------
#Creating the data table
mydatab4 <- data.frame(time = timt1,
                 excitation = et1, 
                 signalcol = y1)

## ------------------------------------------------------------------------
#Analyzing
resultb4 <- remi(data = mydatab4,
                 input = "excitation",
                 time ="time",
                 signal = "signalcol",
                 embedding = 5)

## ----fig.width = 6, fig.height = 4, fig.pos = 0.5, fig.align = "center"----
#Plotting 
plot(resultb4)

## ------------------------------------------------------------------------
mydatab5 <- generate.panel.remi(nind = 4, 
                          dampingtime = 10, 
                          amplitude = 1, 
                          nexc = 3, 
                          duration = 10, 
                          deltatf = 0.5,
                          tmax = 100,
                          minspacing = 20,
                          internoise = 0.1, 
                          intranoise = 0.2)

#Keeping one third of the rows selected randomly from the full data set
mydatab5rd <- mydatab5$fulldata[sample(nrow(mydatab5$fulldata), nrow(mydatab5$fulldata)/3), ]
mydatab5rd <- mydatab5rd[order(id,time)]


## ----fig.width = 7, fig.height = 6, fig.align = "center"-----------------
ggplot2::ggplot( data = mydatab5$fulldata ) +
  ggplot2::geom_point(ggplot2::aes(time,dampedsignalraw, colour = "Full data set. No noise"))+
  ggplot2::geom_line(ggplot2::aes(time,excitation,colour = "Excitation"))+
  ggplot2::geom_point(data = mydatab5rd, ggplot2::aes(time,dampedsignalraw, colour = "Random sampling"))+
  ggplot2::facet_wrap(~id)+
  ggplot2::labs(x = "Time (unit)",
           y = "Signal (unit)",
           colour = "")

## ------------------------------------------------------------------------
resultb5 <- remi(data = mydatab5rd,
                 id = "id",
                 input = "excitation",
                 time ="time",
                 signal = "dampedsignal",
                 embedding = 5)

## ----fig.width = 7, fig.height = 6, fig.align = "center"-----------------
plot(resultb5)

## ------------------------------------------------------------------------
resultc1 <- remi(data = cardio,
                 id = "id",
                 input = "load",
                 time ="time",
                 signal = "hr",
                 embedding = 5)

## ----fig.width = 10, fig.height = 10, fig.align = "center"---------------
plot(resultc1, id = 1:21)

## ------------------------------------------------------------------------
resultc2 <- remi(data = rotation,
                 id = "id",
                 time ="days",
                 signal = "meanRT",
                 embedding = 5)

## ----fig.width = 10, fig.height = 10, fig.align = "center"---------------
plot(resultc2, id = 1:17)

## ----fig.width = 5, fig.height = 4, echo = FALSE, fig.align = "center"----
dt <- merge(resultc2$resultid,rotation[, sex[1], by=id])
dt<-dt[!id==15]
ggplot2::ggplot(dt, ggplot2::aes(x=V1, y=dampingtime, color=V1)) + ggplot2::geom_boxplot() + 
ggplot2::ggtitle("Comparison between men and women \n damping times for the rotation data") + 
ggplot2::theme_light() + ggplot2::theme(legend.position='none', plot.title = ggplot2::element_text(hjust = 0.5)) +
ggplot2::labs(x = "Sex",
              y = "Damping time (days)")


## ----fig.width = 5,fig.height = 4, fig.pos = 0.5, fig.align = "center"----
#Input data
#Taking et1, et2, y1 and y2 from example b2
#Creating data frame with the pair e1,y1
mydatad1 <- data.frame(time = timt1, exc = et1, y1 = y1)

#Analysis 
resultd1 <- remi(data = mydatad1,
                 input = "exc",
                 time = "time",
                 signal = "y1",
                 embedding = 5)
                                 
#Creating data frame with et2 that will be supplied as new excitation for the predict function
mydatad1$exc <- et2

#Calling the predict function
predresultd1<- predict(resultd1,
                       newdata = mydatad1)

#Comparing with calculated signal y2
q <- plot(predresultd1)
q + ggplot2::geom_point(ggplot2::aes(predresultd1$data$time, y2,colour = "y2"))

