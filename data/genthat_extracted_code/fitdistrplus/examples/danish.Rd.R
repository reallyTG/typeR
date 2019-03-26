library(fitdistrplus)


### Name: danish
### Title: Danish reinsurance claim dataset
### Aliases: danish danishuni danishmulti
### Keywords: datasets

### ** Examples


# (1) load of data
#
data(danishuni)


# (2) plot and description of data
#
plotdist(danishuni$Loss)


# (3) load of data
#
data(danishmulti)


# (4) plot and description of data
#
idx <- sample(1:NROW(danishmulti), 10)
barplot(danishmulti$Building[idx], col = "grey25", 
  ylim = c(0, max(danishmulti$Total[idx])), main = "Some claims of danish data set")
barplot(danishmulti$Content[idx], add = TRUE, col = "grey50", axes = FALSE)
barplot(danishmulti$Profits[idx], add = TRUE, col = "grey75", axes = FALSE)
legend("topleft", legend = c("Building", "Content", "Profits"), 
  fill = c("grey25", "grey50", "grey75"))



