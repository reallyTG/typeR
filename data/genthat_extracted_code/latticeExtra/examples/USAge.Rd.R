library(latticeExtra)


### Name: USAge
### Title: US national population estimates
### Aliases: USAge USAge.table USAge.df
### Keywords: datasets

### ** Examples

data(USAge.df)
head(USAge.df)

## Figure 10.7 from Sarkar (2008)
xyplot(Population ~ Age | factor(Year), USAge.df,
       groups = Sex, type = c("l", "g"),
       auto.key = list(points = FALSE, lines = TRUE, columns = 2),
       aspect = "xy", ylab = "Population (millions)",
       subset = Year %in% seq(1905, 1975, by = 10))



