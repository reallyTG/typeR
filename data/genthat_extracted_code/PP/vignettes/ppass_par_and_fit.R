## ----loadall-------------------------------------------------------------

library(PP)
library(data.table)


## ----simulate_data1------------------------------------------------------
set.seed(1526)

# intercepts
diffpar <- seq(-3.6,3,length=15)
# slope parameters
sl     <- round(runif(15,0.5,1.5),2)
la     <- round(runif(15,0,0.25),2)
ua     <- round(runif(15,0.8,1),2)


awm <- PP::sim_4pl(beta = diffpar, alpha = sl,
                   lowerA = la, upperA = ua,
                   theta = rnorm(200))

awm <- as.data.frame(awm)

## ----data_wrangling1-----------------------------------------------------
out <- PPass(respdf = awm,thres = diffpar,
             items="all", mod=c("1PL"), 
             fitindices=c("lz","lzstar","infit","outfit"))

# create a data.table
outdt <- data.table(out)

outdt[, ID := 1:.N]
outdt[, roundest := factor(round(estimate,8))]

# Compute Percentile Ranks with the Person Parameters

outdtu <- unique(outdt[,su := .N, keyby=roundest], by="roundest")
outdtu[,PR :=cumsum(su)/sum(su) * 100]

outdt <- outdt[outdtu[,list(roundest,PR)],,on="roundest"]
setorder(outdt,ID)
outdt[, c("su") := NULL]

# done
outdt

## ----simulate_data2------------------------------------------------------

awm <- PP::sim_4pl(beta = diffpar, alpha = sl, lowerA = la, 
                   upperA = ua, theta = c(rnorm(500),rnorm(500,0.5,1.2)))

awm <- as.data.frame(awm)



## ----data_wrangling2-----------------------------------------------------
out <- PPass(respdf = awm, thres = diffpar, 
             items="all", mod=c("1PL"), 
             fitindices= c("lz","lzstar","infit","outfit"))


outdt <- data.table(out)

outdt[, ID := 1:.N]
outdt[, agegroup := rep(c("young","old"),each=500)]
outdt[, roundest := factor(round(estimate,8))]

outdtu <- unique(outdt[,su := .N, keyby=c("agegroup","roundest")], by=c("agegroup","roundest"))[,PR :=cumsum(su)/sum(su) * 100, by=agegroup]

outdt <- outdt[outdtu[,list(agegroup,roundest,PR)],,on=c("agegroup","roundest")]

setorder(outdt,ID)
outdt[, c("su") := NULL]
outdt

