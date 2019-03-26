## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>")
options(tibble.print_min = 4L, tibble.print_max = 4L)
#knitr::opts_chunk$set(error = TRUE)
library(dplyr)
library(rpart)
library(ggplot2)
library(tree.bins)

## ---- fig.width= 7.1, fig.height= 5--------------------------------------
AmesSubset %>% 
  select(SalePrice, Neighborhood) %>% 
  group_by(Neighborhood) %>% 
  summarise(AvgPrice = mean(SalePrice)/1000) %>% 
  ggplot(aes(x = reorder(Neighborhood, -AvgPrice), y = AvgPrice, fill = Neighborhood)) +
  geom_bar(stat = "identity") + 
  labs(x = "Neighborhoods", y = "Avg Price (in thousands)", 
       title = paste0("Average Home Prices of Neighborhoods") , fill = "Neighborhoods") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) 

## ------------------------------------------------------------------------
fit <- lm(formula = SalePrice ~ Neighborhood, data = AmesSubset)
summary(fit)

## ---- fig.width= 7.1, fig.height= 5--------------------------------------
d.tree = rpart(formula = SalePrice ~ Neighborhood, data = AmesSubset)
rpart.plot::rpart.plot(d.tree)

## ------------------------------------------------------------------------
sample.df <- AmesSubset %>% select(Neighborhood, MS.Zoning, SalePrice)
binned.df <- tree.bins(data = sample.df, y = SalePrice, bin.nm = "bin#.", control = rpart.control(cp = .01), return = "new.fctrs")
levels(sample.df$Neighborhood) #current levels of Neighborhood
unique(binned.df$Neighborhood) #new levels of Neighborhood

## ------------------------------------------------------------------------
head(binned.df)

## ------------------------------------------------------------------------
lookup.list <- tree.bins(data = sample.df, y = SalePrice, bin.nm = "bin#.", control = rpart.control(cp = .01), return = "lkup.list")
head(lookup.list[[1]])

## ---- warning=FALSE------------------------------------------------------
oth.binned.df <- bin.oth(list = lookup.list, data = sample.df)
head(oth.binned.df)

