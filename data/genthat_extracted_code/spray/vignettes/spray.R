### R code from vignette source 'spray.Rnw'

###################################################
### code chunk number 1: setup
###################################################
ignore <- require(spray)
options(prompt = "R> ", continue = "+  ", width = 70, useFancyQuotes = FALSE)


###################################################
### code chunk number 2: array_a
###################################################
a <- array(1, dim=2:5)


###################################################
### code chunk number 3: define_S
###################################################
library("spray")
M <- matrix(c(0, 0, 0, 1, 0, 0, 1, 1, 1, 2, 0, 3), ncol=3)
M
S1 <- spray(M, 1:4)
S1


###################################################
### code chunk number 4: use_set_and_extractor_methods
###################################################
S1[diag(3)] <- -3
S1


###################################################
### code chunk number 5: define_S1
###################################################
M2 <- matrix(c(
    6, -7,  8,
    0,  0,  2,
    1,  1,  3), byrow=TRUE, ncol=3)
S2 <- spray(M2, c(17, 11 ,-4))
S2
S1 <- S1 + S2
S1


###################################################
### code chunk number 6: polynom_example
###################################################
library("polynom")
A <- polynomial(c(1, 0, 0, 2, 0, 0, 0, 0, 6))
dput(A)
A


###################################################
### code chunk number 7: show_S1_again
###################################################
S3 <- spray(matrix(c(0,0,0, 0,0,1, 1,1,1, 3,0,0), byrow=TRUE, ncol=3), 1:4)
S3


###################################################
### code chunk number 8: show_a_multivariate_polynomial
###################################################
options(polyform = TRUE)
S1


###################################################
### code chunk number 9: exhibit.multiplication
###################################################
S1 + S2
S1 * S2
S1^2


###################################################
### code chunk number 10: symbolic
###################################################
x <- lone(1, 3)
y <- lone(2, 3)
z <- lone(3, 3)
options(polyform = FALSE)
list(x, y, z)
options(polyform = TRUE)
(1 + x + y)^3
(x + y) * (y + z) * (x + z) - (x + y + z) * (x*y + x*z + y*z)
(x + y) * (x - y) - (x^2 - y^2)


###################################################
### code chunk number 11: exhibit.function.coercion
###################################################
(S4 <- spray(cbind(1:3, 3:1), 1:3))
f <- as.function(S4)
f(c(1, 2))


###################################################
### code chunk number 12: homog_show
###################################################
(S5 <- homog(3, 3))


###################################################
### code chunk number 13: subsy5
###################################################
subs(S5, 2, 5)


###################################################
### code chunk number 14: spray.Rnw:335-336
###################################################
aderiv((xyz(3) + linear(1:3))^3, 1:3)


###################################################
### code chunk number 15: spray.Rnw:377-379
###################################################
d <- 2
kernel <- spray(rbind(0, diag(d), -diag(d)))/(1 + 2*d)


###################################################
### code chunk number 16: spray.Rnw:385-386
###################################################
initial <- spray(rep(10, d))


###################################################
### code chunk number 17: spray.Rnw:392-393
###################################################
t14 <- initial * kernel^14


###################################################
### code chunk number 18: spray.Rnw:399-402
###################################################

traps <- matrix(c(2, 3, 3, 5), 2, 2)
n <- 17


###################################################
### code chunk number 19: spray.Rnw:407-413
###################################################
timestep <- function(state, kernel, traps){
  state <- state * kernel
  state <- spray(index(state)%%n, value(state), addrepeats = TRUE)
  state[traps] <- 0
  return(state)
}


###################################################
### code chunk number 20: spray.Rnw:422-425
###################################################
state <- initial
for(i in 1:100){state <- timestep(state, kernel, traps)}
sum(value(state))


###################################################
### code chunk number 21: knight_generating_function
###################################################
chess_knight <- 
  spray(matrix(
      c(1, 2, 1, -2, -1, 2, -1, -2, 2, 1, 2, -1, -2, 1, -2, -1),
      byrow = TRUE,ncol = 2))
options(polyform = FALSE)
chess_knight
options(polyform = TRUE)
chess_knight


###################################################
### code chunk number 22: knight_six_moves
###################################################
constant(chess_knight^6, drop = TRUE)


###################################################
### code chunk number 23: define.d.dimensional.knight
###################################################
knight <- function(d){
  n <- d * (d - 1)
  out <- matrix(0, n, d)
  out[cbind(rep(seq_len(n), each=2), c(t(which(diag(d)==0, arr.ind=TRUE))))] <- seq_len(2)
  spray(rbind(out, -out, `[<-`(out, out==1, -1),`[<-`(out, out==2, -2)))
}


###################################################
### code chunk number 24: dnightmoves
###################################################
constant(knight(4)^6, drop = TRUE)


###################################################
### code chunk number 25: dnightmoves_can_wait
###################################################
constant((1 + knight(4))^6, drop=TRUE)


###################################################
### code chunk number 26: spray.Rnw:561-565
###################################################
a <- diag(26)
options(sprayvars = letters)
a[1 + cbind(0:25, 1:26) %% 26] <- 2
spray(a)


