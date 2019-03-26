## ---- echo = FALSE-------------------------------------------------------
DPdata <- data.frame(subject = rep(1:20, each = (96*2)),
                     blockcode = rep(c("block1","block2"), each = 96, 
                     length.out = 20*2*96),
                     trialnum = rep(1:96, length.out = 20*2*96),
                     congruency = rep(c("Congruent","Incongruent"), 
                     length.out = 20*2*96),
                     latency = rep(rnorm(100,25), length.out = 20*2*96),
                     correct = rep(1, length.out = 20*2*96)        )


## ------------------------------------------------------------------------
str(DPdata)
head(DPdata)
sum(is.na(DPdata))

## ------------------------------------------------------------------------
library(splithalf)
library(dplyr)
library(tidyr)
splithalf_diff(DPdata, 
               conditionlist = c("block1","block2"), 
               halftype = "random", 
               no.iterations = 5000,
               var.compare = "congruency",
               compare1 = "Congruent",
               compare2 = "Incongruent")

## ---- echo = FALSE-------------------------------------------------------
DPdata2 <- data.frame(subject = rep(1:20, each = (96*2)),
                     block = rep(c("block1","block2", "block1a", "block2a"), each = 96, 
                     length.out = 20*2*96),
                     trialnumber = rep(1:96, length.out = 20*2*96),
                     trialtype = rep(c("Congruent1","Incongruent2"), 
                     length.out = 20*2*96),
                     responsetime = rep(rnorm(100,25), length.out = 20*2*96),
                     accuracy = rep(1, length.out = 20*2*96)        )

DPdata_missing <- DPdata2
DPdata_missing$accuracy <- ifelse(DPdata_missing$subject == 15 &
                                 DPdata_missing$block == "block2",
                                 0,1)

## ------------------------------------------------------------------------
sum(is.na(DPdata_missing))
head(subset(DPdata_missing, DPdata_missing$accuracy == 0))

## ------------------------------------------------------------------------
DPdata_missing$congruency <- as.factor(ifelse(grepl("Incongruent", DPdata_missing$trialtype), "Incongruent", "Congruent"))
str(DPdata_missing$congruency)

## ------------------------------------------------------------------------
DPdata_missing$block <- as.factor(ifelse(DPdata_missing$block  == "block1" | 
                                         DPdata_missing$block  == "block1a",
                                         "block1",
                                  ifelse(DPdata_missing$block  == "block2" |
                                         DPdata_missing$block  == "block2a",
                                        "block2","")))

str(DPdata_missing$block)

## ------------------------------------------------------------------------
example2 <- splithalf_diff(DPdata_missing, 
                        conditionlist = c("block1","block2"), 
                        halftype = "random",
                        no.iterations = 50, 
                        var.condition = "block",
                        var.trialnum = "trialnumber", 
                        var.RT = "responsetime", 
                        var.correct = "accuracy",
                        var.compare = "congruency",
                        compare1 = "Congruent",
                        compare2 = "Incongruent")
example2$Estimates
head(example2$omitted)

## ---- eval = FALSE-------------------------------------------------------
#  conditionnumber <- c(1,2,3,4,5,10)
#  samplesize <- c(10,20,30,40,50,100,200,500)
#  temp <- NA
#  times <- NULL
#  
#  for(i in conditionnumber)
#  {
#    for(j in samplesize)
#    {
#      # ensure the correct number of conditions
#      if(i == 1) {
#        conlist <- c("block1")
#      } else if(i == 2) {
#        conlist <- c("block1","block2")
#      } else if(i == 3) {
#        conlist <- c("block1","block2","block3")
#      } else if(i == 4) {
#        conlist <- c("block1","block2","block3","block4")
#      } else if(i == 5) {
#        conlist <- c("block1","block2","block3","block4","block5")
#      } else {
#        conlist <- c("block1","block2","block3","block4","block5",
#                     "block6","block7","block8","block9","block10")
#      }
#  
#    # generate the simulated data
#     temp <-  data.frame(subject = rep(1:j, each = (96*i)),
#                         blockcode = rep(conlist, each = 96, length.out = i*j*96),
#                         trialnum = rep(1:96, length.out = i*j*96),
#                         congruency = rep(c("Congruent","Incongruent"), length.out = i*j*96),
#                         latency = rep(rnorm(100,100,25), length.out = i*j*96),
#                         correct = rep(1, length.out = i*j*96) )
#  
#      # run DPsplithalf
#      time[j] <- system.time(DPsplithalf(temp, conditionlist = conlist,
#                                         halftype = "random", no.iterations = 5000))
#  
#     # save the data
#     times <- rbind(times, c(i,j,time[j]))
#  
#     # keep track of the runs
#     print(paste("completed",i,"conditions",j,"participants", sep = " "))
#    }
#  }

## ---- echo = TRUE, fig.height = 3, fig.width = 6, dev = 'svg'------------
times <- read.csv("timestable.csv")
summary(lm(data=times, System.time ~ Conditions + Sample.size))
library(ggplot2)
times$Conditions <- as.factor(times$Conditions)
ggplot2::ggplot(times, aes(x = Sample.size, y = System.time, linetype = Conditions)) +
  geom_line(size = 1)

