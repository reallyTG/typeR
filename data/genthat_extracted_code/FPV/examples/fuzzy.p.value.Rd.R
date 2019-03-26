library(FPV)


### Name: fuzzy.p.value
### Title: Testing hypotheses based on fuzzy hypotheses and fuzzy data: A
###   fuzzy p-value approach
### Aliases: fuzzy.p.value
### Keywords: Fuzzy p-value Fuzzy significance level Fuzzy data Fuzzy
###   hypothesis Testing hypotheses Fuzzy ranking method
###   TriangularFuzzyNumber TrapezoidalFuzzyNumber FuzzyNumber
###   PowerFuzzyNumber

### ** Examples


library(FuzzyNumbers)
library(FuzzyNumbers.Ext.2)

# Example 1: 
t <- FuzzyNumber(-0.5, .6, .8, 1,
  lower=function(alpha) qbeta(alpha,0.4,3),
  upper=function(alpha) (1-alpha)^4
  )
H0b = PowerFuzzyNumber(.5,1.2,1.5,1.6, p.left=1, p.right=0.5) 
p.value = function(t,H0b) pt((t-H0b)/sqrt(1/9), df=8)
fuzzy.p.value(t, H0b, sig=.05, p.value, knot.n=20,  fig=1, lty=4, lwd=4, col=6)  
fuzzy.p.value(t, H0b, sig=.05, p.value, knot.n=20, fig=2)$result
sig = TriangularFuzzyNumber(0, .03, .30)
fuzzy.p.value(t, H0b, sig, p.value, knot.n=20, fig=2)$cuts #Only print alpha-cuts of fuzzy p-value

sig = TrapezoidalFuzzyNumber(0, .05, .05, .20)
fuzzy.p.value(t, H0b, sig, p.value, knot.n=20, fig=3, col=2)$accepted

fuzzy.p.value(t, H0b, sig=0.05, p.value, knot.n=20, fig=3)


# Example 2: For working by some elements of  fuzzy p-value (continue of Example 1)
Fuzzy.p.value <- fuzzy.p.value(t, H0b, sig=.05, fig=1, p.value, knot.n=4)
class(Fuzzy.p.value)
print( Fuzzy.p.value )

Fuzzy.p.value$core  #Core of fuzzy p-value
Fuzzy.p.value$support  #Support of fuzzy p-value

# Upper bounds of fuzzy p-value
Fuzzy.p.value$cuts[,"U"] #Or equivalently,  Fuzzy.p.value$cuts[,2]



# Example 3: (Exam 4.4 from persian p-value paper)
knot.n = 10
t = TriangularFuzzyNumber(1315, 1327, 1342)
H0b = TriangularFuzzyNumber(1275, 1300, 1325)
sig = TriangularFuzzyNumber(0, .05, .1)
p.value = function(t,H0b) 1-pnorm((t-H0b)/(120/6))
fuzzy.p.value(t, H0b, sig, p.value, knot.n, fig=3)



# Example 4: (Exam 4.5 from persian p-value paper, where X~P(12*lambda) )
knot.n = 200
t = TriangularFuzzyNumber(24, 27, 30)
H0b = TriangularFuzzyNumber(2.75, 3.25, 3.25)
sig = TriangularFuzzyNumber(0, .05, .1)
p.value = function(t,H0b) ppois(t, 12*H0b)
fuzzy.p.value(t, H0b, sig, p.value=p.value, knot.n, fig=2, lwd=2)
# Repeat example with knot.n=10 to give a non-precise result 



# Example 5: A new example
t <- FuzzyNumber(1, 1.4, 1.8, 2,
  lower=function(alpha) pbeta(alpha,2,1),
  upper=function(alpha) 1-sqrt(alpha)
  )
H0b = TriangularFuzzyNumber(4,5,7) 
p.value = function(t,H0b) pt( (t-H0b)/sqrt(1/4), df=4)
fuzzy.p.value(t, H0b, sig=.1^3, p.value, knot.n=10, fig=3, col=2, lwd=2, xlim=c(0,.012)) 


