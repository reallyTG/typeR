library(OIdata)


### Name: OIdata-package
### Title: Data sets and supplements (OpenIntro)
### Aliases: OIdata-package OIdata
### Keywords: package

### ** Examples

data(military)
(tabFM <- table(military$branch, military$gender) /
          matrix(rep(table(military$branch), 2), ncol = 2))
barplot(tabFM[,1], main = "proportion female")

data(piracy)
pipa     <- piracy[piracy$chamber == "senate",]
keep     <- pipa$money_pro > 0 & pipa$money_con > 0
for_pipa <- pipa$stance[keep] == "yes"
col      <- ifelse(for_pipa, 2, 1)
pch      <- ifelse(for_pipa, 20, 1)
plot(pipa$money_pro[keep], pipa$money_con[keep],
     log="xy", col=col, pch=pch)



