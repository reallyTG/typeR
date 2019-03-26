## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", warning = FALSE, message = FALSE,
                      fig.height = 5, fig.width = 10)

## ------------------------------------------------------------------------
library(factorMerger)
library(ggplot2)
library(dplyr)
library(reshape2)

## ------------------------------------------------------------------------
data("pisa2012")

## ------------------------------------------------------------------------
pisa2012 %>% ggplot(aes(x = country)) + geom_bar() + 
    theme(axis.text.x = element_text(angle = 90, hjust = 1))

## ------------------------------------------------------------------------
meltedPisa <- pisa2012 %>% melt(na.rm = TRUE)
pisaResultsBySubject <-  meltedPisa %>% 
    ggplot(aes(x = reorder(country, value, FUN = median), y = value)) + geom_boxplot() + 
    facet_wrap(~variable) + 
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
    xlab("Country") 


## ------------------------------------------------------------------------
pisaResultsBySubject + 
    geom_hline(data = meltedPisa %>% group_by(variable) %>% summarise(mean = mean(value)), 
               aes(yintercept = mean, group = variable), col = "red")

## ------------------------------------------------------------------------
manova(cbind(math, reading, science) ~ country, pisa2012) %>% summary()

## ---- fig.width=10, fig.height=10----------------------------------------
pisaFMHClustEurope <- mergeFactors(response = pisa2012[,1:3],
                       factor = factor(pisa2012$country),
                       method = "fast-fixed") 

plot(pisaFMHClustEurope)


