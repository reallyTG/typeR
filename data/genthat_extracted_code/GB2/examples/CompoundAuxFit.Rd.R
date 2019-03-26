library(GB2)


### Name: CompoundAuxFit
### Title: Fitting the Compound Distribution based on the GB2 by the Method
###   of Pseudo Maximum Likelihood Estimation using Auxiliary Information
### Aliases: CompoundAuxFit pkl.cavgb2 lambda0.cavgb2 logl.cavgb2
###   scores.cavgb2 ml.cavgb2
### Keywords: distribution

### ** Examples

## Not run: 
##D 
##D library(simFrame)
##D data(eusilcP)
##D 
##D # Stratified cluster sampling
##D set.seed(12345)
##D srss <- SampleControl(design = "region", grouping = "hid", size = c(200*3, 1095*3, 1390*3,
##D  425*3, 820*3, 990*3, 400*3, 450*3, 230*3), k = 1)
##D 
##D # Draw a sample
##D s1 <- draw(eusilcP,srss)
##D #names(s1)
##D 
##D # Creation of auxiliary variables
##D ind <- order(s1[["hid"]])
##D ss1 <- data.frame(hid=s1[["hid"]], region=s1[["region"]], hsize=s1[["hsize"]], 
##D peqInc=s1[["eqIncome"]], age=s1[["age"]], pw=s1[[".weight"]])[ind,]
##D ss1[["child"]] <- as.numeric((ss1[["age"]]<=14))
##D ss1[["adult"]] <- as.numeric((ss1[["age"]]>=20))
##D sa <- aggregate(ss1[,c("child","adult")],list(ss1[["hid"]]),sum)
##D names(sa)[1] <- "hid"
##D sa[["children"]] <- as.numeric((sa[["child"]]>0))
##D sa[["single_a"]] <- as.numeric((sa[["adult"]]==1))
##D sa[["sa.ch"]] <- sa[["single_a"]]*sa[["children"]]
##D sa[["ma.ch"]] <- (1-sa[["single_a"]])*sa[["children"]]
##D sa[["nochild"]] <- 1-sa[["children"]]
##D 
##D # New data set
##D ns <- merge(ss1[,c("hid","region","hsize","peqInc","pw")], 
##D sa[,c("hid","nochild","sa.ch","ma.ch")], by="hid")
##D 
##D # Ordering the data set
##D ns <- ns[!is.na(ns$peqInc),]
##D index <- order(ns$peqInc)
##D ns <- ns[index,]
##D 
##D # 	Truncate at 0
##D ns <- ns[ns$peqInc>0,]
##D # income
##D peqInc <- ns$peqInc
##D # weights
##D pw <- ns$pw             
##D 
##D # Adding the weight adjustment
##D c1 <- 0.1                                
##D pwa <- robwts(peqInc,pw,c1,0.001)[[1]]        
##D corr <- mean(pw)/mean(pwa)              
##D pwa <- pwa*corr  
##D 
##D ns <- data.frame(ns, aw=pwa) 
##D 
##D # Empirical indicators with original weights
##D emp.ind <- c(main.emp(peqInc, pw),
##D               main.emp(peqInc[ns[["nochild"]]==1], pw[ns[["nochild"]]==1]),
##D               main.emp(peqInc[ns[["sa.ch"]]==1], pw[ns[["sa.ch"]]==1]),
##D               main.emp(peqInc[ns[["ma.ch"]]==1], pw[ns[["ma.ch"]]==1]))
##D 
##D # Matrix of auxiliary variables
##D z <- ns[,c("nochild","sa.ch","ma.ch")]
##D #unique(z)
##D z <- as.matrix(z)
##D 
##D # global GB2 fit, ML profile log-likelihood
##D gl.fit <- profml.gb2(peqInc,pwa)$opt1
##D agl.fit <- gl.fit$par[1]
##D bgl.fit <- gl.fit$par[2]
##D pgl.fit <- prof.gb2(peqInc,agl.fit,bgl.fit,pwa)[3]
##D qgl.fit <- prof.gb2(peqInc,agl.fit,bgl.fit,pwa)[4]
##D 
##D # Likelihood and convergence
##D proflikgl <- -gl.fit$value
##D convgl <- gl.fit$convergence
##D 
##D # Fitted GB2 parameters and indicators
##D profgb2.par <- c(agl.fit, bgl.fit, pgl.fit, qgl.fit)
##D profgb2.ind <- main.gb2(0.6, agl.fit, bgl.fit, pgl.fit, qgl.fit)
##D 
##D # Initial lambda and pl
##D pl0 <- c(0.2,0.6,0.2)
##D lambda0 <- lambda0.cavgb2(pl0, z, pwa)
##D 
##D # left decomposition
##D decomp <- "l"
##D facgl <- fg.cgb2(peqInc, agl.fit, bgl.fit, pgl.fit, qgl.fit, pl0 ,decomp)
##D fitcml <- ml.cavgb2(facgl, z, lambda0, pwa, maxiter=500) 
##D fitcml
##D convcl <- fitcml[[2]]$convergence
##D convcl
##D lambdafitl <- fitcml[[1]]
##D pglfitl <-  pkl.cavgb2(diag(rep(1,3),lambdafitl)
##D row.names(pglfitl) <- colnames(z)
## End(Not run)



