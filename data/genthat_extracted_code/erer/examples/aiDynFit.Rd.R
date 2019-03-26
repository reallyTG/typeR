library(erer)


### Name: aiDynFit
### Title: Fitting a Dynamic AIDS Model
### Aliases: aiDynFit
### Keywords: regression

### ** Examples


# --- Step 1: Read data
data(daExp, daBedRaw, daBed)

# --- Step 2: Hausman Test 
# 2.1 Getting started with a static AIDS model 
sh  <- c("sCN", "sVN", "sID", "sMY", "sCA", "sBR", "sIT", "sRW")
pr  <- c("lnpCN", "lnpVN", "lnpID", "lnpMY",  
         "lnpCA", "lnpBR", "lnpIT", "lnpRW")
du3 <- c("dum1","dum2","dum3")
rSta <- aiStaFit(y = daBed, share = sh, price = pr, shift = du3, 
  expen = "rte", omit = "sRW", hom = TRUE, sym = TRUE)
summary(rSta)

# The following steps should work. It takes about 20 seconds.
## Not run: 
##D # 2.2 The final Hausman test and new data
##D (dg <- daExp[, "dg"])
##D rHau <- aiStaHau(x = rSta, instr = dg, choice = FALSE)
##D names(rHau); colnames(rHau$daHau); colnames(rHau$daFit); rHau
##D two.exp <- rHau$daFit[, c("rte", "rte.fit")] 
##D bsStat(two.exp, digits = 4)
##D plot(data.frame(two.exp)); abline(a = 0, b = 1)
##D daBedFit <- rHau$daFit
##D 
##D # --- Step 3: Static and dynamic AIDS models 
##D # 3.1 Diagnostics and coefficients
##D hSta  <- update(rSta, y = daBedFit, expen = "rte.fit")
##D hSta2 <- update(hSta, hom = FALSE, sym = FALSE) 
##D hSta3 <- update(hSta, hom = FALSE, sym = TRUE)
##D hSta4 <- update(hSta, hom = TRUE,  sym = FALSE)
##D lrtest(hSta2$est, hSta$est) 
##D lrtest(hSta2$est, hSta3$est)
##D lrtest(hSta2$est, hSta4$est)
##D 
##D hDyn  <- aiDynFit(hSta)
##D hDyn2 <- aiDynFit(hSta2); lrtest(hDyn2$est, hDyn$est)
##D hDyn3 <- aiDynFit(hSta3); lrtest(hDyn2$est, hDyn3$est)
##D hDyn4 <- aiDynFit(hSta4); lrtest(hDyn2$est, hDyn4$est)
##D 
##D (table.2 <- rbind(aiDiag(hSta), aiDiag(hDyn)))
##D (table.3 <- summary(hSta))
##D (table.4 <- summary(hDyn))
##D                           
##D # 3.2 Elasticity calculation
##D es <- aiElas(hSta); esm <- es$marsh
##D ed <- aiElas(hDyn); edm <- ed$marsh
##D esm2 <- data.frame(c(esm[1:2, 2], esm[3:4, 3], 
##D   esm[5:6, 4], esm[7:8, 5], esm[9:10, 6], esm[11:12, 7], 
##D   esm[13:14, 8], esm[15:16, 9]))
##D edm2 <- data.frame(c(edm[1:2, 2], edm[3:4, 3], 
##D   edm[5:6, 4], edm[7:8, 5], edm[9:10, 6], edm[11:12, 7], 
##D   edm[13:14, 8], edm[15:16, 9]))
##D eEM <- cbind(es$expen, esm2, ed$expen[2], edm2) 
##D colnames(eEM) <- c("Country", "LR.expen", "LR.Marsh", 
##D   "SR.expen", "SR.Marsh")
##D (table.5 <- eEM[-c(15:16),])
##D (table.6a <- es$hicks[-c(15:16), -9])
##D (table.6b <- ed$hicks[-c(15:16), -9])
## End(Not run)



