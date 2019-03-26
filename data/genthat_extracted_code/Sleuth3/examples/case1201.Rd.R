library(Sleuth3)


### Name: case1201
### Title: State Average SAT Scores
### Aliases: case1201
### Keywords: datasets

### ** Examples

str(case1201)
attach(case1201)

## EXPLORATION
logTakers  <- log(Takers)
myMatrix   <- cbind(SAT, logTakers,Income, Years, Public, Expend, Rank)
if(require(car)){   # Use the car library   
scatterplotMatrix(myMatrix, diagonal="histogram", smooth=FALSE)  
  }                  
State[Public < 50] # Identify state with low Public (Louisiana)
State[Expend > 40] # Alaska
myLm1    <- lm(SAT ~ logTakers + Income+ Years + Public + Expend + Rank)
plot(myLm1,which=1)         
plot(myLm1,which=4)  # Cook's Distance       
State[29] # Identify State number 29?  ([1] Alaska) 
plot(myLm1,which=5)        
if(require(car)){   # Use the car library   
  crPlots(myLm1)  # Partial residual plot
}
myLm2 <- update(myLm1, ~ . ,subset=(State != "Alaska"))  
plot(myLm2,which=1)
plot(myLm2,which=4)
if(require(car)){   # Use the car library   
  crPlots(myLm2) # Partial residual plot
}
## RANK STATES ON SAT SCORES, ADJUSTED FOR Takers AND Rank
myLm3        <- lm(SAT ~ logTakers + Rank) 
myResiduals  <- myLm3$res 
myOrder      <- order(myResiduals)  
State[myOrder] 

## DISPLAY FOR PRESENTATION
dotchart(myResiduals[myOrder], labels=State[myOrder],
  xlab="SAT Scores, Adjusted for Percent Takers and HS Ranks (Deviation From Average)",
  main="States Ranked by Adjusted SAT Scores",
  bg="green", cex=.8)
abline(v=0, col="gray")

## VARIABLE SELECTION (FOR RANKING STATES AFTER ACCOUNTING FOR ALL VARIABLES)
expendSquared <- Expend^2   
if(require(leaps)){   # Use the leaps library   
  mySubsets   <- regsubsets(SAT ~ logTakers + Income+ Years + Public + Expend + 
    Rank + expendSquared, nvmax=8, data=case1201, subset=(State != "Alaska")) 
  mySummary <- summary(mySubsets) 
  p <- apply(mySummary$which, 1, sum) 
  plot(p, mySummary$bic, ylab = "BIC")  
  cbind(p,mySummary$bic) 
  mySummary$which[4,]  
  myLm4 <- lm(SAT ~ logTakers + Years + Expend + Rank, subset=(State != "Alaska"))
  summary(myLm4)

## DISPLAY FOR PRESENTATION
  myResiduals2 <- myLm4$res
  myOrder2 <- order(myResiduals2)
  newState <- State[State != "Alaska"]
  newState[myOrder2] 
  dotchart(myResiduals2[myOrder2], labels=State[myOrder2],
    xlab="Adjusted SAT Scores (Deviation From Average Adjusted Value)",
    main=paste("States Ranked by SAT Scores Adjusted for Demographics",
               "of Takers and Education Expenditure", sep = " "),
    bg="green", cex = .8)
  abline(v=0, col="gray")
}

detach(case1201)



