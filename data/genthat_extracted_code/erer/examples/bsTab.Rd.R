library(erer)


### Name: bsTab
### Title: Generating Pretty Statistical Tables
### Aliases: bsTab
### Keywords: manip

### ** Examples


# a simulated data
tes <- data.frame(est = c(4, 56, 12), err = c(0.3, 0.56, 0.789), 
  t.rat = c(2.56, 7.9, 1.2), p.val = c(0.002, 0.23, 0.061))
tes
bsTab(tes)
bsTab(w = tes, need = "2E")

# real data
data(daIns)
ra <- glm(formula = Y ~ Injury + HuntYrs + Nonres + 
                    Lspman + Lnong + Gender + Age + 
                    Race + Marital + Edu + Inc + TownPop, 
          family = binomial(link="logit"),
          data = daIns, x = TRUE)
(ca <- data.frame(summary(ra)$coefficients))

# an object of class 'glm' as input
bsTab(w = ra, add.sig = "TE")
bsTab(w = ra, wrap.TE = "[")
bsTab(w = ra, need = "5")
bsTab(w = ra, need = "4T", wrap.TE = "[")
final <- bsTab(w = ra, need = "3T", 
  percent = c(0.01, 0.05, 0.10),
  symbol = c("a", "b", "c", ""), digits = 4)
final
print(final, right = FALSE) 

# any matrix with at least four columns can be supplied
cbind(bsTab(ca), bsTab(ra)) 



