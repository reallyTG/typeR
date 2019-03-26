library(multivator)


### Name: apart
### Title: Decompose a matrix with multiple columns of dependent variables
### Aliases: apart

### ** Examples


data(e3mg)
apart(e3mg , 6:7)

a <- round(emulator::latin.hypercube(6,5),2)
rownames(a) <- c("first","second","third","fourth","fifth","sixth")
colnames(a) <- c(letters[1:3],"length","depth")
jj_expt <- apart(a,4:5)    # use of apart()

x <- get_mdm(jj_expt[c(1,7)])
xold(x) <- 0.5

multem(x,jj_expt,hp=as.mhp(x),give=TRUE)




