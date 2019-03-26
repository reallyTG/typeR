library(geecure)


### Name: geecure
### Title: Marginal proportional hazards mixture cure model with
###   generalzied estimating equations
### Aliases: geecure

### ** Examples

## Don't show: 
# for checks
           data(bmt)
           testdata <- bmt[(1:dim(bmt)[1])[bmt$Z9 == 2 | bmt$Z9 == 3], ] 
           geecuretest <- geecure(Surv(T2, d3) ~ Z8, cureform = ~ Z8, 
           data = testdata, model =  "semi", id = testdata$Z9, corstr= "independence")
## End(Don't show)
## No test: 
# Be patient, the following examples may take several minites on a faster computer.
# Example 1. Fit the marginal parametric PHMC model for the smoking cessation data.
data(smoking)
smoking$Time <- ifelse(smoking$Relapse == 0, smoking$Timept1, 
                       (smoking$Timept1 + smoking$Timept2)/2)

# plot the KM survival curve of smoking cessation data
plot(survfit(Surv(Time, Relapse) ~ SexF + (SI.UC), data = smoking), 
      ylab = "Survival function", xlab = "Years", ylim = c(0.5, 1), 
      xlim = c(0, 6), lty = 1:4, col = 1:4)
legend(0.5, 0.63, c("SI/Male", "SI/Female", "UC/Female", "UC/Male"), cex = 1, 
        col = c(2, 4, 3, 1), lty = c(2, 4, 3, 1))

geesmokingind <- geecure(Surv(Time, Relapse) ~ SexF + Duration + SI.UC + F10Cigs + 
      SexF * SI.UC, cureform = ~ SexF + Duration + SI.UC + F10Cigs + SexF * SI.UC, 
      data = smoking,  model = "para", id = smoking$Zip, corstr = "independence")

geesmokingexch <- geecure(Surv(Time, Relapse) ~ SexF + Duration + SI.UC + F10Cigs + 
      SexF * SI.UC, cureform = ~ SexF + Duration + SI.UC + F10Cigs + SexF * SI.UC, 
      data = smoking,  model = "para", id = smoking$Zip, corstr = "exchangeable")

# Example 2. Fit the marginal semiparametric PHMC model for the bmt data.
data(bmt)
bmt$g <- factor(bmt$g, label = c("ALL", "AML low risk", "AML high risk"))
bmt$Z8 <- factor(bmt$Z8, label = c("Otherwise", "FAB"))

# plot the KM survival curve of bmt data 
plot(survfit(Surv(T2, d3) ~ 1, data = bmt), xlab = "Days", ylab = "Survival Probability", 
     cex.lab = 1.7, cex.axis = 2, cex.main = 1.7, mark.time = TRUE)

geebmtind <- geecure(Surv(T2, d3) ~ factor(g) + Z8, cureform = ~ factor(g) + Z8, 
             data = bmt, model = "semi", id = bmt$Z9, corstr= "independence")           

geebmtexch <- geecure(Surv(T2, d3) ~ factor(g) + Z8, cureform = ~ factor(g) + Z8, 
              data = bmt, model = "semi", id = bmt$Z9, corstr= "exchangeable", 
              stdz = TRUE, boots = TRUE)

# Example 3. Fit the marginal semiparametric PHMC model for the tonsil data.
data(tonsil)
tonsil<-tonsil[-c(141,136,159),]
tonsil$Sex <- ifelse(tonsil$Sex == 1, 0, 1)
tonsil$Cond <- ifelse(tonsil$Cond == 1, 0, 1)
tonsil$T <- ifelse(tonsil$T < 4, 0, 1)

# plot the KM survival curve of tonsil data 
plot(survfit(Surv(Time, Status) ~ 1, data = tonsil), xlab = "Days", ylab = "Survival 
     Probability", cex.lab = 1.7, cex.axis = 2, cex.main = 1.7, mark.time = TRUE)

geetonsilind <- geecure2(Surv(Time, Status) ~ Sex + factor(Grade) + Age + Cond + T, 
                cureform = ~ Sex + factor(Grade) + Age + Cond + T, data = tonsil, 
                id = tonsil$Inst, corstr = "independence")

geetonsilexch <- geecure2(Surv(Time, Status) ~ Sex + factor(Grade) +Age + Cond + T, 
                 cureform = ~ Sex + factor(Grade) + Age + Cond + T, data = tonsil, 
                id = tonsil$Inst, corstr = "exchangeable",  stdz = TRUE, Var = FALSE)
## End(No test)



