## ----include=FALSE-------------------------------------------------------
library(dplyr)
library(ggplot2)
library(tidyr)
library(GGally)

## ----fig.width=6, fig.height=4, fig.align='center'-----------------------
# Prepare O3plot results
library(OutliersO3)
data(Election2005)
data <- Election2005[, c(6, 10, 17, 28)]
O3p <- O3prep(data, method=c("HDo", "PCS", "BAC", "adjOut", "DDC", "MCD"))
O3p1 <- O3plotM(O3p)

#Create and add the new highlighting variable to the dataset
ty <- O3p1$outsTable %>% filter(Combination=="c1111")
ouFx <- data
ouFx$oh <- rep(0, nrow(data))
ouFx[ty$Case,"oh"] <- "A"

#Use plotting code from O3plotM
n1 <- ncol(data)
ouFx <- ouFx %>% mutate(alev = ifelse(oh == 0, 0.5, 1))
gp <- ggparcoord(ouFx %>% arrange(oh), scale = "uniminmax", columns=1:n1,
groupColumn="oh", alphaLines="alev") + labs(x = NULL, y = NULL) +
scale_colour_manual(values = c("grey70", "red")) +
theme(plot.title = element_text(size = 18, hjust = 0.5),
legend.position = "none", axis.ticks.y = element_blank(),
axis.text.y = element_blank())
gp

## ----fig.width=6, fig.height=4, fig.align='center'-----------------------
mm <- c("HDo", "PCS", "BAC", "adjOut", "DDC", "MCD")
#Create the dataset of distances and add the new highlighting variable from the first example
Cx <- data.frame(O3p1$Cs[ , "c1111", ])
Cx$oh <- ouFx$oh
colnames(Cx) <- c(mm, "oh")
#Use plotting code from O3plotM
if("HDo" %in% mm) {
Cx <- Cx %>% select(-HDo) #HDo provides no distances
}
mx <- length(mm)-1*("HDo" %in% mm)
gc <- ggparcoord(Cx %>% arrange(oh), scale = "uniminmax", columns=1:mx,
groupColumn="oh") + labs(x = NULL, y = NULL) +
scale_colour_manual(values = c("grey70", "red")) +
theme(plot.title = element_text(size = 18, hjust = 0.5),
legend.position = "none", axis.ticks.y = element_blank(),
axis.text.y = element_blank())
gMethods <- gc  + ggtitle(paste("Distances for each method with outliers highlighted"))
gc

