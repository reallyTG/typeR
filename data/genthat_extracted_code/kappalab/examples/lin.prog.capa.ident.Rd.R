library(kappalab)


### Name: lin.prog.capa.ident
### Title: Capacity identification based on linear programming
### Aliases: lin.prog.capa.ident
### Keywords: math

### ** Examples

## some alternatives
a <- c(18,11,18,11,11)
b <- c(18,18,11,11,11)
c <- c(11,11,18,18,11)
d <- c(18,11,11,11,18)
e <- c(11,11,18,11,18)
    
## preference threshold relative
## to the preorder of the alternatives
delta.C <- 1

## corresponding Choquet preorder constraint matrix 
Acp <- rbind(c(d,a,delta.C),
             c(a,e,delta.C),
             c(e,b,delta.C),
             c(b,c,delta.C)
            )

## a Shapley preorder constraint matrix
## Sh(1) - Sh(2) >= -delta.S
## Sh(2) - Sh(1) >= -delta.S
## Sh(3) - Sh(4) >= -delta.S
## Sh(4) - Sh(3) >= -delta.S
## i.e. criteria 1,2 and criteria 3,4
## should have the same global importances
delta.S <- 0.01    
Asp <- rbind(c(1,2,-delta.S),
             c(2,1,-delta.S),
             c(3,4,-delta.S),
             c(4,3,-delta.S)
            )

## a Shapley interval constraint matrix
## 0.3 <= Sh(1) <= 0.9 
Asi <- rbind(c(1,0.3,0.9))


## an interaction preorder constraint matrix
## such that I(12) = I(34)
delta.I <- 0.01
Aip <- rbind(c(1,2,3,4,-delta.I),
             c(3,4,1,2,-delta.I))

## an interaction interval constraint matrix
## i.e. -0.20 <= I(12) <= -0.15 
Aii <- rbind(c(1,2,-0.2,-0.15))


## Not run: 
##D ## a LP 2-additive solution
##D lin.prog <- lin.prog.capa.ident(5,2,A.Choquet.preorder = Acp)              
##D m <- lin.prog$solution
##D m
##D 
##D ## the resulting global evaluations
##D rbind(c(a,mean(a),Choquet.integral(m,a)),
##D       c(b,mean(b),Choquet.integral(m,b)),
##D       c(c,mean(c),Choquet.integral(m,c)),
##D       c(d,mean(d),Choquet.integral(m,d)),
##D       c(e,mean(e),Choquet.integral(m,e)))
##D 
##D ## the Shapley value
##D Shapley.value(m)
##D 
##D ## a LP 3-additive more constrained solution
##D lin.prog2 <- lin.prog.capa.ident(5,3,
##D                                    A.Choquet.preorder = Acp,
##D                                    A.Shapley.preorder = Asp)
##D m <- lin.prog2$solution
##D m
##D rbind(c(a,mean(a),Choquet.integral(m,a)),
##D       c(b,mean(b),Choquet.integral(m,b)),
##D       c(c,mean(c),Choquet.integral(m,c)),
##D       c(d,mean(d),Choquet.integral(m,d)),
##D       c(e,mean(e),Choquet.integral(m,e)))
##D Shapley.value(m)
##D 
##D ## a LP 5-additive more constrained solution
##D lin.prog3 <- lin.prog.capa.ident(5,5,
##D                                    A.Choquet.preorder = Acp,
##D                                    A.Shapley.preorder = Asp,
##D                                    A.Shapley.interval = Asi,
##D                                    A.interaction.preorder = Aip,
##D                                    A.interaction.interval = Aii)
##D 
##D m <- lin.prog3$solution
##D m
##D rbind(c(a,mean(a),Choquet.integral(m,a)),
##D       c(b,mean(b),Choquet.integral(m,b)),
##D       c(c,mean(c),Choquet.integral(m,c)),
##D       c(d,mean(d),Choquet.integral(m,d)),
##D       c(e,mean(e),Choquet.integral(m,e)))
##D summary(m)
## End(Not run)



