library(ade4)


### Name: reconst
### Title: Reconstitution of Data from a Duality Diagram
### Aliases: reconst reconst.pca reconst.coa
### Keywords: multivariate

### ** Examples

data(rhone)
dd1 <- dudi.pca(rhone$tab, nf = 2, scann = FALSE)
rh1 <- reconst(dd1, 1)
rh2 <- reconst(dd1, 2)
par(mfrow = c(4,4))
par(mar = c(2.6,2.6,1.1,1.1))
for (i in 1:15) {
    plot(rhone$date, rhone$tab[,i])
    lines(rhone$date, rh1[,i], lty = 2)
    lines(rhone$date, rh2[,i], lty = 1)
    ade4:::scatterutil.sub(names(rhone$tab)[i], 2, "topright")}

data(chats)
chatsw <- data.frame(t(chats))
chatscoa <- dudi.coa(chatsw, scann = FALSE)
model0 <- reconst(chatscoa, 0)
round(model0,3)
round(chisq.test(chatsw)$expected,3)
chisq.test(chatsw)$statistic
sum(((chatsw-model0)^2)/model0)
effectif <- sum(chatsw)
sum(chatscoa$eig)*effectif
model1 <- reconst(chatscoa, 1)
round(model1, 3)
sum(((chatsw-model1)^2)/model0)
sum(chatscoa$eig[-1])*effectif



