## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width=8,
  fig.height=6,
  fig.retina=1
)

## ------------------------------------------------------------------------
library(cytofan)

## ----include=FALSE,echo=FALSE--------------------------------------------
library(bodenmiller)
library(ggplot2)
library(dplyr)
library(reshape2)

## ------------------------------------------------------------------------
data('refPhenoMat')
data('refFuncMat')
data('refAnnots')
refFullFrame <- melt(cbind(refPhenoMat,
                            refFuncMat))
names(refFullFrame) <- c('cell_id','Channel','value')
refFullFrame$Channel <- factor(refFullFrame$Channel,
                               levels=c(colnames(refPhenoMat),
                                        colnames(refFuncMat)))
refFullFrame$Cells <- rep(refAnnots$Cells,
                           ncol(refPhenoMat)+ncol(refFuncMat))

## ------------------------------------------------------------------------
refFullFrame %>% 
  filter(Cells=='cd4+') %>%
  ggplot(aes(x=Channel,y=value))+
  geom_fan()+
  facet_grid(.~Cells)+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

## ------------------------------------------------------------------------
refFullFrame %>% 
  filter(Cells %in% c('cd4+','cd8+')) %>%
  ggplot(aes(x=Channel,y=value))+
  geom_fan()+
  facet_grid(Cells~.)+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

## ------------------------------------------------------------------------
data('untreatedPhenoMat')
data('untreatedFuncMat')
data('untreatedAnnots')
untreatedFullFrame <- melt(cbind(untreatedPhenoMat,
                                 untreatedFuncMat))
names(untreatedFullFrame) <- c('cell_id','Channel','value')
untreatedFullFrame$Channel <- factor(untreatedFullFrame$Channel,
                                     levels=c(colnames(untreatedPhenoMat),
                                              colnames(untreatedFuncMat)))
untreatedFullFrame$Cells <- rep(untreatedAnnots$Cells,
                                ncol(untreatedPhenoMat)+ncol(untreatedFuncMat))
untreatedFullFrame$Treatment <- rep(untreatedAnnots$Treatment,
                                ncol(untreatedPhenoMat)+ncol(untreatedFuncMat))

## ------------------------------------------------------------------------
untreatedFullFrame %>% 
  filter(Cells=='cd4+') %>%
  ggplot(aes(x=Channel,y=value))+
  geom_fan()+
  facet_grid(Treatment~Cells)+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

## ----fig.width=12--------------------------------------------------------
untreatedFullFrame %>% 
  filter(Cells %in% c('cd4+','cd8+')) %>%
  ggplot(aes(x=Channel,y=value))+
  geom_fan()+
  facet_grid(Cells~Treatment)+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

