## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo = F, warning = F,  fig.height=5, fig.width=7,  fig.cap = "True colonization rates versus estimated colonization rates after applying the corresponding detectability filter to 30 pairs of rates chosen at random for 100 species and 6 times, assuming imperfect detectability. "----
library(island)
set.seed(4513423)
ce <- matrix(runif(60), ncol = 2) #Random c-e rates
tps <- cetotrans(ce[, 1], ce[, 2])

ce_est <- matrix(NA, nrow = 30, ncol = 2)
ce_est0.4 <- matrix(NA, nrow = 30, ncol = 2)
ce_est0.95 <- matrix(NA, nrow = 30, ncol = 2)

for (i in 1:30){
  initial <- matrix(sample(0:1, 200, replace = T, prob = c(ce[i, 1], ce[i, 2])), ncol = 1)
  data <- cbind(initial, PA_simulation(initial, 1, tps[i, ], times = 5))
  
  data1 <- data * (matrix(runif(ncol(data) * nrow(data)), nrow = nrow(data), ncol = ncol(data)) < 0.95)
  data2 <- data * (matrix(runif(ncol(data) * nrow(data)), nrow = nrow(data), ncol = ncol(data)) < 0.95)
  data3 <- data * (matrix(runif(ncol(data) * nrow(data)), nrow = nrow(data), ncol = ncol(data)) < 0.95)
  
  df <- NULL
  for(j in 1:6){
    df <- cbind(df, data1[, j], data2[, j], data3[, j])
  }
  rrr <- unlist(sss_cedp(df, 1:6, rep(3, 6), Colonization = 0.5, Extinction = 0.5, Phi_Time_0 = 0.5, Detectability = 0.95))
  
  ce_est0.95[i,] <- c(rrr[1], rrr[2])
  
data1 <- data * (matrix(runif(ncol(data) * nrow(data)), nrow = nrow(data), ncol = ncol(data)) < 0.4)
  data2 <- data * (matrix(runif(ncol(data) * nrow(data)), nrow = nrow(data), ncol = ncol(data)) < 0.4)
  data3 <- data * (matrix(runif(ncol(data) * nrow(data)), nrow = nrow(data), ncol = ncol(data)) < 0.4)
  
  df <- NULL
  for(j in 1:6){
    df <- cbind(df, data1[, j], data2[, j], data3[, j])
  }
  rrr <- unlist(sss_cedp(df, 1:6, rep(3, 6), Colonization = 0.5, Extinction = 0.5, Phi_Time_0 = 0.5, Detectability = 0.4))
ce_est0.4[i,] <- c(rrr[1], rrr[2])
  
}

#Plotting
par(mfrow=c(1, 2))
plot(ce[, 1], ce_est0.4[, 1], xlab = "True Colonization", ylab = "Estimated Colonization", pch = 20)
title(sub="d = 0.4")
plot(ce[, 1], ce_est0.95[, 1], xlab = "True Colonization", ylab = "", pch = 20)
title(sub="d = 0.95")



## ---- echo = F-----------------------------------------------------------
knitr::kable(head(lakshadweepPLUS[[1]][, 1:9]))

## ---- examples-----------------------------------------------------------
### Using sss_cedp
Data1 <- lakshadweep[[1]]
Name_of_Factors <- c("Species","Atoll","Guild")
Factors <- Filter(is.factor, Data1)
No_of_Factors <- length(Factors[1,])
n <- No_of_Factors + 1
D1 <- as.matrix(Data1[1:nrow(Data1),n:ncol(Data1)])
Time <- as.double(D1[1,])
P1 <- as.matrix(D1[2:nrow(D1),1:ncol(D1)])
Time_Vector <- as.numeric(names(table(Time)))
Transects   <- as.numeric((table(Time)))
R1 <- sss_cedp(P1, Time_Vector, Transects,
                       Colonization=0.5, Extinction=0.5, Detectability=0.5,
                       Phi_Time_0=0.5,
                       Tol=1.0e-8, Verbose = F)
knitr::kable(unlist(R1))

### Using mss_cedp
Data <- lakshadweepPLUS[[1]]
Guild_Tag = c("Alg","Cor","Mac","Mic","Omn","Pis","Zoo") # In alphabetical order.
Time <- as.vector(c(2000, 2000, 2001, 2001, 2001, 2001, 2002, 2002, 2002,
 2002, 2003, 2003, 2003, 2003, 2010, 2010, 2011, 2011, 2011, 2011, 2012,
 2012, 2012, 2012, 2013, 2013, 2013, 2013))
R2 <- mss_cedp(Data, Time, Factor=3, Tags=Guild_Tag, PerfectDetectability=FALSE, z=4)

## ---- model selection----------------------------------------------------
 Data <- lakshadweepPLUS[[1]]
 Guild_Tag = c("Alg", "Cor", "Mac", "Mic", "Omn", "Pis", "Zoo")
 Time <- as.vector(c(2000, 2000, 2001, 2001, 2001, 2001, 2002, 2002, 2002,
 2002, 2003, 2003, 2003, 2003, 2010, 2010, 2011, 2011, 2011, 2011, 2012,
 2012, 2012, 2012, 2013, 2013, 2013, 2013))
 R3 <- upgma_model_selection(Data, Time, Factor = 3, Tags = Guild_Tag,
 PerfectDetectability = FALSE, z = 4)

## ---- echo = F, fig.height=5, fig.width=7, fig.caption = T, fig.cap = "Dendrogram of the upgma clustering of alternative models of colonization and extinction with imperfect detectability for Kadmath atoll. In red, the best model found, that groups together corallivores, macro and micro- invertivores."----
 Rbis <- R2
 rownames(Rbis) <- Guild_Tag
 distance <- dist(Rbis[, 1:4])
 cluster <- (hclust(distance, method = "average"))
 cluster <- as.dendrogram(cluster)
 plot(cluster, yaxt = "n", ylab = "AIC")
text(c(0, 0, 0, 0, 0, 0, 0), c(.32, .27, .235, .18, .11, .073, .03), c(12800, 12713, 12715, 12680, 12672, 12678, 12681), col = c(rep("Black", 4), "Red", "Black", "Black"), xpd = T)
lines(x = c(2, 2), y = c(0.292, 0.34), xpd=T) 
lines(x = c(0.8, 7.2), y = c(.32, .32), xpd=T, lty = 3) 
lines(x = c(0.8, 7.2), y = c(.27, .27), xpd=T, lty = 3) 
lines(x = c(0.8, 7.2), y = c(.235, .235), xpd=T, lty = 3) 
lines(x = c(0.8, 7.2), y = c(.18, .18), xpd=T, lty = 3) 
lines(x = c(0.8, 7.2), y = c(.11, .11), xpd=T, lty = 3, col = "Red") 
lines(x = c(0.8, 7.2), y = c(.073, .073), xpd=T, lty = 3) 
lines(x = c(0.8, 7.2), y = c(.03, .03), xpd=T, lty = 3) 


