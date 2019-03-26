library(TropFishR)


### Name: predict_mod
### Title: Prediction models
### Aliases: predict_mod
### Keywords: function prediction ypr

### ** Examples

#______________________________________
# Yiel Per Recruit (YPR) / Beverton and Holt's model
#______________________________________
# age structured data
# Nemipterus marginatus
threadfin <- list(Winf = 286, K = 0.37, t0 = -0.2, M = 1.1, tr = 0.4)

predict_mod(threadfin, FM_change = seq(0,6,0.1),
   tc_change = seq(0.2,1,0.2), type = 'ypr')  #where it is maximal  = MSY

# Leiognathus spendens (Pauly, 1980)
ponyfish <- list(Winf = 64, K = 1, t0 = -0.2, M = 1.8, tr = 0.2)

predict_mod(ponyfish, tc_change = c(0.2,0.3,1.0), type = 'ypr', plot=TRUE)

#______________________________________
# length structured data
# Xiphias gladius (Berkeley and Houde, 1980)
swordfish <- list(Linf = 309, K = 0.0949, M = 0.18,
                  a = 0.0003, b = 3, Lr = 90)

select.list <- list(selecType = 'trawl_ogive', L50 = 120, L75 = 132)
#swordfish$midLengths <- seq(60,300,5)

output <- predict_mod(param = swordfish, Lc_change = c(100,118,150,180),
            s_list = select.list, type = 'ypr', Lmin = 90, Lincr = 8)
plot(output)

data(hake)
hake$Lr <- 35
select.list <- list(selecType = 'trawl_ogive', L50 = 50, L75 = 54)
output <- predict_mod(param = hake, FM_change = seq(0,3,0.05),
                      Lc_change = seq(30,70,1), s_list = select.list,
                      type = 'ypr', plot = FALSE, curr.Lc = 50, curr.E = 0.73)
plot(output, type = "Isopleth", xaxis1 = "FM", yaxis1 = "Y_R.rel", mark = TRUE)

output <- predict_mod(param = hake, E_change = seq(0,1,0.1),
                      Lc_change = seq(2,120,2), #s_list = select.list,
                      type = 'ypr', plot = FALSE)
plot(output, type = "Isopleth", xaxis1 = "E", yaxis1 = "B_R")

#______________________________________
#      Thompson and Bell model
#______________________________________
# with age structured data
data(shrimps)

output <- predict_mod(param = shrimps, FM_change = seq(0.1,20,0.1),
     type = "ThompBell", age_unit = "month", plot = TRUE)

#______________________________________
# with length structured data
data(hake)
par(mar = c(5, 4, 4, 7))
predict_mod(param = hake,FM_change = seq(0.1,3,0.05),
     type = 'ThompBell', plot = TRUE)

# create list with selectivity information
select.list <- list(selecType = 'trawl_ogive', L50 = 50, L75 = 55)

output <- predict_mod(param = hake, FM_change = seq(0,2,0.1),
     Lc_change = seq(20,70,1),
     curr.E = 0.4, curr.Lc = 50,
     type = 'ThompBell', s_list = select.list)
plot(output, xaxis1 = "FM", yaxis_iso = "Lc", yaxis1 = "B_R", mark = TRUE)





