library(psych)


### Name: scoreIrt
### Title: Find Item Response Theory (IRT) based scores for dichotomous or
###   polytomous items
### Aliases: scoreIrt scoreIrt.1pl scoreIrt.2pl score.irt score.irt.poly
###   score.irt.2 irt.stats.like irt.tau irt.se
### Keywords: multivariate models

### ** Examples

if(FALSE) {  #not run in the interest of time, but worth doing
d9 <- sim.irt(9,1000,-2.5,2.5,mod="normal") #dichotomous items
test <- irt.fa(d9$items)
scores <- scoreIrt(test,d9$items)
scores.df <- data.frame(scores,true=d9$theta) #combine the estimates with the true thetas.
pairs.panels(scores.df,pch=".",
main="Comparing IRT and classical with complete data") 
#now show how to do this with a quasi-Rasch model
tau <- irt.tau(d9$items)
scores.rasch <- scoreIrt(tau,d9$items,key=rep(1,9))
scores.dfr<- data.frame(scores.df,scores.rasch) #almost identical to 2PL model!
pairs.panels(scores.dfr)
#with all the data, why bother ?

#now delete some of the data
d9$items[1:333,1:3] <- NA
d9$items[334:666,4:6] <- NA
d9$items[667:1000,7:9] <- NA
scores <- scoreIrt(test,d9$items)
scores.df <- data.frame(scores,true=d9$theta) #combine the estimates with the true thetas.
pairs.panels(scores.df, pch=".",
main="Comparing IRT and classical with random missing data")
 #with missing data, the theta estimates are noticably better.
#now show how to do this with a quasi-Rasch model
tau <- irt.tau(d9$items)
scores.rasch <- scoreIrt(tau,d9$items,key=rep(1,9))
scores.dfr <- data.frame(scores.df,rasch = scores.rasch)
pairs.panels(scores.dfr)  #rasch is actually better!



v9 <- sim.irt(9,1000,-2.,2.,mod="normal") #dichotomous items
items <- v9$items
test <- irt.fa(items)
total <- rowSums(items)
ord <- order(total)
items <- items[ord,]


#now delete some of the data - note that they are ordered by score
items[1:333,5:9] <- NA
items[334:666,3:7] <- NA
items[667:1000,1:4] <- NA
items[990:995,1:9] <- NA   #the case of terrible data
items[996:998,] <- 0   #all wrong
items[999:1000] <- 1   #all right
scores <- scoreIrt(test,items)
unitweighted <- scoreIrt(items=items,keys=rep(1,9)) #each item has a discrimination of 1
#combine the estimates with the true thetas.
scores.df <- data.frame(v9$theta[ord],scores,unitweighted) 
   
colnames(scores.df) <- c("True theta","irt theta","total","fit","rasch","total","fit")
pairs.panels(scores.df,pch=".",main="Comparing IRT and classical with missing data") 
 #with missing data, the theta estimates are noticably better estimates 
 #of the generating theta than using the empirically derived factor loading weights

#now show the ability to score multiple scales using keys
ab.tau <- irt.tau(ability)  #first find the tau values
ab.keys <- make.keys(ability,list(g=1:16,reason=1:4,letter=5:8,matrix=9:12,rotate=13:16))
ab.scores <- scoreIrt(stats=ab.tau, items = ability, keys = ab.keys)

#and now do it for polytomous items 
bfi.tau <- irt.tau(bfi[1:25])
bfi.keys <- make.keys(bfi[1:25],list(agree=c(-1,2:5),conscientious=c(6:8,-9,-10),
extra=c(11:12,-13,-14,-15),neur = 16:20,open =c(21,-22,23,24,-25)))
bfi.scores <- scoreIrt(bfi.tau,bfi[1:25],bfi.keys)
}



