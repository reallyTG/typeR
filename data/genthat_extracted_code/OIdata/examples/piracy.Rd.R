library(OIdata)


### Name: piracy
### Title: Piracy and PIPA/SOPA
### Aliases: piracy
### Keywords: Congress SOPA PIPA copyright infringement legislation
###   datasets

### ** Examples

data(piracy)

pipa <- piracy[piracy$chamber == "senate",]
tab  <- aggregate(money_pro ~ stance, data = pipa, mean)
barplot(tab$money_pro, names.arg = tab$stance)
boxplot(money_pro ~ stance, data = pipa)
boxplot(money_con ~ stance, data = pipa)

keep     <- pipa$money_pro > 0 & pipa$money_con > 0
for_pipa <- pipa$stance[keep] == "yes"
col      <- ifelse(for_pipa, 2, 1)
pch      <- ifelse(for_pipa, 20, 1)
plot(pipa$money_pro[keep], pipa$money_con[keep],
     log="xy", col=col, pch=pch)