# ---------- Examples of Springer fuzzy p-value paper ------------------

# Example 1 (Springer fuzzy p-value).
T1 = TriangularFuzzyNumber(1257,1261,1278) 
T2 = TriangularFuzzyNumber(1251,1287,1302) 
T3 = TriangularFuzzyNumber(1315,1346,1372)
T4 = TriangularFuzzyNumber(1306,1330,1348) 
T5 = TriangularFuzzyNumber(1298,1329,1349) 
T6 = TriangularFuzzyNumber(1288,1301,1320)
T7 = TriangularFuzzyNumber(1298,1317,1333) 
T8 = TriangularFuzzyNumber(1241,1269,1284) 
T9 = TriangularFuzzyNumber(1325,1353,1369)
T10= TriangularFuzzyNumber(1301,1337,1355)

t = 10^(-1)*(T1+T2+T3+T4+T5+T6+T7+T8+T9+T10)
t # T(1288,1313,1331)

plot(T1, add=FALSE, lwd=2, xlim=c(1230,1380))
plot(T2, add=TRUE, lwd=2)
plot(T3, add=TRUE, lwd=2)
plot(T4, add=TRUE, lwd=2)
plot(T5, add=TRUE, lwd=2)
plot(T6, add=TRUE, lwd=2)
plot(T7, add=TRUE, lwd=2)
plot(T8, add=TRUE, lwd=2)
plot(T9, add=TRUE, lwd=2)
plot(T10, add=TRUE, lwd=2)
plot(t, add=TRUE, col=2, lwd=4)

H0b = 1300
# T ~ N(1300,30^2/10)
p.value = function(t,H0b) pnorm( t, mean=1300, sd=30/sqrt(10), lower.tail=FALSE)
# Or equivalently
p.value = function(t,H0b) pnorm( (t-1300)/(30/sqrt(10)), lower.tail=FALSE)
sig = TriangularFuzzyNumber(0,0.05,0.1)
fuzzy.p.value(t, H0b, sig, p.value, knot.n=50, fig=2, lwd=2, xlim=c(0,1)) 


# Example 2. (continue of Example 1)
t = TriangularFuzzyNumber(1300,1313,1321)
p.value = function(t,H0b) 2 * pnorm( t, mean=1300, sd=30/sqrt(10), lower.tail=FALSE)
sig = TriangularFuzzyNumber(0,0.15,0.3)
fuzzy.p.value(t, H0b, sig, p.value, knot.n=50, fig=3, lwd=2) 



# Example 4 (Springer fuzzy p-value)  X ~ N(mu,sigma^2).
sigma =120
n = 36
x.bar <- 1327
H0b = TriangularFuzzyNumber(1275, 1300, 1325)
sig = TriangularFuzzyNumber(0, 0.15, 0.3)
p.value = function(x.bar,H0b) pnorm( x.bar, mean=H0b, sd=sigma/sqrt(n), lower.tail=FALSE)
fuzzy.p.value(x.bar, H0b, sig, p.value, knot.n=10, fig=2, lwd=2, xlim=c(0,1)) 

#Continue
sig1 = PowerFuzzyNumber(0, 0.15, 0.15, 0.3, p.left=2, p.right=2)
plot(sig1, xlim=c(0,.6))
sig2 = PowerFuzzyNumber(0, 0.15, 0.15, 0.3, p.left=.5, p.right=.5)
plot(sig2, col=2, add=TRUE)
fuzzy.p.value(x.bar, H0b, sig1, p.value, knot.n=10, fig=2, lwd=2, xlim=c(0,1)) 
fuzzy.p.value(x.bar, H0b, sig2, p.value, knot.n=10, fig=2, lwd=2, xlim=c(0,1)) 






