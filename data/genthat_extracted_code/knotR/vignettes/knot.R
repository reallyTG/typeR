### R code from vignette source 'knot.Rnw'

###################################################
### code chunk number 1: setup
###################################################
ignore <- require(knotR)


###################################################
### code chunk number 2: use_reader_k76
###################################################
k76 <- reader(system.file("7_6_first_draft.svg",package="knotR"))
head(k76)


###################################################
### code chunk number 3: 7_6_rough
###################################################
par(oma=c(0, 0, 0, 0))
par(mar=c(0, 0, 0, 0))
par(plt=c(0, 1, 0, 1))
k76_rough <- reader(system.file("7_6_first_draft.svg",package="knotR"))
knotplot2(k76_rough, seg=TRUE)


###################################################
### code chunk number 4: knot.Rnw:205-211
###################################################
par(oma=c(0, 0, 0, 0))
par(mar=c(0, 0, 0, 0))
par(plt=c(0, 1, 0, 1))
par(pty='m')

knotplot2(k7_6,text=TRUE,lwd=1,circ=0,rainbow=TRUE)


###################################################
### code chunk number 5: k76_desiderata
###################################################
b <- as.controlpoints(k76_rough)
total_crossing_angles(b)
total_bending_energy(b)


###################################################
### code chunk number 6: k76_rough_badness
###################################################
badness(k76_rough)


###################################################
### code chunk number 7: k76_knotplot2
###################################################
knotplot2(k7_6)


###################################################
### code chunk number 8: k76_overunder
###################################################
ou76 <- matrix(c(
    12,01,
    02,11,
    07,03,
    04,15,
    16,06,
    14,08,
    10,13
    ),byrow=TRUE,ncol=2)


###################################################
### code chunk number 9: knot.Rnw:294-295
###################################################
knotplot(k7_6,ou76)


###################################################
### code chunk number 10: setup_figure_eight_symmetry_object
###################################################
fig8 <- reader(system.file("4_1_first_draft.svg",package="knotR"))
Mver8 <- matrix(c(
    02,03,
    09,07,
    05,11,
    10,06
    ),ncol=2,byrow=TRUE)

sym8 <- symmetry_object(fig8, Mver=Mver8, xver=8)


###################################################
### code chunk number 11: four_figure_eight_knots
###################################################
par(oma=c(0, 0, 0, 0))
par(mar=c(0, 0, 0, 0))
par(plt=c(0, 1, 0, 1))
par(pty='m')
plot(NULL,xlim=c(-600,2200),ylim=c(-600,2200),asp=1,axes=FALSE)

offx <- 1400
offy <- 1500

overunder_fig8 <- 
  matrix(c(
      05,10,
      08,13,
      01,06,
      11,02
      ),ncol=2,byrow=TRUE)

jj <- sweep(as.inkscape(fig8),2,c(0,offy),"+")
knotplot2(jj,setup=FALSE,node=TRUE,lwd=3,circ=0) # top left

fig8_symmetrized <- symmetrize(fig8,sym8)
jj <- sweep(as.inkscape(fig8_symmetrized),2,c(offx,offy),"+")
knotplot2(jj,setup=FALSE,node=FALSE,width=TRUE)  # top right

jj <- sweep(as.inkscape(k4_1),2,c(0,0),"+")
knotplot2(jj,setup=FALSE,node=FALSE,width=TRUE)  # lower left

jj <- sweep(as.inkscape(k4_1),2,c(offx,0),"+")
knotplot(jj,overunder_fig8,setup=FALSE,gap=50)  # lower right



###################################################
### code chunk number 12: k5_1
###################################################
knotplot2(k5_1,node=TRUE,width=FALSE)


###################################################
### code chunk number 13: setup_symmetry_k5_1
###################################################
sym51 <- symmetry_object(k5_1,
                         Mver = cbind(11,13),
                         xver = c(2,12),
                         Mrot = rbind(
                             c(12,04,16,08,20),
                             c(13,05,17,09,01),
                             c(11,03,15,07,19),
                             c(02,14,06,18,10)
                         ))


###################################################
### code chunk number 14: perko_A_and_B
###################################################
par(oma=c(0, 0, 0, 0))
par(mar=c(0, 0, 0, 0))
par(plt=c(0, 1, 0, 1))
par(pty='m')
plot(NULL,xlim=c(-700,2200),ylim=c(-1800,200),asp=1,box=FALSE)

jjA <- as.inkscape(perko_A)*1.7
jjB <- as.inkscape(perko_B)*1.7

oA <- perko_A$overunder
oB <- perko_B$overunder

knotplot(jjA,ou=oA,setup=FALSE,gap=50,lwd=4)
jjB <- sweep(as.inkscape(jjB),2,c(1500,-600),"+")
knotplot(jjB,ou=oB,setup=FALSE,gap=50,lwd=4)


###################################################
### code chunk number 15: ornamental
###################################################
par(oma=c(0, 0, 0, 0))
par(mar=c(0, 0, 0, 0))
par(plt=c(0, 1, 0, 1))
par(pty='m')
knotplot(ornamental20,gap=20)


###################################################
### code chunk number 16: 10123
###################################################
par(oma=c(0, 0, 0, 0))
par(mar=c(0, 0, 0, 0))
par(plt=c(0, 1, 0, 1))
par(pty='m')
knotplot(k10_123,gap=20)


###################################################
### code chunk number 17: alleightcrossingknots
###################################################
par(oma=c(0, 0, 0, 0))
par(mar=c(0, 0, 0, 0))
par(plt=c(0, 1, 0, 1))
par(pty='m')

a <-
    list(k8_1, k8_2, k8_3,
         k8_4, k8_5, k8_6,
         k8_7, k8_8, k8_9,
         k8_10, k8_11, k8_12,
         k8_13, k8_14, k8_15,
         k8_16, k8_17, k8_18,
         k8_19, k8_20, k8_21)

b <- lapply(a,overunder)

plot(1:10,xlim=c(0,6000),ylim=c(0,12000),asp=1,type='n',axes=F,xlab='',ylab='')

xs <- 1600
ys <- 1600

for(i in 1:3){
    for(j in 1:7){
        n <- (i-1)*7 + j
        xoff <- i*xs
        yoff <- j*ys
        k <- as.inkscape(a[[n]])
        k[,2] <- k[,2] - mean(k[,2])
        k <- sweep(k,2,c(xoff,yoff),"+")
        knotplot(k,b[[n]],setup=FALSE,lwd=2,gap=30)
    }
}


