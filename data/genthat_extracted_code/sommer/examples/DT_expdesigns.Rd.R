library(sommer)


### Name: DT_expdesigns
### Title: Data for different experimental designs
### Aliases: DT_expdesigns

### ** Examples


# #### =================================== ####
# #### ===== Augmented Block Design 1 ==== ####
# #### =================================== ####
# data(DT_expdesigns)
# names(DT)
# data1 <- DT$au1
# head(data1)
# ## response variable: "yield"
# ## check indicator: "entryc" ('nc' for all unreplicated, but personal.name for checks)
# ## blocking factor: "block"
# ## treatments, personal names for replicated and non-replicated: "trt"
# ## check no check indicator: "new"
# mix1 <- mmer(yield~entryc, 
#              random=~block+trt, 
#              rcov=~units,
#              data=data1)
# summary(mix1)
# 
# #### =================================== ####
# #### ==== North Carolina Design III ==== ####
# #### =================================== ####
# 
# data.car3 <- DT$car3
# data.car3$setrep <- paste(data.car3$set,data.car3$rep,sep=":")
# head(data.car3)
# ## response variable: "yield"
# ## male indicator: "male"
# ## female indicator: "female"
# ## replication: "rep"
# ## set of males: "set"
# mix.car3 <- mmer(yield ~ set, 
#                  random=~ male
#                          + female ,
#                  rcov=~units,
#                  data=data.car3)
# (suma <- summary(mix.car3))