## The function is currently defined as
function (t, H0b, sig = 0.05, p.value, knot.n = 10, fig = c("1", 
    "2", "3"), ...) 
{
    if (fig == 1) {
        P = f2apply(t, H0b, p.value, knot.n = knot.n, type = "l", 
            I.O.plot = FALSE, ...)
    }
    else {
        if (fig == 2) {
            P = f2apply(t, H0b, p.value, knot.n = knot.n, type = "l", 
                I.O.plot = FALSE, ...)
            if (class(sig) == "numeric") {
                abline(v = sig, col = 2, lty = 3)
            }
            else {
                plot(sig, col = 2, lty = 3, add = TRUE)
            }
            legend("topright", c("Fuzzy p-value", "Significance level"), 
                col = c(1, 2), text.col = 1, lwd = c(1, 1), lty = c(1, 3),
                bty = "n")
        }
        else {
            if (fig == 3) {
                P = f2apply(t, H0b, p.value, knot.n = knot.n, 
                  type = "l", I.O.plot = TRUE, ...)
                x = t
                y = H0b
            }
        }
    }
    if (class(sig) == "numeric") {
        sig <- TriangularFuzzyNumber(sig, sig, sig)
    }
    P_L = P$cuts[, "L"]
    P_L = P_L[length(P_L):1]
    P_U = P$cuts[, "U"]
    P_U = P_U[length(P_U):1]
    S_L = alphacut(sig, round(seq(0, 1, len = knot.n), 5))[, 
        "L"]
    S_U = alphacut(sig, round(seq(0, 1, len = knot.n), 5))[, 
        "U"]
    Int1 = (P_U - S_L) * (P_U > S_L)
    Int2 = (P_L - S_U) * (P_L > S_U)
    Arz = 1/(knot.n - 1)
    Integral1 <- (sum(Int1) - Int1[1]/2 - Int1[length(Int1)]/2) * 
        Arz
    Integral2 <- (sum(Int2) - Int2[1]/2 - Int2[length(Int2)]/2) * 
        Arz
    Delta_PS = Integral1 + Integral2
    Int3 = (S_U - P_L) * (S_U > P_L)
    Int4 = (S_L - P_U) * (S_L > P_U)
    Integral3 <- (sum(Int3) - Int3[1]/2 - Int3[length(Int3)]/2) * 
        Arz
    Integral4 <- (sum(Int4) - Int4[1]/2 - Int4[length(Int4)]/2) * 
        Arz
    Delta_SP = Integral3 + Integral4
    Degree_P_biger_than_S = Delta_PS/(Delta_PS + Delta_SP)
    Degree_S_biger_than_P = 1 - Degree_P_biger_than_S
    if (Degree_P_biger_than_S >= Degree_S_biger_than_P) {
        result = noquote(paste("The null hypothesis (H0) is accepted with degree D(P>S)=", 
            round(Degree_P_biger_than_S, 4), ", at  the considered significance level."))
        accepted_hypothesis = noquote("H0")
        acceptance_degree = Degree_P_biger_than_S
    }
    else {
        if (Degree_P_biger_than_S < Degree_S_biger_than_P) {
        result = noquote(paste("The althernative hypothesis (H1) is accepted with degree D(S>P)=",
                round(Degree_S_biger_than_P, 4), ", at  the considered significance level."))
            accepted_hypothesis = noquote("H1")
            acceptance_degree = Degree_S_biger_than_P
        }
        else {
            print(noquote(paste0("Impossible case")))
        }
    }
    return(list(result = result, cuts = P$cuts, core = P$core, 
        support = P$support, Delta_PS = as.numeric(Delta_PS), 
        Delta_SP = as.numeric(Delta_SP), Degree_P_biger_than_S = as.numeric(Degree_P_biger_than_S),
        Degree_S_biger_than_P = as.numeric(Degree_S_biger_than_P), 
     accepted_hypothesis = accepted_hypothesis, acceptance_degree = as.numeric(acceptance_degree)))
  }



