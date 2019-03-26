library(GJRM)


### Name: war
### Title: Civil war data
### Aliases: war

### ** Examples


## Not run: 
##D  
##D 
##D #########################################################
##D #########################################################
##D 
##D library("GJRM")
##D 
##D data("war", package = "GJRM")        
##D 
##D ###################################################
##D # Bivariate brobit model with partial observability
##D ###################################################  
##D 
##D reb.eq <- onset ~ instab + oil + warl + lpopl + lmtnest + ethfrac +
##D                   polity2l + s(gdpenl) + s(relfrac) 
##D gov.eq <- onset ~ instab + oil + warl + ncontig + nwstate + s(gdpenl)   
##D 
##D bpo <- gjrm(list(reb.eq, gov.eq), data = war, Model = "BPO",
##D             margins = c("probit", "probit"))
##D conv.check(bpo)
##D 
##D # perhaps model is to complex
##D 
##D set.seed(1)
##D sbpo <- summary(bpo)
##D sbpo$theta; sbpo$CItheta
##D 
##D # let's exclude the correlation parameter in fitting
##D 
##D bpo0 <- gjrm(list(reb.eq, gov.eq), data = war, Model = "BPO0",
##D              margins = c("probit", "probit"))
##D conv.check(bpo0)
##D 
##D summary(bpo0)
##D 
##D 
##D war.eq <- onset ~ instab + oil + warl +  ncontig + nwstate + lpopl +
##D                   lmtnest + ethfrac + polity2l + s(gdpenl) + s(relfrac)    
##D Probit <- gam(war.eq, family = binomial(link = "probit"), data = war)                 
##D summary(Probit)
##D 
##D 
##D coef(Probit)[(which(names(coef(Probit)) == "s(gdpenl).9"))]
##D 
##D coef(bpo0)[(which(names(coef(bpo)) == "s(gdpenl).9"))]
##D 
##D 
##D probitW <- bpoW <- bpoReb <- bpoGov <- NA
##D gdp.grid <- seq(0, 8)
##D 
##D median.values <- data.frame(t(apply(war, 2, FUN = median)))
##D 
##D for (i in 1:length(gdp.grid)){
##D 
##D newd <- median.values; newd$gdpenl <- gdp.grid[i]
##D eta1 <- predict(bpo0, eq = 1, newd)
##D eta2 <- predict(bpo0, eq = 2, newd)
##D probitW[i] <- predict(Probit, newd, type = "response") 
##D bpoW[i]    <- pnorm(eta1)*pnorm(eta2) 
##D bpoReb[i]  <- pnorm(eta1) 
##D bpoGov[i]  <- pnorm(eta2) 
##D 
##D }
##D 
##D 
##D plot(gdp.grid, probitW, type = "l", ylim = c(0, 0.55), lwd = 2, 
##D      col = "grey", xlab = "GDP per Capita (in thousands)", 
##D      ylab = "Pr(Outcome)", main = "Probabilities for All Outcomes", 
##D      cex.main = 1.5, cex.lab = 1.3, cex.axis = 1.3)
##D lines(gdp.grid, bpoW,   lwd = 2)
##D lines(gdp.grid, bpoReb, lwd = 2, lty = 2)
##D lines(gdp.grid, bpoGov, lwd = 2, lty = 3)
##D 
##D #dev.copy(postscript, "probWAR.eps", width = 8)
##D #dev.off() 
##D 
## End(Not run)

#




