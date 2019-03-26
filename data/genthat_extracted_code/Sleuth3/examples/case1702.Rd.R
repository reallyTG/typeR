library(Sleuth3)


### Name: case1702
### Title: Love and Marriage
### Aliases: case1702
### Keywords: datasets

### ** Examples

str(case1702)
attach(case1702)
      
## EXPLORATION   
x <- cbind(HP,WP,HC,WC) # 4 components of level of love you feel for spouse
y <- cbind(PW,PH,CW,CH) # 4 components of level of love you perceive from spouse 

if(require(CCA)){     # Use the CCA library         
  myCCA   <- cc(x,y)  # Store canonical correlation computations 
  canCor   <- myCCA$cor  # Extract the canonical correlations
  canCor  #[1] 0.9506990 0.8665601 0.5571876 0.1106555

# Make a function to test the number of canonical correlations (advanced).
# Bartlett modification of likelihood ratio test
# Reference: Mardia, Kent, and Bibby, 1980, Multivariate Analysis, 
myTest  <- function(xMatrix,yMatrix) { 
  if(require(CCA)){     # Use the CCA library    
    myCCA       <- cc(xMatrix,yMatrix) # Store CCA computations  
    canCor      <- myCCA$cor   # extract the canonical correlations
    n           <- dim(x)[1] # number of rows of x,= sample size
    p           <- dim(y)[2] # number of component variables in y
    q           <- dim(x)[2] # number of component variables in x
    k           <- min(p,q) # the maximum number of canonical pairs
    testStat    <- rep(0,k) #  store the test statistics; initially set to 0
    degFr       <- rep(0,k)  # store the associated degrees of freedom
    canCor2     <- canCor[k:1] # Reverse order for the following calculations
    productTerm <-  1        
    for (i in 1:k)  {
      productTerm   <-  productTerm*(1 - canCor2[i]^2)
      degFr[i]      <-  (p + 1 - i)*(q + 1 - i)
      testStat[i]   <- -(n -(p+q+3)/2)*log(productTerm)
        } 
    pair <- 1:k
    testStat <- round(testStat[k:1],2)  # Revert to original order; round  
    pValue  <- round(1 - pchisq(testStat,degFr),4) # p-value   to 4 digits
    canCor  <- round(canCor,4)   # Round to 4 digits
    cbind(pair,canCor, testStat,degFr, pValue) # Show the results; 
    }    }
myTest(x,y)

# Explore possible meaningful linear combination suggested by first pair of CCs
round(myCCA$xcoef,1)
round(myCCA$ycoef,1)
# The 1st column of xcoef is almost entirely HC; 1st column of ycoef is CW
ccX1 <- myCCA$scores$xscores[,1]
plot(ccX1 ~ jitter(HC)) # See if HC is a good substitute for 1st X canonical var
cor(ccX1,HC)    #[1] 0.9719947

ccY1 <- myCCA$scores$yscores[,1]
plot(ccY1 ~ jitter(CW)) # See if CW is a good substitute for 1st y canonical var
cor(ccY1, CW)   #[1] 0.9975468

# Analyze the correlation of the meaningful substitute variables 
cor(HC,CW)   # [1]  0.9280323
myLm1 <- lm(HC ~ CW)
summary(myLm1) # p-value < 0.0001 (test for slope= 0 equiv to test that corr = 0)


# Explore possible meaningful linear combination suggested by 2nd pair of CCs
# Suggested substitutes from 2nd columns above are WC and CH
ccX2  <- myCCA$scores$xscores[,2]
WCres  <- lm(WC ~ HC)$res  # WC with effect of HC removed
plot(ccX2 ~ WCres)
cor(ccX2,WCres)   #[1] 0.9045225

ccY2  <- myCCA$scores$yscores[,2]
CHres  <- lm(CH ~ CW)$res  # CH with effect of CW removed
plot(ccY2 ~ CHres)
cor(ccY2,CHres)   # [1] 0.9280248

cor(WC,CH)           #[1] 0.8134213
myLm2 <- lm(WC ~ CH)
summary(myLm2)       # p-value < 0.0001 for test that correlation = 0

# Explore cannonical correlations from other groupings of variables
x <- cbind(HP, HC, PW, CW)  # husband's responses
y <- cbind(WP, WC, PH, CH)  # wife's responses
myTest(x,y)    # No evidence that husbands' responses are correlated with wifes'  
x <- cbind(HP,PW,WP,PH)    # passionate responses 
y <- cbind(HC,CW,WC,CH)    # compassionate responses
myTest(x,y) #No evidence that passionate anc compassionate responses are correlated 


##  GRAPHICAL DISPLAYS FOR PRESENTATION
jFactor <- 0.3   # Jittering factor (try different values to see what works)
jHC <- jitter(HC,factor=jFactor)
jCW <- jitter(CW,factor=jFactor)
jCH <- jitter(CH,factor=jFactor)
jWC <- jitter(WC,factor=jFactor)
opar <- par(no.readonly=TRUE)  # Store current graphical parameter settings
par(mfrow=c(2,2)) # Prepare to make a 2x2 panel of graphs
par(mar=c(1.1,4.1,1.1,1.1) )  # Adjust margins
plot(jHC ~ jCW, ylab="Husband's Compassionate Love For His Wife (Jittered)",
  xlab="", ylim=c(3,5.1), xlim=c(3,5.1), col="black", pch=21, lwd=2,  
  bg="green", cex=2 )  
text(3,5.1,"correlation = 0.93",adj=0)
text(3,5.0,"p-value < 0.0001",adj=0)
abline(myLm1)
 
par(mar=c(1.1,1.1,1.1,4.1)) 
plot(jHC ~ jCH, xlab="", ylab="", ylim=c(3,5.1), xlim=c(3,5.1), 
  col="black", pch=21, lwd=2, bg="green",  cex=2 )  
cor(HC,CH)      #[1] 0.274204
myLm3 <- lm(HC ~ CH)
summary(myLm3)# p-value = 0.143
text(3,5.1,"correlation = 0.27",adj=0)
text(3,5.0,"p-value = 0.14",adj=0)
abline(myLm3)
 
par(mar=c(4.1,4.1,1.1,1.1)) 
plot(jWC ~ jCW,
  xlab="Husband's Perceived Compassionate Love From His Wife (Jittered)",
  ylab="Wife's Compassionate Love For Her Husband (Jittered)",
  ylim=c(3,5.1), xlim=c(3,5.1), col="black", pch=21, lwd=2, bg="green", cex=2 ) 
cor(WC,CW)           #[1] 0.04171195
myLm4 <- lm(WC ~ CW)
summary(myLm4)       # p-value = 0.827
text(3,3.1,"correlation = 0.04",adj=0)
text(3,3,"p-value = 0.8",adj=0)
abline(myLm4)
 
par(mar=c(4.1,1.1,1.1,4.1))   
plot(jWC ~ jCH, ylab="",  
  xlab="Wife's Perceived Compassionate Love From Her Husband (Jittered)",
  ylim=c(3,5.1), xlim=c(3,5.1), col="black", pch=21,  lwd=2, bg="green", cex=2 )  
text(3,3.1,"correlation = 0.81",adj=0)
text(3,3,"p-value < 0.0001",adj=0)
abline(myLm2)

par(opar) # Restore previous graphics parameter settings
}
detach(case1702)



