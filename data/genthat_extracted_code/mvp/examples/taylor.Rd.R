library(mvp)


### Name: taylor
### Title: Taylor series
### Aliases: taylor mvp_taylor_allvars mvp_taylor_onevar
###   mvp_taylor_onepower_onevar onevarpow
### Keywords: symbolmath

### ** Examples

taylor(as.mvp("1+x")^6,2)

taylor(as.mvp("1+x+y")^3,2)      # neglects all terms with total power>2
taylor(as.mvp("1+x+y")^3,2,"x")  # terms like y^3 are treated as constants

p <- horner("x+y",1:4)

onevarpow(p,3,"x")

# Works well with pipes:


p %>% taylor(2)
p %>% taylor(2,"x")
(p %>% subs(x="x+dx") -p) %>% taylor(2,"dx")


## Third order taylor expansion of f(x)=sin(x+y) for x=1.1, about x=1:
sinxpy <- horner("x+y",c(0,1,0,-1/6,0,+1/120,0,-1/5040,0,1/362880))  # sin(x+y)
dx <- as.mvp("dx")
t3 <- sinxpy  + aderiv(sinxpy,x=1)*dx + aderiv(sinxpy,x=2)*dx^2/2 + aderiv(sinxpy,x=3)*dx^3/6
t3 %<>% subs(x=1,dx=0.1)  # t3 = Taylor expansion of sin(y+1.1)
t3 %>% subs(y=0.3)  - sin(1.4)  # numeric; should be small





