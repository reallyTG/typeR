library(maxstat)


### Name: DLBCL
### Title: Diffuse large B-cell lymphoma
### Aliases: DLBCL
### Keywords: datasets

### ** Examples


library("survival")

set.seed(29)

# compute the cutpoint and plot the empirical process 

mod <- maxstat.test(Surv(time, cens) ~ MGE, data=DLBCL, smethod="LogRank")

print(mod)

## Not run: 
##D   # postscript("statDLBCL.ps", horizontal=F, width=8, height=8)
##D   pdf("statDLBCL.pdf", width=8, height=8)
## End(Not run)
par(mai=c(1.0196235, 1.0196235, 0.8196973, 0.4198450))
plot(mod, cex.lab=1.6, cex.axis=1.6, xlab="Mean gene expression",lwd=2)
## Not run: 
##D   dev.off()
## End(Not run)

# significance of the cutpoint
# limiting distribution

maxstat.test(Surv(time, cens) ~ MGE, data=DLBCL,
             smethod="LogRank", pmethod="Lau92", iscores=TRUE)

# improved Bonferroni inequality, plot with significance bound

maxstat.test(Surv(time, cens) ~ MGE, data=DLBCL,
             smethod="LogRank", pmethod="Lau94", iscores=TRUE)

mod <- maxstat.test(Surv(time, cens) ~ MGE, data=DLBCL, smethod="LogRank",
                    pmethod="Lau94", alpha=0.05)
plot(mod, xlab="Mean gene expression")

## Not run: 
##D #  postscript(file="RNewsStat.ps",horizontal=F, width=8, height=8)
##D    pdf("RNewsStat.pdf", width=8, height=8)
##D 
## End(Not run)
par(mai=c(1.0196235, 1.0196235, 0.8196973, 0.4198450))
plot(mod, xlab="Mean gene expression", cex.lab=1.6, cex.axis=1.6)
## Not run: 
##D   dev.off()
## End(Not run)

# small sample solution Hothorn & Lausen

maxstat.test(Surv(time, cens) ~ MGE, data=DLBCL,
             smethod="LogRank", pmethod="HL")

# normal approximation

maxstat.test(Surv(time, cens) ~ MGE, data=DLBCL,
             smethod="LogRank", pmethod="exactGauss", iscores=TRUE,
             abseps=0.01)

# conditional Monte-Carlo
maxstat.test(Surv(time, cens) ~ MGE, data=DLBCL,
             smethod="LogRank", pmethod="condMC", B = 9999) 

# survival analysis and plotting like in Alizadeh et al. (2000)

  splitGEG <- rep(1, nrow(DLBCL))
  DLBCL <- cbind(DLBCL, splitGEG)
  DLBCL$splitGEG[DLBCL$GEG == "Activated B-like"] <- 0

  plot(survfit(Surv(time, cens) ~ splitGEG, data=DLBCL),
       xlab="Survival time in month", ylab="Probability")

  text(90, 0.7, "GC B-like")
  text(60, 0.3, "Activated B-like")

  splitIPI <- rep(1, nrow(DLBCL))
  DLBCL <- cbind(DLBCL, splitIPI)
  DLBCL$splitIPI[DLBCL$IPI <= 2] <- 0

  plot(survfit(Surv(time, cens) ~ splitIPI, data=DLBCL),
       xlab="Survival time in month", ylab="Probability")

  text(90, 0.7, "Low clinical risk")
  text(60, 0.25, "High clinical risk")

  # survival analysis using the cutpoint 

  splitMGE <- rep(1, nrow(DLBCL))
  DLBCL <- cbind(DLBCL, splitMGE)
  DLBCL$splitMGE[DLBCL$MGE <= mod$estimate] <- 0

  ## Not run: 
##D    # postscript("survDLBCL.ps",horizontal=F, width=8, height=8)
##D     pdf("survDLBCL.pdf", width=8, height=8)
##D 
##D   
## End(Not run)
  par(mai=c(1.0196235, 1.0196235, 0.8196973, 0.4198450))

  plot(survfit(Surv(time, cens) ~ splitMGE, data=DLBCL),
       xlab = "Survival time in month",
       ylab="Probability", cex.lab=1.6, cex.axis=1.6, lwd=2)

  text(90, 0.9, expression("Mean gene expression" > 0.186), cex=1.6)   
  text(90, 0.45, expression("Mean gene expression" <= 0.186 ), cex=1.6)   

  ## Not run: 
##D     dev.off()
##D   
## End(Not run)



