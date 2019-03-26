## ---- echo = FALSE, message = FALSE, warning=FALSE-----------------------
knitr::opts_chunk$set(collapse = T, comment = "#>")
options(tibble.print_min = 4L, tibble.print_max = 4L)
#knitr::opts_chunk$set(error = TRUE)
library(dplyr)
library(rpart)
library(ggplot2)
library(ggthemes)
library(tree.bins)
library(rpart.utils)
library(data.table)

## ---- fig.width= 7.1, fig.height= 5--------------------------------------
AmesSubset %>% 
  select(SalePrice, Neighborhood) %>% 
  group_by(Neighborhood) %>% 
  summarise(AvgPrice = mean(SalePrice)/1000) %>% 
  ggplot(aes(x = reorder(Neighborhood, -AvgPrice), y = AvgPrice)) +
  geom_bar(stat = "identity", fill = "#389135") + 
  labs(x = "Neighborhoods", y = "Avg Price (in thousands)", 
       title = paste0("Average Home Prices of Neighborhoods")) +
  theme_economist() +
  theme(legend.position = "none", axis.text.x = element_text(angle = 90, hjust = 1, size = 8),
        axis.title.x = element_text(size = 12), axis.text.y = element_text(size = 9),
        axis.title.y = element_text(size = 12))

## ------------------------------------------------------------------------
fit <- lm(formula = SalePrice ~ Neighborhood, data = AmesSubset)
summary(fit)

## ---- fig.width= 7.1, fig.height= 5--------------------------------------
d.tree = rpart(formula = SalePrice ~ Neighborhood, data = AmesSubset)
rpart.plot::rpart.plot(d.tree)

## ------------------------------------------------------------------------
sample.df <- AmesSubset %>% select(Neighborhood, MS.Zoning, SalePrice)
binned.df <- tree.bins(data = sample.df, y = SalePrice, bin.nm = "bin#.", return = "new.fctrs")
levels(sample.df$Neighborhood) #current levels of Neighborhood
unique(binned.df$Neighborhood) #new levels of Neighborhood

## ------------------------------------------------------------------------
binned.df2 <- tree.bins(data = sample.df, y = SalePrice, bin.nm = "bin#.", control = rpart.control(cp = .001), return = "new.fctrs")
unique(binned.df2$Neighborhood) #new levels of Neighborhood

## ------------------------------------------------------------------------
cp.df <- data.frame(Variables = c("Neighborhood", "MS.Zoning"), CP = c(.001, .1))
binned.df3 <- tree.bins(data = sample.df, y = SalePrice, bin.nm = "bin#.", control = cp.df, return = "new.fctrs")
unique(binned.df3$Neighborhood) #new levels of Neighborhood
unique(binned.df3$MS.Zoning) #new levels of MS.Zoning

## ------------------------------------------------------------------------
head(binned.df)

## ------------------------------------------------------------------------
lookup.list <- tree.bins(data = sample.df, y = SalePrice, bin.nm = "bin#.", control = rpart.control(cp = .01), return = "lkup.list")
head(lookup.list[[1]])

## ------------------------------------------------------------------------
both <- tree.bins(data = sample.df, y = SalePrice, bin.nm = "bin#.", control = rpart.control(cp = .01), return = "both")
head(both$new.fctrs)
head(both$lkup.list)

## ---- warning=FALSE------------------------------------------------------
oth.binned.df <- bin.oth(list = lookup.list, data = sample.df)
head(oth.binned.df)

