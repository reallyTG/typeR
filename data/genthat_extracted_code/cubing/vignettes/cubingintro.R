### R code from vignette source 'cubingintro.Rnw'

###################################################
### code chunk number 1: cubingintro.Rnw:51-52
###################################################
options(width=70)


###################################################
### code chunk number 2: cubingintro.Rnw:55-58
###################################################
library(cubing)
hello.cube <- getCubieCube()
hello.cube


###################################################
### code chunk number 3: cubingintro.Rnw:63-66
###################################################
aCube <- getCubieCube("Superflip")
bCube <- getCubieCube("EasyCheckerboard") 
cCube <- getCubieCube("HenrysSnake")


###################################################
### code chunk number 4: sflip1
###################################################
plot(aCube)


###################################################
### code chunk number 5: cubingintro.Rnw:77-78
###################################################
plot(aCube)


###################################################
### code chunk number 6: cubingintro.Rnw:90-91
###################################################
getOption("cubing.colors")


###################################################
### code chunk number 7: cubingintro.Rnw:98-101
###################################################
mycol <- c("yellow", "dodgerblue", "red", 
           "ghostwhite", "limegreen", "orange")
options(cubing.colors = mycol)


###################################################
### code chunk number 8: cubingintro.Rnw:106-109
###################################################
jcol <- c("ghostwhite", "red", "limegreen", 
          "dodgerblue", "orange", "yellow")
options(cubing.colors = jcol)


###################################################
### code chunk number 9: cubingintro.Rnw:114-117
###################################################
acol <- c("black", "darkred", "darkgreen",
          "yellow", "orange", "purple")
options(cubing.colors = acol)


###################################################
### code chunk number 10: cubingintro.Rnw:122-125
###################################################
ocol <- c("ghostwhite", "red", "limegreen",
          "yellow", "orange", "dodgerblue")
options(cubing.colors = ocol)


###################################################
### code chunk number 11: cubingintro.Rnw:133-136 (eval = FALSE)
###################################################
## aCube <- randCube()
## plot(aCube)
## plot3D(aCube)


###################################################
### code chunk number 12: cubingintro.Rnw:145-146 (eval = FALSE)
###################################################
## aCube <- getMovesCube("RU'F2")


###################################################
### code chunk number 13: cubingintro.Rnw:153-155 (eval = FALSE)
###################################################
## rCube <- randCube()
## rCube <- rCube %v% aCube


###################################################
### code chunk number 14: cubingintro.Rnw:166-170 (eval = FALSE)
###################################################
## aCube <- getCubieCube("Anaconda") %v% getCubieCube("FourSpots")
## bCube <- getCubieCube("FourSpots") %v% getCubieCube("Anaconda")
## plot3D(aCube)
## plot3D(bCube)


###################################################
### code chunk number 15: cubingintro.Rnw:178-179
###################################################
rCube <- getMovesCube(randMoves(1, nm = 22))


###################################################
### code chunk number 16: cubescheme
###################################################
plot(getCubieCube(), numbers = TRUE, blank = TRUE)


###################################################
### code chunk number 17: cubingintro.Rnw:194-195
###################################################
plot(getCubieCube(), numbers = TRUE, blank = TRUE)


