## ----setup, include=FALSE------------------------------------------------
library(knitr)
opts_chunk$set(out.extra='style="display:block; margin: auto"', fig.align="center")
library(nullabor)

## ------------------------------------------------------------------------
simPoll <- function(trueData) {
  simMargin <- rnorm(nrow(trueData), mean=trueData$Margin, sd=2.5)
  simDemocrat <- ((simMargin>0) & trueData$Democrat) | ((simMargin<0) & !trueData$Democrat)

  simMargin <- abs(simMargin)
  res <- trueData
  res$Democrat <- simDemocrat
  res$Margin <- simMargin
  res
}

## ------------------------------------------------------------------------
data(electoral, package="nullabor")
margins <- electoral$polls

sim1 <- simPoll(margins)
sum(sim1$Electoral.Votes[sim1$Democrat])

## ------------------------------------------------------------------------
pos <- sample(20,1)
lpdata <- nullabor::lineup(method = simPoll, true=margins, n=20, pos=pos)
dim(lpdata)
summary(lpdata)

## ------------------------------------------------------------------------
election <- electoral$election
idx <- which(lpdata$.sample==pos)
lpdata$Margin[idx] <- election$Margin

## ---- warning=FALSE, message=FALSE---------------------------------------
library(dplyr)
lpdata <- lpdata %>% arrange(desc(Margin))
lpdata <- lpdata %>% group_by(.sample, Democrat) %>% mutate(
  tower=cumsum(Electoral.Votes[order(Margin, decreasing=TRUE)])
) 
lpdata$diff <-  with(lpdata, Margin*c(1,-1)[as.numeric(Democrat)+1])

## ---- fig.height=7, fig.width=6, warning=FALSE, message=FALSE------------
library(ggplot2)
dframe <- lpdata
dframe$diff <- with(dframe, diff+sign(diff)*0.075)
dframe$diff <- pmin(50, dframe$diff)
ggplot(aes(x=diff, y=tower, colour = factor(Democrat)), data=dframe) + 
  scale_colour_manual(values=c("red", "blue"), guide="none") + 
  scale_fill_manual(values=c("red", "blue"), guide="none") + 
  scale_x_continuous(breaks=c(-25,0,25), labels=c("25", "0", "25"), 
                     limits=c(-50,50)) + 
  geom_rect(aes(xmin=pmin(0, diff), xmax=pmax(0,diff), ymin=0, 
                ymax=tower, fill=Democrat), size=0) +
  geom_vline(xintercept=0, colour="white") + 
  facet_wrap(~.sample) +
  theme(axis.text=element_blank(), axis.ticks=element_blank(),
        axis.title=element_blank(), 
        plot.margin=unit(c(0.1,0.1,0,0), "cm")) +
  ggtitle("Which of these panels looks the most different?")

## ------------------------------------------------------------------------
pos

