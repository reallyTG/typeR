## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(  #default code chunk options
    fig.width = 6,
    fig.height = 4
)           
pander::panderOptions("table.split.table", Inf)     #don't split wide tables in output
pander::panderOptions("table.style", "rmarkdown")   #table style that's supported by github

## ----message=FALSE-------------------------------------------------------
library(dplyr)      #%>%
library(emmeans)    #emmeans
library(DescTools)  #EtaSq
library(car)        #sigmaHat
library(ARTool)     #art, artlm
library(ggplot2)    #ggplot, stat_..., geom_..., etc

## ------------------------------------------------------------------------
data(InteractionTestData)
df = InteractionTestData    #save some typing

## ------------------------------------------------------------------------
#we'll be doing type 3 tests, so we want sum-to-zero contrasts
options(contrasts = c("contr.sum", "contr.poly"))
m.linear = lm(Y ~ X1*X2, data=df)

## ------------------------------------------------------------------------
m.art = art(Y ~ X1*X2, data=df)

## ------------------------------------------------------------------------
m.art.anova = anova(m.art)
print(m.art.anova, verbose=TRUE)

## ------------------------------------------------------------------------
m.art.anova$eta.sq.part = with(m.art.anova, `Sum Sq`/(`Sum Sq` + `Sum Sq.res`))
m.art.anova

## ------------------------------------------------------------------------
EtaSq(m.linear, type=3)

## ------------------------------------------------------------------------
x2.contrasts = summary(pairs(emmeans(m.linear, ~ X2)))

## ------------------------------------------------------------------------
x2.contrasts$d = x2.contrasts$estimate / sigmaHat(m.linear)
x2.contrasts

## ------------------------------------------------------------------------
m.art.x2 = artlm(m.art, "X2")
x2.contrasts.art = summary(pairs(emmeans(m.art.x2, ~ X2)))
x2.contrasts.art$d = x2.contrasts.art$estimate / sigmaHat(m.art.x2)
x2.contrasts.art

## ------------------------------------------------------------------------
x2.contrasts.ci = confint(pairs(emmeans(m.linear, ~ X2))) %>%
    mutate(d = estimate / sigmaHat(m.linear)) %>%
    cbind(d = plyr::ldply(.$d, psych::d.ci, n1 = 100, n2 = 100))

x2.contrasts.ci

## ------------------------------------------------------------------------
x2.contrasts.art.ci = confint(pairs(emmeans(m.art.x2, ~ X2))) %>%
    mutate(d = estimate / sigmaHat(m.art.x2)) %>%
    cbind(d = plyr::ldply(.$d, psych::d.ci, n1 = 100, n2 = 100)) 

x2.contrasts.art.ci

## ----cohens-d-comparison-------------------------------------------------
rbind(
        cbind(x2.contrasts.ci, model="linear"), 
        cbind(x2.contrasts.art.ci, model="ART")
    ) %>%
    ggplot(aes(x=model, y=d, ymin=d.lower, ymax=d.upper)) +
    geom_pointrange() +
    geom_hline(aes(yintercept = true_effect), 
      data = data.frame(true_effect = c(-2, -2, 0), contrast = c("C - D", "C - E", "D - E")), 
      linetype = "dashed", color = "red") +
    facet_grid(contrast ~ .) + 
    coord_flip()

