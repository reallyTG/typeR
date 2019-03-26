library(SubgrPlots)


### Name: plot_alluvial
### Title: Alluvial plot
### Aliases: plot_alluvial

### ** Examples

library(dplyr)

# Alluvial plot
# Load the data to be used
data(prca)
dat <- prca
dat$trt = dat$rx
dat %>%
  dplyr::select(trt, bm, hx, pf) %>%
  dplyr::group_by(trt, bm, hx, pf) %>%
  dplyr::summarise(Freq = n()) -> alldat
alldat %>%
  ungroup() %>%
  mutate(trt = ifelse(trt == 0 , "Control", "Treatment"),
         bm = ifelse(bm == 0 , "No", "Yes"),
         hx = ifelse(hx == 0 , "No", "Yes"),
         pf = ifelse(pf == 0 , "No", "Yes"))-> alldat

plot_alluvial(alldat[,c(1,3,2,4)], freq = alldat$Freq,
              xw=0.2,cw = 0.12,cex = 1,
              alpha  = 0.8,
              col=ifelse(alldat$trt == "Treatment","#1f78b4", "#a6cee3"),
              layer = alldat$trt  == 1, rotate = 90)


# Alluvial plot using survival rate at 24 months
data(prca)
dat <- prca
dat %>%
  mutate(survival = factor(ifelse(survtime > 24 , "Yes", "No"), levels = c("No", "Yes")),
         trt = rx) -> dat
dat %>%
  dplyr::select(trt, bm, hx, pf, survival) %>%
  dplyr::group_by(trt, bm, hx, pf, survival) %>%
  dplyr::summarise(Freq = n()) -> alldat
alldat %>%
  ungroup() %>%
  mutate(trt = ifelse(trt == 0 , "Control", "Treatment"),
         bm = ifelse(bm == 0 , "No", "Yes"),
         hx = ifelse(hx == 0 , "No", "Yes")) -> alldat

plot_alluvial(alldat[,c(5,1,3,2,4)], freq = alldat$Freq,
              xw=0.2,cw = 0.12,cex = 1,
              alpha  = 0.8,
              col=ifelse(alldat$survival  == "Yes",
                         ifelse(alldat$trt  == "Treatment","#80b1d3","#d5e2eb"),
                         ifelse(alldat$trt  == "Treatment","#faa8d2","#fbe0ee")),
              layer = alldat$trt  == 1, rotate = 90, las = 2, bottom.mar = 5)




