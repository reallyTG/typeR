library(adagio)


### Name: subsetsum
### Title: Subset Sum Problem
### Aliases: subsetsum
### Keywords: optimize

### ** Examples

## Not run: 
##D amount <- 4748652
##D products <- 
##D c(30500,30500,30500,30500,42000,42000,42000,42000,
##D   42000,42000,42000,42000,42000,42000,71040,90900,
##D   76950,35100,71190,53730,456000,70740,70740,533600,
##D   83800,59500,27465,28000,28000,28000,28000,28000,
##D   26140,49600,77000,123289,27000,27000,27000,27000,
##D   27000,27000,80000,33000,33000,55000,77382,48048,
##D   51186,40000,35000,21716,63051,15025,15025,15025,
##D   15025,800000,1110000,59700,25908,829350,1198000,1031655)
##D 
##D # prepare set
##D prods <- products[products <= amount]  # no elements > amount
##D prods <- sort(prods, decreasing=TRUE)  # decreasing order
##D 
##D # now find one solution
##D system.time(is <- subsetsum(prods, amount))
##D #  user  system elapsed 
##D # 0.320   0.032   0.359 
##D 
##D prods[is]
##D #  [1]   70740   70740   71190   76950   77382   80000   83800
##D #  [8]   90900  456000  533600  829350 1110000 1198000
##D 
##D sum(prods[is]) == amount
##D # [1] TRUE
## End(Not run)