###################################################
### code chunk number 18: cubingintro.Rnw:205-208
###################################################
aCube <- getCubieCube("Wire")
bCube <- cubieCube("UUUUUUUUU RLLRRRLLR BBFFFFFBB
                    DDDDDDDDD LRRLLLRRL FFBBBBBFF")


###################################################
### code chunk number 19: cubingintro.Rnw:215-217
###################################################
cCube <- cubieCube("UUUUUUUU RLLRRLLR BBFFFFBB
                    DDDDDDDD LRRLLRRL FFBBBBFF")


###################################################
### code chunk number 20: cubingintro.Rnw:222-227 (eval = FALSE)
###################################################
## cubieCube("UUUUUUUUU RLLRRRLLR BBFFFFFBB DDDDDDDDD LRRLLLRRL FFBBBBBF")
## cubieCube("UUUUUUUUU RLLRRRLLR BBFFFFFBB DDDDDDDDD LRRLLLRRL FFBBBBBFU")
## cubieCube("UUUUUUUUU RLLRRRLLR BBFFFFFBB DDDDDDDDD LRRLBLRRL FFBBLBBFF")
## cubieCube("UUUUUUUUU RLLRRRLLR BBFFFFFBB DDDDDDDDD LRRLLLRRF FFBBBBBFL")
## cubieCube("UUUUUUUUU RLLRRRLLR BBFFFFFBB DDDDDDDDD LRRLLBRRL FFBBBLBFF")


###################################################
### code chunk number 21: cubingintro.Rnw:261-264
###################################################
aCube <- randCube()
aCube
as.stickerCube(aCube)


###################################################
### code chunk number 22: cubingintro.Rnw:284-285
###################################################
sum(sapply(randCube(100, solvable = FALSE), is.solvable))


###################################################
### code chunk number 23: cubingintro.Rnw:290-292
###################################################
rCube <- randCube(1, solvable = FALSE)
is.solvable(rCube, split = TRUE)


###################################################
### code chunk number 24: cubingintro.Rnw:331-342
###################################################
tcon <- textConnection("D2 F2 U F2 D R2 D B L' B R U L R U L2 F L' U'" ) 
aCube <- getMovesCube(scan(tcon, what = character())) 
close(tcon)
tcon <- textConnection("x2 // inspection
D' R' L2' U' F U' F' D' U' U' R' // XXcross
y' R' U' R // 3rd pair
y' R U' R' U' R U R' // 4th pair
U' R' U' F' U F R // OLL(CP)
U' // AUF") 
mv <- scan(tcon, what = character(), comment.char = "/") 
close(tcon)


###################################################
### code chunk number 25: cubingintro.Rnw:368-370
###################################################
result <- move(aCube, mv)
is.solved(result)


###################################################
### code chunk number 26: cubingintro.Rnw:384-385
###################################################
scramble(3, state = TRUE)


###################################################
### code chunk number 27: cubingintro.Rnw:398-400 (eval = FALSE)
###################################################
## res.seq <- move(aCube, mv, history = TRUE)
## plot(res.seq)


###################################################
### code chunk number 28: cubingintro.Rnw:403-404
###################################################
res.seq <- move(aCube, mv, history = TRUE)


###################################################
### code chunk number 29: cubingintro.Rnw:411-415 (eval = FALSE)
###################################################
## res.seq <- move(aCube, mv, history = TRUE)
## pdf("flick.pdf")
## plot(res.seq, title = "SeungBeom Cho\nWorld Record Solve\n4.59")
## dev.off()


###################################################
### code chunk number 30: cubingintro.Rnw:423-424 (eval = FALSE)
###################################################
## animate(aCube, mv)


###################################################
### code chunk number 31: cubingintro.Rnw:429-430 (eval = FALSE)
###################################################
## animate(aCube, mv, movie = "wrecord")


###################################################
### code chunk number 32: cubingintro.Rnw:471-472
###################################################
rCubes <- rotations(randCube())


###################################################
### code chunk number 33: cubingintro.Rnw:475-477 (eval = FALSE)
###################################################
## rCubes <- rotations(randCube())
## plot(rCubes)


###################################################
### code chunk number 34: cubingintro.Rnw:484-488 (eval = FALSE)
###################################################
## rCubes <- rotations(randCube())
## pdf("rotations.pdf")
## plot(rCubes)
## dev.off()


###################################################
### code chunk number 35: cubingintro.Rnw:495-502
###################################################
aCube <- getCubieCube("EasyCheckerboard")
bCube <- move(aCube, "x2")
all.equal(aCube, bCube)  # rotation equivalent ?
aCube == bCube  # recoloring equivalent ?  
identical(aCube, bCube)  # identical ?
identical(aCube, getMovesCube("U2D2R2L2F2B2"))  # identical ?
identical(aCube, invCube(aCube))  # self-inverse ?


###################################################
### code chunk number 36: cubingintro.Rnw:512-516
###################################################
aCube <- getCubieCube("BlackMamba")
solver(aCube, divide = TRUE)
tCube <- getCubieCube("EasyCheckerboard")
solver(aCube, tCube, collapse = "-")


###################################################
### code chunk number 37: cubingintro.Rnw:525-527 (eval = FALSE)
###################################################
## tp <- microbenchmark(solver(randCube()), times = 100000)
## round(quantile(tp$time/10^6, prob = c(0,.01,seq(.05,.95,.05),.99,1)))


###################################################
### code chunk number 38: cubingintro.Rnw:543-545
###################################################
solver(randCube(), type = "ZT")
solver(randCube(), type = "TF")


