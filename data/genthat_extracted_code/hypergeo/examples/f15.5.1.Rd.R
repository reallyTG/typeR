library(hypergeo)


### Name: f15.5.1
### Title: Hypergeometric functions via direct numerical integration
### Aliases: f15.5.1 f15.5.1 hypergeo_press hypergeo_func to_real
###   to_complex complex_ode semicircle semidash straight straightdash

### ** Examples


hypergeo_press(A=pi,B=sqrt(2),C=1.4,z=1-2i)
hypergeo      (A=pi,B=sqrt(2),C=1.4,z=1-2i)


jj1 <- 
f15.5.1(
    A=1.1, B=2.2, C=3.3, z=3+0.5i, startz=0.5,
        u    =function(u){semicircle(u,0.5,3+0.5i,FALSE)},
        udash=function(u){semidash(u,0.5,3+0.5i,FALSE)}
        )

jj2 <-
f15.5.1(
    A=1.1, B=2.2, C=3.3, z=3+0.5i, startz=0.5,
        u    =function(u){semicircle(u,0.5,3+0.5i,TRUE)},
        udash=function(u){semidash(u,0.5,3+0.5i,TRUE)}
        )



jj3 <- hypergeo(    A=1.1, B=2.2, C=3.3, z=3+0.5i)
## First one agrees with jj3=hypergeo(...), the second one does not 


# Now try the Airy Ai function;  satisfies f'' =  zf:

pars <- c(kay = 1+1i, ell = 0.1+0.2i)  # not actually used
airy_ai_func <- function(Time, State, Pars, u, udash) {
    with(as.list(c(to_complex(State), to_complex(Pars))), {

      z <- u(Time)
      dz <- udash(Time)
        
      dF <- Fdash*dz
      dFdash <-  z*F*dz # could use kay and ell from pars here if necessary
        
        ## coerce back to real:
        out <- to_real(c(dF,dFdash))
        names(out) <- names(State)
        return(list(out))
    })
}

complex_ode(
    y     = c(F = 1/3^(2/3)/gamma(2/3), Fdash= -1/3^(1/3)/gamma(1/3)),
    times = seq(0,1,by=0.1),
    func  = airy_ai_func,
    parms = pars,
    u     = function(t){straight(t,0,1)},
    udash = function(t){straightdash(t,0,1)}
)

# Look at the last line for the value at 1.
# compare gsl: Ai(1) = 0.1352924 ; Ai'(1) = -0.1591474

# ...although in this case there is actually a hypergeometric series
#  representation:

f <- function(z){
    return(
        +genhypergeo(U=NULL,L=2/3,z^3/9)/3^(2/3)/gamma(2/3)
        -genhypergeo(U=NULL,L=4/3,z^3/9)/3^(1/3)/gamma(1/3)*z
        ) 
}

f(1)




