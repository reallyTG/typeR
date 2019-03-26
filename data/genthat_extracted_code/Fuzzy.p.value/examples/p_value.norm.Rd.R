library(Fuzzy.p.value)


### Name: p_value.norm
### Title: Testing hypotheses based on fuzzy p-value for Normal
###   distribution
### Aliases: p_value.norm
### Keywords: Fuzzy p-value Fuzzy significance level Fuzzy data Fuzzy
###   hypothesis Normal test Package "FuzzyNumbers" Fuzzy ranking method

### ** Examples

# Example 1 from Springer chapter book 2016
p_value.norm( kind=2, H0=T(1300,1300,1300), H1=B(1300,1300), t=T(1288,1313,1331), s.d=30, 
n=10, sig=T(0,0.05,0.1) )

# Solving Example 2 from Springer chapter book 2016
p_value.norm( kind=0, H0=T(1300,1300,1300), H1=B(1300,1300), t=T(1300,1313,1321), s.d=30, 
n=10, sig=T(0,0.15,0.3) )

# Solving Example 4 from Springer chapter book 2016
H0 = T(1275,1300,1325) #  Fuzzy null hypothesis
H1 = B(1275,1325) #  Fuzzy althernative hypothesis
t = T(1315,1327,1342) #  Fuzzy observed value for the test statistics
sig = T(0.0,0.15,0.3) #  Fuzzy significance level
p_value.norm( kind=2, H0, H1, t, s.d=120, n=36, sig)

# Solving Example 6 from Springer chapter book 2016
H0 = T(1275,1300,1325)
H1 = B(1275,1325)
t = T(1327,1327,1327) #  Crisp observed value for the test statistics
sig = T(0, .05, .1)
p_value.norm( kind=2, H0, H1, t, s.d=120, n=36, sig)


## The function is currently defined as
function (kind, H0, H1, t, s.d, n, sig) 
{
    alpha_L = seq(0, 1, 0.01)
    alpha_U = seq(1, 0, -0.01)
    if (kind == 1) {
        p_L = pnorm(alphacut(t, alpha_L)[, "U"], alphacut(H0, 
            alpha_L)[, "L"], s.d/(n^0.5))
        p_U = pnorm(alphacut(t, alpha_U)[, "L"], alphacut(H0, 
            alpha_U)[, "U"], s.d/(n^0.5))
    }
    else if (kind == 2) {
        p_L = 1 - pnorm(alphacut(t, alpha_L)[, "U"], alphacut(H0, 
            alpha_L)[, "L"], s.d/(n^0.5))
        p_U = 1 - pnorm(alphacut(t, alpha_U)[, "L"], alphacut(H0, 
            alpha_U)[, "U"], s.d/(n^0.5))
    }
    else if (supp(t)[1] >= supp(H0)[2]) {
        p_L = 2 * (1 - pnorm(alphacut(t, alpha_L)[, "U"], alphacut(H0, 
            alpha_L)[, "L"], s.d/(n^0.5)))
        p_U = 2 * (1 - pnorm(alphacut(t, alpha_U)[, "L"], alphacut(H0, 
            alpha_U)[, "U"], s.d/(n^0.5)))
    }
    else if (supp(t)[2] <= supp(H0)[1]) {
        p_L = 2 * pnorm(alphacut(t, alpha_L)[, "U"], alphacut(H0, 
            alpha_L)[, "L"], s.d/(n^0.5))
        p_U = 2 * pnorm(alphacut(t, alpha_U)[, "L"], alphacut(H0, 
            alpha_U)[, "U"], s.d/(n^0.5))
    }
    else {
        return("The fuzzy p-value can not defined for this example, since the fuzziness of 
		the problem is very high. This case may be accured for the testing equality 
		fuzzy null hypothesis, against the non-equality fuzzy althenative hypothesis")
    }
    alpha = cbind(alpha_L, alpha_U)
    p = cbind(p_L, p_U)
    plot(p, alpha, type = "l", lwd = 3, col = 1, xlim = c(-0.04, 
        1.02))
     s1 = supp(sig)[1]
     s2 = core(sig)[1]
     s3 = core(sig)[1]
     s4 = supp(sig)[2]
     lines( c(0,s1,s2,s3,s4,1), c(0,0,1,1,0,0), type='l', lty=3, lwd=2, col=2 )
# plot(sig, lty=3, lwd=2, col=2, add=TRUE) # Conflict importing 2 plot from different packages
    legend("topright", c("Fuzzy p-value", "Significance level"), 
        col = c(1, 2), text.col = 1, lwd = c(3, 2), lty = c(1, 
            3))
     if( class(sig) == "numeric" ){
            sig <- TriangularFuzzyNumber(sig, sig, sig)
            }
     P_L = p_L
     P_U = p_U
     knot.n = 100
     S_L = alphacut(sig, round(seq(0, 1, .01), 5))[,"L"]
     S_U = alphacut(sig, round(seq(0, 1, .01), 5))[,"U"]
     Int1 = ( P_U - S_L ) * ( P_U > S_L )
     Int2 = ( P_L - S_U ) * ( P_L > S_U )
     Arz = 1 / (knot.n - 1)  #Arze Mostatilha baraye mohasebe-ye Integral
     Integral1 <- ( sum( Int1 ) - Int1[1]/2 - Int1[length(Int1)]/2 ) *Arz
     Integral2 <- ( sum( Int2 ) - Int2[1]/2 - Int2[length(Int2)]/2 ) *Arz
     Delta_PS = Integral1 + Integral2
     Int3 = ( S_U - P_L ) * ( S_U > P_L )
     Int4 = ( S_L - P_U ) * ( S_L > P_U )
     Integral3 <- ( sum( Int3 ) - Int3[1]/2 - Int3[length(Int3)]/2 ) *Arz
     Integral4 <- ( sum( Int4 ) - Int4[1]/2 - Int4[length(Int4)]/2 ) *Arz
     Delta_SP = Integral3 + Integral4
    print("Delta_SP = ")
    print(Delta_SP)
    print("Delta_PS = ")
    print(Delta_PS)
    Degree_P_biger_than_S = Delta_PS/(Delta_PS + Delta_SP)
    Degree_S_biger_than_P = 1 - Degree_P_biger_than_S
    if (Degree_P_biger_than_S >= Degree_S_biger_than_P) {
        a = "The null hypothesis (H0) is accepted with degree D(P>S)="
        b = round(Degree_P_biger_than_S, 4)
        c = ", at  the considered significance level."
        noquote(sprintf("%s %s %s ", a, b, c))
    }
    else {
        if (Degree_P_biger_than_S < Degree_S_biger_than_P) {
            a = "The althernative hypothesis (H1) is accepted with degree D(S>P)="
            b = round(Degree_S_biger_than_P, 4)
            c = ", at  the considered significance level."
            noquote(sprintf("%s %s %s ", a, b, c))
        }
        else {
            return(noquote(paste0("Impossible case")))
        }
    }
  }



