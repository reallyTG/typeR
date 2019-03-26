library(GJRM)


### Name: hiv
### Title: HIV Zambian data
### Aliases: hiv hiv.polys

### ** Examples


## Not run: 
##D  
##D 
##D #########################################################
##D #########################################################
##D 
##D library("GJRM")
##D 
##D data("hiv", package = "GJRM")        
##D data("hiv.polys", package = "GJRM")  
##D 
##D #########################################################
##D #########################################################
##D ## The stuff below is useful if the user wishes to employ  
##D ## a Markov Random Field (MRF) smoother. It provides
##D ## the instructions to set up polygons automatically
##D ## and the dataset variable needed to fit a model with 
##D ## MRF.
##D #########################################################
##D #########################################################
##D #
##D # ## hiv.polys was already created and
##D # ## made available via the call 
##D # ## data("hiv.polys", package = "GJRM") 
##D # ## hiv.polys was created using the code below
##D #
##D # obj <- readRDS("ZMB_adm1.rds") 
##D # ## RDS Zambian Level 1 file obtained from 
##D # ## http://www.gadm.org. 
##D #
##D # pol <- polys.setup(obj)
##D #
##D # hiv.polys <- pol$polys   
##D # name <- cbind(names(hiv.polys), pol$names1)
##D # name
##D #
##D ## last step was to create a factor variable with range
##D ## range(name[,1]) where the numerical values were linked   
##D ## to the regions in name[, 2]. This is what was done in 
##D ## the hiv dataset; see hiv$region. Specifically,
##D ## the procedure used was
##D ##
##D # reg <- NULL
##D # 
##D # for(i in 1:dim(hiv)[1]){
##D # 
##D # if(hiv$region[i] == "Central")       reg[i] <- 1
##D # if(hiv$region[i] == "Copperbelt")    reg[i] <- 2
##D # if(hiv$region[i] == "Eastern")       reg[i] <- 3
##D # if(hiv$region[i] == "Luapula")       reg[i] <- 4
##D # if(hiv$region[i] == "Lusaka")        reg[i] <- 5
##D # if(hiv$region[i] == "North-Western") reg[i] <- 6
##D # if(hiv$region[i] == "Northern")      reg[i] <- 7
##D # if(hiv$region[i] == "Southern")      reg[i] <- 8
##D # if(hiv$region[i] == "Western")       reg[i] <- 9
##D # 
##D # }
##D # 
##D # hiv$region <- as.factor(reg)
##D # 
##D # 
##D #########################################################
##D #########################################################
##D 
##D xt <- list(polys = hiv.polys) 
##D 
##D # neighbourhood structure info for MRF  
##D # to use in model specification
##D 
##D #########################################################
##D # Bivariate brobit model with non-random sample selection
##D #########################################################          
##D      
##D sel.eq <- hivconsent ~ s(age) + s(education) + s(wealth) + 
##D                        s(region, bs = "mrf", xt = xt, k = 7) + 
##D                        marital + std + age1sex_cat + highhiv + 
##D                        partner + condom + aidscare + 
##D                        knowsdiedofaids + evertestedHIV + 
##D                        smoke + religion + ethnicity + 
##D                        language + s(interviewerID, bs = "re")
##D  
##D out.eq <- hiv        ~ s(age) + s(education) + s(wealth) + 
##D                        s(region, bs = "mrf", xt = xt, k = 7) + 
##D                        marital + std + age1sex_cat + highhiv + 
##D                        partner + condom + aidscare + 
##D                        knowsdiedofaids + evertestedHIV + 
##D                        smoke + religion + ethnicity + 
##D                        language      
##D 
##D theta.eq <-          ~ s(region, bs = "mrf", xt = xt, k = 7)                       
##D     
##D fl <- list(sel.eq, out.eq, theta.eq)    
##D      
##D # the above model specification is fairly
##D # complex and it serves to illustrate the 
##D # flexibility of the modelling approach
##D      
##D bss <- gjrm(fl, data = hiv, BivD = "J90", Model = "BSS",
##D             margins = c("probit", "probit"))
##D 
##D conv.check(bss)
##D 
##D set.seed(1)
##D sb <- summary(bss)
##D sb
##D 
##D plot(bss, eq = 1, seWithMean = TRUE, scheme = 1,   
##D      scale = 0, pages = 1, jit = TRUE)
##D                     
##D plot(bss, eq = 2, seWithMean = TRUE, scheme = 1,
##D      scale = 0, pages = 1, jit = TRUE)
##D 
##D 
##D prev(bss, sw = hiv$sw, type = "naive") 
##D 
##D set.seed(1)
##D prev(bss, sw = hiv$sw, type = "univariate") 
##D 
##D prev(bss, sw = hiv$sw) 
##D 
##D 
##D lr <- length(hiv.polys) 
##D prevBYreg  <- matrix(NA, lr, 2)
##D thetaBYreg <- NA
##D 
##D for(i in 1:lr) {
##D prevBYreg[i,1] <- prev(bss, sw = hiv$sw, ind = hiv$region==i, 
##D                        type = "univariate")$res[2]
##D prevBYreg[i,2] <- prev(bss, sw = hiv$sw, ind = hiv$region==i)$res[2]
##D thetaBYreg[i]  <- bss$theta[hiv$region==i][1]
##D }
##D 
##D 
##D zlim <- range(prevBYreg)  # to establish a common prevalence range
##D 
##D par(mfrow = c(1, 3), cex.axis = 1.3)
##D 
##D polys.map(hiv.polys, prevBYreg[,1], zlim = zlim, lab = "",  
##D           cex.lab = 1.5, cex.main = 1.5, 
##D           main = "HIV - Imputation Model")
##D           
##D polys.map(hiv.polys, prevBYreg[,2], zlim = zlim, cex.main = 1.5, 
##D           main = "HIV - Selection Model")
##D           
##D polys.map(hiv.polys, thetaBYreg, rev.col = FALSE, cex.main = 1.7, 
##D           main = expression(paste("Copula parameter (",hat(theta),")")))
##D           
##D sb$CItheta[1,]
## End(Not run)

#




