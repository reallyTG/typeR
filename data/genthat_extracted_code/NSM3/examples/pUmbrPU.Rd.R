library(NSM3)


### Name: pUmbrPU
### Title: Mack-Wolfe Peak Unknown
### Aliases: pUmbrPU
### Keywords: Mack-Wolfe Peak Unknown

### ** Examples

##Hollander-Wolfe-Chicken Example 6.4 Learning Comprehension and Age
wechsler<-list("16-19"=c(8.62,9.94,10.06),"20-34"=c(9.85,10.43,11.31),"35-54"=c(9.98,10.69,11.40),
"55-69"=c(9.12,9.89,10.57),"70+"=c(4.80,9.18,9.27))

#pUmbrPU(wechsler,method="Monte Carlo",n.mc=20000)
pUmbrPU(wechsler,method="Monte Carlo",n.mc=1000)



