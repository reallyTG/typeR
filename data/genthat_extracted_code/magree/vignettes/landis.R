### R code from vignette source 'landis.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: landis.Rnw:44-47
###################################################
require(magree)
## Table 1 (O'Connell and Dobson, 1984)
summary(fit <- oconnell(landis, weight="unweighted"))


###################################################
### code chunk number 2: landis.Rnw:52-55
###################################################
## Table 1 (O'Connell and Dobson, 1984), continued
print(update(fit, weight="linear"))
print(update(fit, weight="quadratic"))


###################################################
### code chunk number 3: landis.Rnw:60-79
###################################################
slideTypeGroups <-
    list(c(2,3,5,26,31,34,42,58,59,67,70,81,103,120),
         c(7,10:13,17,23,30,41,51,55,56,60,65,71,73,76,86,87,105,111,116,119,124),
         c(4,6,24,25,27,29,39,48,68,77,79,94,101,102,117),
         c(9,32,36,44,52,62,84,95),
         c(35,53,69,72),
         c(8,15,18,19,47,64,82,93,98,99,107,110,112,115,121),
         c(1,16,22,49,63,66,78,90,100,113),
         c(28,37,40,61,108,114,118),
         106,
         43,
         83,
         c(54,57,88,91,126),
         c(74,104),
         38,
         46,
         c(89,122),
         c(80,92,96,123),
         85)


###################################################
### code chunk number 4: landis.Rnw:83-88
###################################################
data.frame(SlideType=1:18,
           S1=sapply(slideTypeGroups, 
               function(ids) mean(fit$s1[as.character(ids)])),
           S2=sapply(slideTypeGroups, 
               function(ids) mean(fit$s2[as.character(ids)])))


###################################################
### code chunk number 5: landis.Rnw:92-97
###################################################
oconnell(landis==1)
oconnell(landis==2)
oconnell(landis==3)
oconnell(landis==4)
oconnell(landis==5)


###################################################
### code chunk number 6: landis.Rnw:101-103
###################################################
fit2 <- schouten(landis)
summary(fit2)


