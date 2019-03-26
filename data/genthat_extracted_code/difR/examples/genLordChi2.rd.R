library(difR)


### Name: genLordChi2
### Title: Generalized Lord's chi-squared DIF statistic
### Aliases: genLordChi2

### ** Examples

## Not run: 
##D 
##D  # Loading of the verbal data
##D  data(verbal)
##D  attach(verbal)
##D 
##D  # Creating four groups according to gender ("Man" or "Woman") and
##D  # trait anger score ("Low" or "High")
##D  group <- rep("WomanLow",nrow(verbal))
##D  group[Anger>20 & Gender==0] <- "WomanHigh"
##D  group[Anger<=20 & Gender==1] <- "ManLow"
##D  group[Anger>20 & Gender==1] <- "ManHigh"
##D 
##D  # Splitting the data into the four subsets according to "group"
##D  data0 <- data1 <- data2 <- data3 <- NULL
##D  for (i in 1:nrow(verbal)){
##D  if (group[i]=="WomanLow") data0 <- rbind(data0, as.numeric(verbal[i,1:24]))
##D  if (group[i]=="WomanHigh") data1 <- rbind(data1, as.numeric(verbal[i,1:24]))
##D  if (group[i]=="ManLow") data2 <- rbind(data2, as.numeric(verbal[i,1:24]))
##D  if (group[i]=="ManHigh") data3 <- rbind(data3, as.numeric(verbal[i,1:24]))
##D  }
##D 
##D  # Estimation of the item parameters (1PL model)
##D  m0.1PL <- itemParEst(data0, model = "1PL")
##D  m1.1PL <- itemParEst(data1, model = "1PL")
##D  m2.1PL <- itemParEst(data2, model = "1PL")
##D  m3.1PL <- itemParEst(data3, model = "1PL")
##D 
##D  # merging the item parameters with rescaling
##D  irt.scale <- rbind(m0.1PL, itemRescale(m0.1PL, m1.1PL), itemRescale(m0.1PL, m2.1PL), 
##D                     itemRescale(m0.1PL, m3.1PL))
##D 
##D  # Generalized Lord's chi-squared statistics
##D  genLordChi2(irt.scale, nrFocal = 3)
##D  
## End(Not run)
 


